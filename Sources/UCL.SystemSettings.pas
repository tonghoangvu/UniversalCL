unit UCL.SystemSettings;

interface

uses
  UCL.Classes,
  Registry,
  Windows,
  Graphics;

function GetAccentColor: TColor;
function IsColorOnBorderEnabled: Boolean;
function IsColorOnSurfaceEnabled: Boolean;
function IsAppsUseDarkTheme: Boolean;
function IsSystemUseDarkTheme: Boolean;
function IsTransparencyEnabled: Boolean;

implementation

function GetAccentColor: TColor;
var
  R: TRegistry;
  ARGB: Cardinal;
begin
  Result := $D77800;  //  Default value on error

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\DWM\') and R.ValueExists('AccentColor') then begin
      ARGB := R.ReadInteger('AccentColor');
      Result := ARGB mod $FF000000; //  ARGB to RGB
    end;
  finally
    R.Free;
  end;
end;

function IsColorOnBorderEnabled: Boolean;
var
  R: TRegistry;
begin
  Result := False;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\DWM\') and R.ValueExists('ColorPrevalence') then begin
      Result := R.ReadInteger('ColorPrevalence') <> 0;
    end;
  finally
    R.Free;
  end;
end;

function IsColorOnSurfaceEnabled: Boolean;
var
  R: TRegistry;
begin
  Result := False;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') and R.ValueExists('ColorPrevalence') then begin
      Result := R.ReadInteger('ColorPrevalence') <> 0;
    end;
  finally
    R.Free;
  end;
end;

function IsAppsUseDarkTheme: Boolean;
var
  R: TRegistry;
begin
  Result := False;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') and R.ValueExists('AppsUseLightTheme') then begin
      Result := R.ReadInteger('AppsUseLightTheme') <> 1;
    end;
  finally
    R.Free;
  end;
end;

function IsSystemUseDarkTheme: Boolean;
var
  R: TRegistry;
begin
  Result := False;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') and R.ValueExists('SystemUsesLightTheme') then begin
      Result := R.ReadInteger('SystemUsesLightTheme') <> 1;
    end;
  finally
    R.Free;
  end;
end;

function IsTransparencyEnabled: Boolean;
var
  R: TRegistry;
begin
  Result := False;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') and R.ValueExists('EnableTransparency') then begin
      Result := R.ReadInteger('EnableTransparency') <> 1;
    end;
  finally
    R.Free;
  end;
end;

end.
