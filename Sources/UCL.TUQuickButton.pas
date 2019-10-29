unit UCL.TUQuickButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages,
  VCL.Controls, VCL.ExtCtrls, VCL.Graphics, VCL.Forms;

type
  TUQuickButtonStyle = (qbsNone, qbsQuit, qbsMax, qbsMin, qbsSysButton, qbsHighlight);

  TUQuickButton = class(TPanel, IUThemeComponent)
    private
      var BackColor: TColor;
      var TextColor: TColor;

      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;
      FButtonStyle: TUQuickButtonStyle;
      FLightColor: TColor;
      FDarkColor: TColor;
      FCustomAccentColor: TColor;
      FPressBrightnessDelta: Integer;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetButtonStyle(const Value: TUQuickButtonStyle);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure CM_ColorChanged(var Msg: TMessage); message CM_COLORCHANGED;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
      procedure UpdateChange;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property ButtonStyle: TUQuickButtonStyle read FButtonStyle write SetButtonStyle default qbsNone;

      property LightColor: TColor read FLightColor write FLightColor default $E6E6E6;
      property DarkColor: TColor read FDarkColor write FDarkColor default $191919;
      property CustomAccentColor: TColor read FCustomAccentColor write FCustomAccentColor default $D77800;
      property PressBrightnessDelta: Integer read FPressBrightnessDelta write FPressBrightnessDelta default 25;
  end;

implementation

{ TUQuickButton }

//  THEME

procedure TUQuickButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUQuickButton.UpdateTheme;
begin
  UpdateChange;

  Color := BackColor;
  Font.Color := TextColor;
  Invalidate;
end;

procedure TUQuickButton.UpdateChange;
begin
  if ButtonStyle = qbsHighlight then
    begin
      if ThemeManager = nil then
        FLightColor := FCustomAccentColor
      else
        FLightColor := ThemeManager.AccentColor;
      FDarkColor := FLightColor;
    end;

  //  Get background color
  case ButtonState of
    csNone: //  Transparent
      begin
        ParentColor := true;
        ParentBackground := true;
        BackColor := Color;
      end;

    csHover:
      if ThemeManager = nil then
        BackColor := CustomAccentColor
      else if ThemeManager.Theme = utLight then
        BackColor := LightColor
      else
        BackColor := DarkColor;

    csPress:
      if ThemeManager = nil then
        BackColor := BrightenColor(LightColor, PressBrightnessDelta)
      else if ThemeManager.Theme = utLight then
        BackColor := BrightenColor(LightColor, PressBrightnessDelta)
      else
        BackColor := BrightenColor(DarkColor, -PressBrightnessDelta);

    csDisabled:
      BackColor := $666666;

    csFocused:
      if ThemeManager = nil then
        BackColor := LightColor
      else if ThemeManager.Theme = utLight then
        BackColor := LightColor
      else
        BackColor := DarkColor;

    else
      BackColor := $D77800;
  end;

  ParentColor := ButtonState = csNone;
  ParentBackground := ButtonState = csNone;

  //  Get text color
  TextColor := GetTextColorFromBackground(BackColor);
end;

//  SETTERS

procedure TUQuickButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUQuickButton.SetButtonStyle(const Value: TUQuickButtonStyle);
begin
  if Value <> FButtonStyle then
    begin
      FButtonStyle := Value;

      case FButtonStyle of
        qbsNone: ;

        qbsQuit:
          begin
            FLightColor := $002311E8;
            FDarkColor := $002311E8;
            FPressBrightnessDelta := 32;
            Caption := ''; //  Close icon
          end;

        qbsSysButton, qbsMax, qbsMin:
          begin
            FLightColor := $CFCFCF;
            FDarkColor := $3C3C3C;
            FPressBrightnessDelta := -32;
            case FButtonStyle of
              qbsMax:
                Caption := '';
              qbsMin:
                Caption := '';
              qbsSysButton:
                Caption := '';
            end;
          end;

        qbsHighlight:
          begin
            if ThemeManager = nil then
              FLightColor := FCustomAccentColor
            else
              FLightColor := ThemeManager.AccentColor;
            FDarkColor := FLightColor;
            FPressBrightnessDelta := 25;
            Caption := '';
          end;
      end;

      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUQuickButton.Create(aOwner: TComponent);
begin
  inherited;

  //  New props
  FButtonState := csNone;
  FLightColor := $E6E6E6;
  FDarkColor := $191919;
  FCustomAccentColor := $D77800;
  FPressBrightnessDelta := 25;

  //  Old props
  BevelOuter := bvNone;
  Caption := ''; //  Back icon
  Font.Name := 'Segoe MDL2 Assets';
  Font.Size := 10;
  Height := 32;
  Width := 45;

  UpdateChange;
end;

//  MESSAGES

procedure TUQuickButton.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if Enabled then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUQuickButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUQuickButton.WM_LButtonUp(var Msg: TWMLButtonUp);
var
  ParentForm: TCustomForm;
begin
  if Enabled then
    begin
      ButtonState := csHover;

      case ButtonStyle of
        qbsQuit:
          GetParentForm(Self, true).Close;
        qbsMax:
          begin
            ParentForm := GetParentForm(Self, true);
            if ParentForm.WindowState = wsMaximized then
              ParentForm.WindowState := wsNormal
            else
              ParentForm.WindowState := wsMaximized;
          end;
        qbsMin:
          GetParentForm(Self, true).WindowState := wsMinimized;
      end;

      inherited;
    end;
end;

procedure TUQuickButton.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUQuickButton.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUQuickButton.CM_ColorChanged(var Msg: TMessage);
begin
  UpdateTheme;
end;

end.
