{$LEGACYIFEND ON}

unit UCL.TURadioButton;

interface

uses
  Classes, Messages, Windows, Controls, Graphics,
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics;

type
  TUCustomRadioButton = class(TGraphicControl, IUThemeComponent)
    const
      ICON_CIRCLE_BORDER = '';
      ICON_CIRCLE_INSIDE = '';

    private
      var ActiveColor, TextColor: TColor;
      var IconRect, TextRect: TRect;

      FThemeManager: TUThemeManager;
      FIconFont: TFont;

      FAutoSize: Boolean;
      FIsChecked: Boolean;
      FGroup: string;
      FCustomActiveColor: TColor;
      FTextOnGlass: Boolean;

      //  Internal
      procedure UpdateColors;
      procedure UpdateRects;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAutoSize(const Value: Boolean); reintroduce;
      procedure SetIsChecked(const Value: Boolean);
      procedure SetTextOnGlass(const Value: Boolean);

      //  Messages
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND}); override;
      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property IconFont: TFont read FIconFont write FIconFont;

      property AutoSize: Boolean read FAutoSize write SetAutoSize default false;
      property IsChecked: Boolean read FIsChecked write SetIsChecked default false;
      property Group: string read FGroup write FGroup;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;
      property TextOnGlass: Boolean read FTextOnGlass write SetTextOnGlass default false;

      property ParentColor default true;
      property Height default 30;
      property Width default 180;
  end;

  TURadioButton = class(TUCustomRadioButton)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      property Caption;
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

{ TUCustomRadioButton }

//  THEME

procedure TUCustomRadioButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomRadioButton.UpdateTheme;
begin
  UpdateColors;
  UpdateRects;
  Repaint;
end;

procedure TUCustomRadioButton.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  INTERNAL

procedure TUCustomRadioButton.UpdateColors;
begin
  //  Active & text color
  if ThemeManager = nil then
    begin
      ActiveColor := CustomActiveColor;
      TextColor := $000000;
    end
  else if ThemeManager.Theme = utLight then
    begin
      ActiveColor := ThemeManager.AccentColor;
      TextColor := $000000;
    end
  else
    begin
      ActiveColor := ThemeManager.AccentColor;
      TextColor := $FFFFFF;
    end;

  //  Disabled
  if not Enabled then
    begin
      ActiveColor := $808080;
      TextColor := $808080;
    end;
end;

procedure TUCustomRadioButton.UpdateRects;
begin
  IconRect := Rect(0, 0, Height, Height);
  TextRect := Rect(Height, 0, Width, Height);
end;

//  SETTERS

procedure TUCustomRadioButton.SetAutoSize(const Value: Boolean);
begin
  if Value <> FAutoSize then
    begin
      FAutoSize := Value;
      Resize;
    end;
end;

procedure TUCustomRadioButton.SetIsChecked(const Value: Boolean);
var
  i: Integer;
begin
  if Value <> FIsChecked then
    begin
      FIsChecked := Value;

      //  Uncheck all items with the same group
      if Value then
        for i := 0 to Parent.ControlCount - 1 do
          if
            (Parent.Controls[i] <> Self)
            and (Parent.Controls[i] is TUCustomRadioButton)
            and ((Parent.Controls[i] as TUCustomRadioButton).Group = Group)
          then
            (Parent.Controls[i] as TUCustomRadioButton).IsChecked := false;

      Repaint;
    end;
end;


procedure TUCustomRadioButton.SetTextOnGlass(const Value: Boolean);
begin
  if Value <> FTextOnGlass then
    begin
      FTextOnGlass := Value;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUCustomRadioButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New props
  FAutoSize := false;
  FIsChecked := false;
  FCustomActiveColor := $D77800;
  FTextOnGlass := false;

  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  ParentColor := true;
  Height := 30;
  Width := 180;

  UpdateColors;
  UpdateRects;
end;

destructor TUCustomRadioButton.Destroy;
begin
  FIconFont.Free;
  inherited;
end;

//  CUSTOM METHODS

procedure TUCustomRadioButton.ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND});
begin
  inherited;
  IconFont.Height := MulDiv(IconFont.Height, M, D);
  Resize;   //  Autosize
  //UpdateRects;  //  Do not update rects, resize already do that
end;

procedure TUCustomRadioButton.Paint;
begin
  inherited;

  //  Paint background
  if not TextOnGlass then
    begin
      Canvas.Brush.Style := bsSolid;
      Canvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
      Canvas.FillRect(Rect(0, 0, Width, Height));
    end;

  //  Paint text
  Canvas.Brush.Style := bsClear;
  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;
  DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, TextRect, Caption, TextOnGlass);

  //  Paint icon
  Canvas.Font := IconFont;
  if not IsChecked then
    begin
      Canvas.Font.Color := TextColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, IconRect, ICON_CIRCLE_BORDER, TextOnGlass);
    end
  else
    begin
      Canvas.Font.Color := ActiveColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, IconRect, ICON_CIRCLE_BORDER, TextOnGlass);

      Canvas.Font.Color := TextColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, IconRect, ICON_CIRCLE_INSIDE, TextOnGlass);
    end;
end;

procedure TUCustomRadioButton.Resize;
var
  Space: Integer;
begin
  if AutoSize and (Align = alNone) then
    begin
      Space := 5;
      Canvas.Font := IconFont;
      Height := 2 * Space + Canvas.TextHeight(ICON_CIRCLE_BORDER);
      Canvas.Font := Font;
      Width := Height + Canvas.TextWidth(Text) + (Height - Canvas.TextHeight(Text)) div 2 + Space;
    end
  else
    inherited;
  UpdateRects;
end;

//  MESSAGES

procedure TUCustomRadioButton.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled then
    IsChecked := true;

  inherited;
end;

procedure TUCustomRadioButton.CM_EnabledChanged(var Msg: TMessage);
begin
  UpdateColors;
  Repaint;
end;

end.
