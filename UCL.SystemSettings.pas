unit UCL.SystemSettings;

interface

uses
  UCL.Classes,
  System.Win.Registry,
  Winapi.Windows,
  VCL.Graphics;

function GetAccentColor: TColor;
function GetColorOnBorderEnabled: Boolean;
function GetAppTheme: TUTheme;

implementation

function GetAccentColor: TColor;
var
  Reg: TRegistry;
  ARGBColor: Cardinal;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKeyReadOnly('Software\Microsoft\Windows\DWM');
    ARGBColor := Reg.ReadInteger('AccentColor');
    Reg.CloseKey;
  finally
    Reg.Free;
  end;

  Result := ARGBColor - $FF000000;  //  ARGB to RGB
end;

function GetColorOnBorderEnabled: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKeyReadOnly('Software\Microsoft\Windows\DWM');
    Result := Reg.ReadInteger('ColorPrevalence') <> 0;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

function GetAppTheme: TUTheme;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize');
    if Reg.ReadInteger('AppsUseLightTheme') = 1 then
      Result := utLight
    else
      Result := utDark;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

end.
