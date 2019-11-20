unit UCL.TUButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics,
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.Types,
  VCL.Controls, VCL.Graphics, VCL.ImgList;

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
      var BorderColor, BackColor, TextColor: TColor;
      var ImgRect, TextRect: TRect;

      //  Theme
      FThemeManager: TUThemeManager;
      FCustomBorderColors: TControlStateColors;
      FCustomBackColors: TControlStateColors;
      FCustomTextColors: TControlStateColors;

      //  Fields
      FButtonState: TUControlState;
      FAlignment: TAlignment;
      FImageIndex: Integer;
      FImages: TCustomImageList;
      FHitTest: Boolean;
      FAllowFocus: Boolean;
      FHighlight: Boolean;
      FIsToggleButton: Boolean;
      FIsToggled: Boolean;
      FTransparent: Boolean;

      //  Internal
      procedure UpdateColors;
      procedure UpdateRects;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetAlignment(const Value: TAlignment);
      procedure SetImageIndex(const Value: Integer);
      procedure SetHighlight(const Value: Boolean);
      procedure SetTransparent(const Value: Boolean);

      //  Messages
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
      procedure Paint; override;
      procedure Resize; override;
      procedure CreateWindowHandle(const Params: TCreateParams); override;
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property CustomBorderColors: TControlStateColors read FCustomBorderColors write FCustomBorderColors;
      property CustomBackColors: TControlStateColors read FCustomBackColors write FCustomBackColors;
      property CustomTextColors: TControlStateColors read FCustomTextColors write FCustomTextColors;

      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
      property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
      property Images: TCustomImageList read FImages write FImages;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property AllowFocus: Boolean read FAllowFocus write FAllowFocus default false;
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
      property Caption;
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
  UpdateColors;
  UpdateRects;
  Repaint;
end;

//  INTERNAL

procedure TUCustomButton.UpdateColors;
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

procedure TUCustomButton.UpdateRects;
begin
  //  Calc rects
  if (Images <> nil) and (ImageIndex >= 0) then
    begin
      ImgRect := Rect(0, 0, Height, Height);  //  Square left align
      TextRect := Rect(Height, 0, Width, Height);
    end
  else
    TextRect := Rect(0, 0, Width, Height);
end;

//  SETTERS

procedure TUCustomButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomButton.SetAlignment(const Value: TAlignment);
begin
  if Value <> FAlignment then
    begin
      FAlignment := Value;
      Repaint;
    end;
end;

procedure TUCustomButton.SetImageIndex(const Value: Integer);
begin
  if Value <> FImageIndex then
    begin
      FImageIndex := Value;
      UpdateRects;
      Repaint;
    end;
end;

procedure TUCustomButton.SetHighlight(const Value: Boolean);
begin
  if Value <> FHighlight then
    begin
      FHighlight := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomButton.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      Repaint;
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
  FAlignment := taCenter;
  FImageIndex := -1;
  FHitTest := true;
  FAllowFocus := false;
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
end;

destructor TUCustomButton.Destroy;
begin
  FCustomBorderColors.Free;
  FCustomBackColors.Free;
  FCustomTextColors.Free;

  inherited;
end;

//  CUSTOM METHODS

procedure TUCustomButton.Paint;
var
  ImgX, ImgY: Integer;
begin
  inherited;

  //  Paint border
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BorderColor, 255);
  Canvas.FillRect(GetClientRect);

  //  Paint background
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BackColor, 255);
  Canvas.FillRect(Rect(BorderThickness, BorderThickness, Width - BorderThickness, Height - BorderThickness));

  //  Paint image
  if (Images <> nil) and (ImageIndex >= 0) then
    begin
      GetCenterPos(Images.Width, Images.Height, ImgRect, ImgX, ImgY);
      Images.Draw(Canvas, ImgX, ImgY, ImageIndex, Enabled);
    end;

  //  Paint text
  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;
  DrawTextRect(Canvas, Alignment, taVerticalCenter, TextRect, Caption, false);
end;

procedure TUCustomButton.Resize;
begin
  inherited;
  UpdateRects;
end;

procedure TUCustomButton.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited;
  UpdateColors;
  UpdateRects;
end;

procedure TUCustomButton.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  BorderThickness := MulDiv(BorderThickness, M, D);
end;

//  MESSAGES

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
  UpdateColors;
  Repaint;
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
  UpdateColors;
  Repaint;
end;

procedure TUCustomButton.DoCustomBackColorsChange(Sender: TObject);
begin
  UpdateColors;
  Repaint;
end;

procedure TUCustomButton.DoCustomTextColorsChange(Sender: TObject);
begin
  UpdateColors;
  Repaint;
end;

end.
