unit UCL.TUButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.Types,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls, VCL.StdCtrls, VCL.ImgList;

type
  TUCustomButton = class(TCustomControl, IUThemeComponent)
    const
      DefBackColor: TDefColor = (
        ($CCCCCC, $CCCCCC, $999999, $CCCCCC, $CCCCCC),
        ($333333, $333333, $666666, $333333, $333333));
      DefBorderColor: TDefColor = (
        ($CCCCCC, $7A7A7A, $999999, $CCCCCC, $7A7A7A),
        ($333333, $858585, $666666, $333333, $858585));
      DefTextColor: TDefColor = (
        ($000000, $000000, $000000, $666666, $000000),
        ($FFFFFF, $FFFFFF, $FFFFFF, $666666, $FFFFFF));

    private
      var BorderThickness: Integer;
      var BorderColor: TColor;
      var BackColor: TColor;
      var TextColor: TColor;

      //  Theme
      FThemeManager: TUThemeManager;
      FCustomBorderColors: TControlStateColors;
      FCustomBackColors: TControlStateColors;
      FCustomTextColors: TControlStateColors;

      //  Fields
      FButtonState: TUControlState;
      FText: string;
      FTextAlignment: TAlignment;
      FImageIndex: Integer;
      FImages: TCustomImageList;
      FHitTest: Boolean;
      FAllowFocus: Boolean;
      FHighlight: Boolean;
      FIsToggleButton: Boolean;
      FIsToggled: Boolean;
      FTransparent: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetText(const Value: string);
      procedure SetTextAlignment(const Value: TAlignment);
      procedure SetImageIndex(const Value: Integer);
      procedure SetHighlight(const Value: Boolean);
      procedure SetTransparent(const Value: Boolean);

      //  Messages
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;

      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
      procedure CM_DialogKey(var Msg: TCMDialogKey); message CM_DIALOGKEY;

      //  Group property change
      procedure DoCustomBorderColorsChange(Sender: TObject);
      procedure DoCustomBackColorsChange(Sender: TObject);
      procedure DoCustomTextColorsChange(Sender: TObject);

    protected
      procedure ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;
      procedure UpdateChange;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property CustomBorderColors: TControlStateColors read FCustomBorderColors write FCustomBorderColors;
      property CustomBackColors: TControlStateColors read FCustomBackColors write FCustomBackColors;
      property CustomTextColors: TControlStateColors read FCustomTextColors write FCustomTextColors;

      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property Text: string read FText write SetText;
      property TextAlignment: TAlignment read FTextAlignment write SetTextAlignment default taCenter;
      property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
      property Images: TCustomImageList read FImages write FImages;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property AllowFocus: Boolean read FAllowFocus write FAllowFocus default true;
      property Highlight: Boolean read FHighlight write SetHighlight default false;
      property IsToggleButton: Boolean read FIsToggleButton write FIsToggleButton default false;
      property IsToggled: Boolean read FIsToggled write FIsToggled default false;
      property Transparent: Boolean read FTransparent write SetTransparent default false;
  end;

  TUButton = class(TUCustomButton)
    published
      //  Common properties
      property Align;
      property Anchors;
      property Constraints;
      property DoubleBuffered;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property TabOrder;
      property TabStop;
      property Visible;

      //  Common events
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

{ TUCustomButton }

//  THEME

procedure TUCustomButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomButton.UpdateTheme;
begin
  UpdateChange;
  Paint;
end;

procedure TUCustomButton.UpdateChange;
begin
  //  Not connect ThemeManager, use custom colors
  if ThemeManager = nil then
    begin
      BorderColor := CustomBorderColors.GetStateColor(ButtonState);
      BackColor := CustomBackColors.GetStateColor(ButtonState);
      TextColor := CustomTextColors.GetStateColor(ButtonState);
    end

  //  Highlight button
  else if
    ((Highlight) or ((IsToggleButton) and (IsToggled)))  //  Is highlight button, or toggle on
    and (ButtonState in [csNone, csHover, csFocused]) //  Highlight only when mouse normal, hover and focused
  then
    begin
      BackColor := ThemeManager.AccentColor;
      if ButtonState = csNone then
        BorderColor := BackColor
      else
        BorderColor := MulColor(BackColor, 0.6);
      TextColor := GetTextColorFromBackground(BackColor);
    end

  //  Default colors
  else
    begin
      BorderColor := DefBorderColor[ThemeManager.Theme, ButtonState];
      BackColor := DefBackColor[ThemeManager.Theme, ButtonState];
      TextColor := DefTextColor[ThemeManager.Theme, ButtonState];
    end;

  //  Transparent
  if (ButtonState = csNone) and (Transparent) then
    begin
      ParentColor := true;
      BackColor := Color;
      BorderColor := Color; //  The same background, because of button state
      TextColor := GetTextColorFromBackground(Color);
    end;
end;

//  SETTERS

procedure TUCustomButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomButton.SetTextAlignment(const Value: TAlignment);
begin
  if Value <> FTextAlignment then
    begin
      FTextAlignment := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomButton.SetImageIndex(const Value: Integer);
begin
  if Value <> FImageIndex then
    begin
      FImageIndex := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomButton.SetHighlight(const Value: Boolean);
begin
  if Value <> FHighlight then
    begin
      FHighlight := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomButton.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUCustomButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  BorderThickness := 2;

  //  New properties
  FCustomBorderColors := TControlStateColors.Create($F2F2F2, $E6E6E6, $CCCCCC, $F2F2F2, $F2F2F2);
  FCustomBackColors := TControlStateColors.Create($F2F2F2, $E6E6E6, $CCCCCC, $F2F2F2, $F2F2F2);
  FCustomTextColors := TControlStateColors.Create(clBlack, clBlack, clBlack, clGray, clBlack);

  FCustomBorderColors.OnChange := DoCustomBorderColorsChange;
  FCustomBackColors.OnChange := DoCustomBackColorsChange;
  FCustomTextColors.OnChange := DoCustomTextColorsChange;

  FButtonState := csNone;
  FText := 'Button';
  FTextAlignment := taCenter;
  FImageIndex := -1;
  FHitTest := true;
  FAllowFocus := true;
  FHighlight := false;
  FIsToggleButton := false;
  FIsToggled := false;
  FTransparent := false;

  //  Property
  Height := 30;
  Width := 135;
  Font.Name := 'Segoe UI';
  Font.Size := 10;
  TabStop := true;

  UpdateChange;
end;

destructor TUCustomButton.Destroy;
begin
  FCustomBorderColors.Free;
  FCustomBackColors.Free;
  FCustomTextColors.Free;

  inherited Destroy;
end;

//  CUSTOM METHODS

procedure TUCustomButton.ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean);
begin
  inherited;
  BorderThickness := MulDiv(BorderThickness, M, D);
end;

procedure TUCustomButton.Paint;
const
  IMG_SPACE = 10;
var
  TextX, TextY, TextW, TextH, TextSpace: Integer;
  ImgX, ImgY, ImgW, ImgH: Integer;
  ThicknessPos: Integer;
  //BorderColor, BackColor, TextColor: TColor;
  ImgRect, TextRect: TRect;
begin
  inherited;

  //  Paint background
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  //  Paint border
  if BorderThickness mod 2 = 0 then
    ThicknessPos := BorderThickness div 2 - 1
  else
    ThicknessPos := BorderThickness div 2;

  Canvas.Pen.Color := BorderColor;
  Canvas.Pen.Width := BorderThickness;
  Canvas.Rectangle(Rect(
    BorderThickness div 2,
    BorderThickness div 2,
    Width - ThicknessPos,
    Height - ThicknessPos));

  //  Paint images
  if (Images <> nil) and (ImageIndex >= 0) then
    begin
      ImgRect := Rect(0, 0, Height, Height);  //  Square image
      ImgW := Images.Width;
      ImgH := Images.Height;
      ImgX := (ImgRect.Width - ImgW) div 2;
      ImgY := (ImgRect.Height - ImgH) div 2;
      Images.Draw(Canvas, ImgX, ImgY, ImageIndex, Enabled);

      TextRect := Rect(Height, 0, Width, Height);
    end
  else
    TextRect := Rect(0, 0, Width, Height);

  //  Paint text
  Font.Color := TextColor;
  Canvas.Font := Font;
  TextW := Canvas.TextWidth(Text);
  TextH := Canvas.TextHeight(Text);
  case TextAlignment of
    taLeftJustify:
      begin
        TextSpace := (TextRect.Height - TextH) div 2;
        TextX := TextRect.Left + TextSpace;
        TextY := TextSpace;
      end;
    taRightJustify:
      begin
        TextSpace := (TextRect.Height - TextH) div 2;
        TextX := TextRect.Right - TextW - TextSpace;
        TextY := TextSpace;
      end;
    //taCenter:
    else  //  Default is center
      begin
        TextX := TextRect.Left + (TextRect.Width - TextW) div 2;
        TextY := TextRect.Top + (TextRect.Height - TextH) div 2;
      end;
  end;
  Canvas.Brush.Style := bsClear;
  Canvas.TextOut(TextX, TextY, Text);
end;

//  MESSAGES

procedure TUCustomButton.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomButton.WM_SetFocus(var Msg: TWMSetFocus);
begin
  if Enabled and HitTest then
    if AllowFocus then
      begin
        ButtonState := csFocused;
        inherited;
      end;
end;

procedure TUCustomButton.WM_KillFocus(var Msg: TWMKillFocus);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUCustomButton.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled and HitTest then
    begin
      if AllowFocus then
        SetFocus;
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomButton.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled and HitTest then
    begin
      if IsToggleButton then
        FIsToggled := not FIsToggled;
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomButton.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomButton.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      //  Dont allow focus
      if not AllowFocus then
        ButtonState := csNone //  No keep border

      //  Allow focus
      else if not Focused then
        ButtonState := csNone //  No focus, no border
      else
        ButtonState := csFocused; //  Keep focus border

      inherited;
    end;
end;

procedure TUCustomButton.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if not Enabled then
    FButtonState := csDisabled
  else
    FButtonState := csNone;
  UpdateTheme;
end;

procedure TUCustomButton.CM_DialogKey(var Msg: TWMKey);
begin
  if AllowFocus and Focused and (Msg.CharCode = VK_RETURN) then
    begin
      Click;
      Msg.Result := 1;
    end
  else
    inherited;
end;

//  GROUP PROPERTY CHANGE

procedure TUCustomButton.DoCustomBorderColorsChange(Sender: TObject);
begin
  UpdateTheme;
end;

procedure TUCustomButton.DoCustomBackColorsChange(Sender: TObject);
begin
  UpdateTheme;
end;

procedure TUCustomButton.DoCustomTextColorsChange(Sender: TObject);
begin
  UpdateTheme;
end;

end.
