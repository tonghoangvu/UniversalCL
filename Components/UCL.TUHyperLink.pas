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
      ($D77800, clGray, clMedGray, clMedGray, clGray),
      ($D77800, clMedGray, clGray, clGray, clMedGray));

    private
      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;
      FCustomTextColors: TControlStateColors;

      FHitTest: Boolean;
      FOpenLink: Boolean;
      FURL: string;

      //  Object setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Value setters
      procedure SetButtonState(const Value: TUControlState);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;

      //  Group property change
      procedure DoCustomTextColorsChange(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property CustomTextColors: TControlStateColors read FCustomTextColors write FCustomTextColors;

      property HitTest: Boolean read FHitTest write FHitTest default true;
      property OpenLink: Boolean read FOpenLink write FOpenLink default true;
      property URL: string read FURL write FURL;
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
begin
  if ThemeManager = nil then
    Font.Color := CustomTextColors.GetStateColor(ButtonState)
  else
    begin
      if ButtonState = csNone then
        Font.Color := ThemeManager.ActiveColor
      else
        Font.Color := DefTextColor[ThemeManager.Theme, ButtonState];
    end;
end;

{ VALUE SETTERS }

procedure TUHyperLink.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUHyperLink.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FButtonState := csNone;
  FCustomTextColors := TControlStateColors.Create($D77800, clGray, clMedGray, clMedGray, $D77800);
  FCustomTextColors.OnChange := DoCustomTextColorsChange;

  FHitTest := true;
  FOpenLink := true;
  FURL := 'https://embarcadero.com/';

  Caption := 'Embarcadero website';

  Cursor := crHandPoint;

  Font.Name := 'Segoe UI';
  Font.Size := 10;

  UpdateTheme;
end;

destructor TUHyperLink.Destroy;
begin
  FCustomTextColors.Free;

  inherited Destroy;
end;

{ MESSAGES }

procedure TUHyperLink.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUHyperLink.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUHyperLink.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      if OpenLink = true then
        ShellExecute(0, '', PWideChar(URL), '', '', SW_SHOWNORMAL);
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUHyperLink.CM_MouseEnter(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUHyperLink.CM_MouseLeave(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUHyperLink.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if Enabled = false then
    begin
      FButtonState := csDisabled;
      Cursor := crDefault;
    end
  else
    begin
      FButtonState := csNone;
      Cursor := crHandPoint;
    end;
  UpdateTheme;
end;

{ GROUP PROPERTY CHANGE }

procedure TUHyperLink.DoCustomTextColorsChange(Sender: TObject);
begin
  UpdateTheme;
end;

end.
