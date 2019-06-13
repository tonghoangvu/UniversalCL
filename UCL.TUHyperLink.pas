unit UCL.TUHyperLink;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.UITypes,
  Winapi.Windows, Winapi.Messages, Winapi.Shellapi,
  VCL.Controls, VCL.StdCtrls, VCL.Graphics;

type
  TUHyperLink = class(TLabel, IUThemeControl)
    const
      DefTextColor: TDefColor = (
      ($00D77800, clGray, clMedGray, clMedGray, clGray),
      ($00D77800, clMedGray, clGray, clGray, clMedGray));

    private
      FThemeManager: TUThemeManager;
      FButtonState: TUButtonState;
      FEnabled: Boolean;
      FOpenLink: Boolean;

      FCustomNoneTextColor: TColor;
      FCustomHoverTextColor: TColor;
      FCustomPressTextColor: TColor;
      FCustomDisabledTextColor: TColor;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUButtonState);
      procedure SetEnabled(const Value: Boolean); reintroduce;

      procedure WM_LButtonDblClk(var Msg: TMessage); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TMessage); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TMessage); message WM_LBUTTONUP;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUButtonState read FButtonState write SetButtonState default bsNone;
      property Enabled: Boolean read FEnabled write SetEnabled default true;
      property OpenLink: Boolean read FOpenLink write FOpenLink default true;

      property CustomNoneTextColor: TColor read FCustomNoneTextColor write FCustomNoneTextColor;
      property CustomHoverTextColor: TColor read FCustomHoverTextColor write FCustomHoverTextColor;
      property CustomPressTextColor: TColor read FCustomPressTextColor write FCustomPressTextColor;
      property CustomDisabledTextColor: TColor read FCustomDisabledTextColor write FCustomDisabledTextColor;
  end;

implementation

{ THEME }

procedure TUHyperLink.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current ThemeManager
      if FThemeManager <> nil then
        FThemeManager.DisconnectControl(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.ConnectControl(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUHyperLink.UpdateTheme;
var
  aTheme: TUTheme;
begin
  if ThemeManager = nil then
    begin
      case ButtonState of
        bsNone:
          Font.Color := CustomNoneTextColor;
        bsHover:
          Font.Color := CustomHoverTextColor;
        bsPress:
          Font.Color := CustomPressTextColor;
        bsDisabled:
          Font.Color := CustomDisabledTextColor;
      end;
    end
  else
    begin
      aTheme := ThemeManager.Theme;
      if ButtonState = bsNone then
        Font.Color := ThemeManager.ActiveColor
      else
        Font.Color := DefTextColor[aTheme, ButtonState];
    end;
end;

{ GETTERS & SETTERS }

procedure TUHyperLink.SetButtonState(const Value: TUButtonState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      if Value = bsDisabled then
        Cursor := crDefault
      else
        Cursor := crHandPoint;
      UpdateTheme;
    end;
end;

procedure TUHyperLink.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      FEnabled := Value;
      if Value = false then
        begin
          FButtonState := bsDisabled;
          Cursor := crDefault;
        end
      else
        begin
          FButtonState := bsNone;
          Cursor := crHandPoint;
        end;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUHyperLink.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FButtonState := bsNone;
  FEnabled := true;
  FOpenLink := true;

  FCustomNoneTextColor := $00D77800;
  FCustomHoverTextColor := clGray;
  FCustomPressTextColor := clMedGray;
  FCustomDisabledTextColor := clGray;

  Cursor := crHandPoint;

  Font.Name := 'Segoe UI';
  Font.Size := 10;
  Font.Style := Font.Style + [fsUnderline];

  Caption := 'https://embarcadero.com/';

  UpdateTheme;
end;

{ MESSAGES }

procedure TUHyperLink.WM_LButtonDblClk(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsPress;
      inherited;
    end;
end;

procedure TUHyperLink.WM_LButtonDown(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsPress;
      inherited;
    end;
end;

procedure TUHyperLink.WM_LButtonUp(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      if OpenLink = true then
        ShellExecute(0, '', PWideChar(Caption), '', '', SW_SHOWNORMAL);
      ButtonState := bsHover;
      inherited;
    end;
end;

procedure TUHyperLink.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsHover;
      inherited;
    end;
end;

procedure TUHyperLink.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsNone;
      inherited;
    end;
end;

end.
