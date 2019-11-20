unit UCL.TUHyperLink;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.UITypes,
  Winapi.Windows, Winapi.Messages, Winapi.Shellapi,
  VCL.Controls, VCL.StdCtrls, VCL.Graphics;

type
  TUHyperLink = class(TLabel, IUThemeComponent)
    const
      DefTextColor: TDefColor = (
      ($D77800, clGray, clMedGray, clMedGray, clGray),
      ($D77800, clMedGray, clGray, clGray, clMedGray));

    private
      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;
      FCustomTextColors: TControlStateColors;

      FEnabled: Boolean;  //  Must override Enabled, if not disabled style wrong on Dark theme
      FHitTest: Boolean;
      FOpenLink: Boolean;
      FURL: string;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetEnabled(const Value: Boolean); reintroduce;

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

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

      property Enabled: Boolean read FEnabled write SetEnabled default true;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property OpenLink: Boolean read FOpenLink write FOpenLink default true;
      property URL: string read FURL write FURL;
  end;

implementation

{ TUHyperLink }

//  THEME

procedure TUHyperLink.SetThemeManager(const Value: TUThemeManager);
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

procedure TUHyperLink.UpdateTheme;
begin
  if ThemeManager = nil then
    Font.Color := CustomTextColors.GetStateColor(ButtonState)
  else
    begin
      if ButtonState = csNone then
        Font.Color := ThemeManager.AccentColor
      else
        Font.Color := DefTextColor[ThemeManager.Theme, ButtonState];
    end;
end;

//  SETTERS

procedure TUHyperLink.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUHyperLink.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      FEnabled := Value;
      if not FEnabled then
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
end;

//  MAIN CLASS

constructor TUHyperLink.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FButtonState := csNone;
  FCustomTextColors := TControlStateColors.Create($D77800, clGray, clMedGray, clMedGray, $D77800);
  FCustomTextColors.OnChange := DoCustomTextColorsChange;

  FEnabled := true;
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

  inherited;
end;

//  MESSAGES

procedure TUHyperLink.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUHyperLink.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUHyperLink.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled and HitTest then
    begin
      if OpenLink then
        ShellExecute(0, '', PWideChar(URL), '', '', SW_SHOWNORMAL);
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUHyperLink.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUHyperLink.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

//  GROUP PROPERTY CHANGED

procedure TUHyperLink.DoCustomTextColorsChange(Sender: TObject);
begin
  UpdateTheme;
end;

end.
