unit UCL.TUText;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes,
  VCL.Controls, VCL.StdCtrls;

type
  TUTextKind = (tkNormal, tkDescription, tkEntry, tkHeading, tkTitle);

  TUText = class(TLabel, IUThemeControl)
    private
      FThemeManager: TUThemeManager;
      FTextKind: TUTextKind;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetTextKind(Value: TUTextKind);

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property TextKind: TUTextKind read FTextKind write SetTextKind default tkNormal;
  end;

implementation

{ THEME }

procedure TUText.SetThemeManager(const Value: TUThemeManager);
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

procedure TUText.UpdateTheme;
var
  aTheme: TUTheme;
begin
  if (ThemeManager = nil) or (csDesigning in ComponentState) then
    aTheme := utLight
  else
    aTheme := ThemeManager.Theme;

  //  Font color
  if TextKind = tkDescription then
    Font.Color := $00666666
  else if aTheme = utLight then
    Font.Color := $00000000
  else
    Font.Color := $00FFFFFF;

  //  Font name
  if TextKind = tkEntry then
    Font.Name := 'Segoe UI Semibold'
  else
    Font.Name := 'Segoe UI';

  //  Font size
  case TextKind of
    tkNormal:
      Font.Size := 10;
    tkDescription:
      Font.Size := 10;
    tkEntry:
      Font.Size := 10;
    tkHeading:
      Font.Size := 15;
    tkTitle:
      Font.Size := 21;
  end;
end;

{ GETTERS & SETTERS }

procedure TUText.SetTextKind(Value: TUTextKind);
begin
  if Value <> FTextKind then
    begin
      FTextKind := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUText.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New properties
  FTextKind := tkNormal;

  //  Common properties

  UpdateTheme;
end;


end.

