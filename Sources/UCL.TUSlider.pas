{$LEGACYIFEND ON}

unit UCL.TUSlider;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  Classes,
  Windows, Messages,
  Controls, Graphics;

type
  TUCustomSlider = class(TGraphicControl, IUThemeComponent)
    const
      DefActiveColor: TDefColor = (
        ($D77800, $D77800, $D77800, $CCCCCC, $D77800),
        ($D77800, $D77800, $D77800, $333333, $D77800));
      DefBackColor: TDefColor = (
        ($999999, $666666, $999999, $CCCCCC, $999999),
        ($666666, $999999, $666666, $333333, $666666));
      DefCurColor: TDefColor = (
        ($D77800, $171717, $CCCCCC, $CCCCCC, $D77800),
        ($D77800, $F2F2F2, $767676, $333333, $D77800));

    private
      var CurWidth: Integer;
      var CurHeight: Integer;
      var CurCorner: Integer;
      var BarHeight: Integer;
      var ActiveRect, NormalRect, CurRect: TRect;
      var ActiveColor, BackColor, CurColor: TColor;

      FIsSliding: Boolean;

      FThemeManager: TUThemeManager;
      FControlState: TUControlState;
      FOrientation: TUOrientation;
      FHitTest: Boolean;
      FMin: Integer;
      FMax: Integer;
      FValue: Integer;

      //  Events
      FOnChange: TNotifyEvent;

      //  Internal
      procedure UpdateColors;
      procedure UpdateRects;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetControlState(const Value: TUControlState);
      procedure SetOrientation(const Value: TUOrientation);
      procedure SetMin(const Value: Integer);
      procedure SetMax(const Value: Integer);
      procedure SetValue(const Value: Integer);

      //  Messages
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_MouseMove(var Msg: TWMMouseMove); message WM_MOUSEMOVE;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;
      procedure Resize; override;
      procedure ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND}); override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ControlState: TUControlState read FControlState write SetControlState default csNone;

      property Orientation: TUOrientation read FOrientation write SetOrientation default oHorizontal;
      property IsSliding: Boolean read FIsSliding;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property Min: Integer read FMin write SetMin default 0;
      property Max: Integer read FMax write SetMax default 100;
      property Value: Integer read FValue write SetValue default 0;

      //  Events
      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TUSlider = class(TUCustomSlider)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      //property Caption;
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentBiDiMode;
      property ParentColor;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;
    {$IF CompilerVersion > 29}
      property StyleElements;
    {$IFEND}

      property OnCanResize;
      property OnClick;
      property OnConstrainedResize;
      property OnContextPopup;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      property OnGesture;
      property OnMouseActivate;
      property OnMouseDown;
      property OnMouseEnter;
      property OnMouseLeave;
      property OnMouseMove;
      property OnMouseUp;
      property OnResize;
      property OnStartDock;
      property OnStartDrag;
  end;

implementation

uses
  UCL.Types;

{ TUCustomSlider }

//  THEME

procedure TUCustomSlider.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      if Value <> nil then
        begin
          Value.Connect(Self);
          Value.FreeNotification(Self);
        end;

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSlider.UpdateTheme;
begin
  UpdateColors;
  UpdateRects;
  Repaint;
end;

procedure TUCustomSlider.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  INTERNAL

procedure TUCustomSlider.UpdateColors;
begin
  if ThemeManager = nil then
    begin
      ActiveColor := DefActiveColor[utLight, ControlState];
      BackColor := DefBackColor[utLight, ControlState];
      CurColor := DefCurColor[utLight, ControlState];
    end
  else
    begin
      if Enabled then
        ActiveColor := ThemeManager.AccentColor
      else
        ActiveColor := DefActiveColor[ThemeManager.Theme, ControlState];
      BackColor := DefBackColor[ThemeManager.Theme, ControlState];
      if ControlState = csNone then
        CurColor := ThemeManager.AccentColor
      else
        CurColor := DefCurColor[ThemeManager.Theme, ControlState];
    end;
end;

procedure TUCustomSlider.UpdateRects;
begin
  if Orientation = oHorizontal then
    begin
      ActiveRect.Left := 0;
      ActiveRect.Top := (Height - BarHeight) div 2;
      ActiveRect.Right := Round((Width - CurWidth) * (Value - Min) / (Max - Min));
      ActiveRect.Bottom := ActiveRect.Top + BarHeight;

      NormalRect.Left := ActiveRect.Right + 1;
      NormalRect.Top := ActiveRect.Top;
      NormalRect.Right := Width;
      NormalRect.Bottom := ActiveRect.Bottom;

      CurRect.Left := ActiveRect.Right;
      CurRect.Top := Height div 2 - CurHeight div 2;
      CurRect.Right := CurRect.Left + CurWidth;
      CurRect.Bottom := CurRect.Top + CurHeight;
    end
  else
    begin
      NormalRect.Left := (Width - BarHeight) div 2;
      NormalRect.Top := 0;
      NormalRect.Right := NormalRect.Left + BarHeight;
      NormalRect.Bottom := Round((Height - CurHeight) * ({Value - Min}Max - Value) / (Max - Min));

      ActiveRect.Left := NormalRect.Left;
      ActiveRect.Top := NormalRect.Bottom + 1;
      ActiveRect.Right := NormalRect.Right;
      ActiveRect.Bottom := Height;

      CurRect.Left := (Width - CurWidth) div 2;
      CurRect.Top := NormalRect.Bottom;
      CurRect.Right := CurRect.Left + CurWidth;
      CurRect.Bottom := CurRect.Top + CurHeight;
    end;
end;

//  SETTERS

procedure TUCustomSlider.SetControlState(const Value: TUControlState);
begin
  if Value <> FControlState then
    begin
      FControlState := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomSlider.SetOrientation(const Value: TUOrientation);
var
  TempSize: Integer;
begin
  if Value <> FOrientation then
    begin
      FOrientation := Value;

      //  Switch CurWidth and CurHeight
      TempSize := CurWidth;
      CurWidth := CurHeight;
      CurHeight := TempSize;

      UpdateRects;
      Repaint;
    end;
end;

procedure TUCustomSlider.SetMin(const Value: Integer);
begin
  if Value <> FMin then
    begin
      FMin := Value;
      UpdateRects;
      Repaint;
    end;
end;

procedure TUCustomSlider.SetMax(const Value: Integer);
begin
  if Value <> FMax then
    begin
      FMax := Value;
      UpdateRects;
      Repaint;
    end;
end;

procedure TUCustomSlider.SetValue(const Value: Integer);
begin
  if Value <> FValue then
    begin
      FValue := Value;
      if Assigned(FOnChange) then
        FOnChange(Self);
      UpdateRects;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUCustomSlider.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New properties
  CurWidth := 8;
  CurHeight := 23;
  CurCorner := 5;
  BarHeight := 2;

  FIsSliding := false;

  FControlState := csNone;
  FOrientation := oHorizontal;

  FHitTest := true;
  FMin := 0;
  FMax := 100;
  FValue := 0;

  //  Common properties
  Height := 25;
  Width := 100;

  UpdateColors;
  UpdateRects;
end;

procedure TUCustomSlider.Paint;
begin
  inherited;

  //  Paint active part
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(ActiveColor, 255);
  Canvas.FillRect(ActiveRect);

  //  Paint normal part
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BackColor, 255);
  Canvas.FillRect(NormalRect);

  //  Paint cursor
  Canvas.Pen.Color := CurColor;
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(CurColor, 255);
  Canvas.RoundRect(CurRect, CurCorner, CurCorner);
  Canvas.FloodFill(CurRect.Left + CurRect.Width div 2, CurRect.Top + CurRect.Height div 2, CurColor, fsSurface);
end;

procedure TUCustomSlider.Resize;
begin
  inherited;
  UpdateRects;
end;

procedure TUCustomSlider.ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND});
begin
  inherited;
  CurWidth := MulDiv(CurWidth, M, D);
  CurHeight := MulDiv(CurHeight, M, D);
  CurCorner := MulDiv(CurCorner, M, D);
  BarHeight := MulDiv(BarHeight, M, D);
  UpdateRects;
end;

//  MESSAGES

procedure TUCustomSlider.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if not Enabled then
    ControlState := csDisabled
  else
    ControlState := csNone;
end;

procedure TUCustomSlider.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ControlState := csHover;
      inherited;
    end;
end;

procedure TUCustomSlider.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ControlState := csNone;
      inherited;
    end;
end;

procedure TUCustomSlider.WM_LButtonDown(var Msg: TWMLButtonDown);
var
  TempValue: Integer;
begin
  if not (Enabled and HitTest) then exit;

  FControlState := csPress;
  UpdateColors;
  FIsSliding := true;

  //  If press in cursor
  if
    (Msg.XPos < CurRect.Left)
    or (Msg.XPos > CurRect.Right)
    or (Msg.YPos < CurRect.Top)
    or (Msg.YPos > CurRect.Bottom)
  then
    begin
      //  Change Value by click position, click point is center of cursor
      if Orientation = oHorizontal then
        TempValue := Min + Round((Msg.XPos - CurWidth div 2) * (Max - Min) / (Width - CurWidth))
      else
        TempValue := Max - Round((Msg.YPos - CurHeight div 2) * (Max - Min) / (Height - CurHeight));

      //  Keep value in range [Min..Max]
      if TempValue < Min then
        TempValue := Min
      else if TempValue > Max then
        TempValue := Max;

      FValue := TempValue;
      UpdateRects;
      Repaint;
    end;

  inherited;
end;

procedure TUCustomSlider.WM_MouseMove(var Msg: TWMMouseMove);
var
  TempValue: Integer;
begin
  if not (Enabled and HitTest) then exit;

  if FIsSliding then
    begin
      if Orientation = oHorizontal then
        TempValue := Min + Round((Msg.XPos - CurWidth div 2) * (Max - Min) / (Width - CurWidth))
      else
        TempValue := Max - Round((Msg.YPos - CurHeight div 2) * (Max - Min) / (Height - CurHeight));

      //  Keep value in range [Min..Max]
      if TempValue < Min then
        TempValue := Min
      else if TempValue > Max then
        TempValue := Max;

      Value := TempValue;
    end;

  inherited;
end;

procedure TUCustomSlider.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled and HitTest then
    begin
      ControlState := csNone;
      FIsSliding := false;
      inherited;
    end;
end;

end.
