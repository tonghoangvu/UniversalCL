unit UCL.TUSlider;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls;

type
  TUCustomSlider = class(TCustomControl, IUThemeComponent)
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
      procedure Paint; override;
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
      procedure UpdateChange;

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
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentColor;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;

      property OnClick;
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
      property OnStartDock;
      property OnStartDrag;
  end;

implementation

{ TUCustomSlider }

//  THEME

procedure TUCustomSlider.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      if Value <> nil then
        Value.Connect(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSlider.UpdateTheme;
begin
  UpdateChange;
  Paint;
end;

procedure TUCustomSlider.UpdateChange;
begin
  //  Update colors
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

//  SETTERS

procedure TUCustomSlider.SetControlState(const Value: TUControlState);
begin
  if Value <> FControlState then
    begin
      FControlState := Value;
      UpdateTheme;
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

      UpdateTheme;
    end;
end;

procedure TUCustomSlider.SetMin(const Value: Integer);
begin
  if Value <> FMin then
    begin
      FMin := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSlider.SetMax(const Value: Integer);
begin
  if Value <> FMax then
    begin
      FMax := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSlider.SetValue(const Value: Integer);
begin
  if Value <> FValue then
    begin
      FValue := Value;
      if Assigned(FOnChange) then
        FOnChange(Self);
      UpdateTheme;
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

  UpdateChange;
end;

procedure TUCustomSlider.Paint;
begin
  inherited;

  //  Clear old cursor background
  ParentColor := true;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(CurRect);

  //  Calc rect
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

  //  Paint active part
  Canvas.Brush.Color := ActiveColor;
  Canvas.FillRect(ActiveRect);

  //  Paint normal part
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(NormalRect);

  //  Paint cursor
  Canvas.Pen.Color := CurColor;
  Canvas.Brush.Color := CurColor;
  Canvas.RoundRect(CurRect, CurCorner, CurCorner);
  Canvas.FloodFill(ActiveRect.Right, Height div 2, CurColor, fsSurface);
end;

procedure TUCustomSlider.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  CurWidth := MulDiv(CurWidth, M, D);
  CurHeight := MulDiv(CurHeight, M, D);
  CurCorner := MulDiv(CurCorner, M, D);
  BarHeight := MulDiv(BarHeight, M, D);
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

  SetFocus;
  FControlState := csPress;
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

      Value := TempValue;
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
