unit UCL.SystemSettings;

interface

uses
  UCL.Classes,
  System.Win.Registry,
  Winapi.Windows,
  VCL.Graphics;

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
  OK: Boolean;
  ARGB: Cardinal;
begin
  OK := false;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\DWM\') then
      if R.ValueExists('AccentColor') then
        begin
          ARGB := R.ReadInteger('AccentColor');
          Result := ARGB mod $FF000000; //  ARGB to RGB
          OK := true;
        end;
  finally
    R.Free;
  end;

  if not OK then
    Result := $D77800;  //  Default value on error
end;

function IsColorOnBorderEnabled: Boolean;
var
  R: TRegistry;
  OK: Boolean;
begin
  OK := false;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\DWM\') then
      if R.ValueExists('ColorPrevalence') then
        begin
          Result := R.ReadInteger('ColorPrevalence') <> 0;
          OK := true;
        end;
  finally
    R.Free;
  end;

  if not OK then
    Result := false;
end;

function IsColorOnSurfaceEnabled: Boolean;
var
  R: TRegistry;
  OK: Boolean;
begin
  OK := false;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') then
      if R.ValueExists('ColorPrevalence') then
        begin
          Result := R.ReadInteger('ColorPrevalence') <> 0;
          OK := true;
        end;
  finally
    R.Free;
  end;

  if not OK then
    Result := false;
end;

function IsAppsUseDarkTheme: Boolean;
var
  R: TRegistry;
  OK: Boolean;
begin
  OK := false;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') then
      if R.ValueExists('AppsUseLightTheme') then
        begin
          Result := R.ReadInteger('AppsUseLightTheme') <> 1;
          OK := true;
        end;
  finally
    R.Free;
  end;

  if not OK then
    Result := false;
end;

function IsSystemUseDarkTheme: Boolean;
var
  R: TRegistry;
  OK: Boolean;
begin
  OK := false;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') then
      if R.ValueExists('SystemUsesLightTheme') then
        begin
          Result := R.ReadInteger('SystemUsesLightTheme') <> 1;
          OK := true;
        end;
  finally
    R.Free;
  end;

  if not OK then
    Result := false;
end;

function IsTransparencyEnabled: Boolean;
var
  R: TRegistry;
  OK: Boolean;
begin
  OK := false;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;

    if R.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\') then
      if R.ValueExists('EnableTransparency') then
        begin
          Result := R.ReadInteger('EnableTransparency') <> 1;
          OK := true;
        end;
  finally
    R.Free;
  end;

  if not OK then
    Result := false;
end;

end.
