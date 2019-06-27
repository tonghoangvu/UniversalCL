unit UCL.SystemSettings;

interface

uses
  UCL.Classes,
  Winapi.Windows,
  System.Win.Registry,
  VCL.Graphics;

//  Get data
function GetAccentColor: TColor;
function IsAccentColorEnabled: Boolean;
function GetAppTheme: TUTheme;

//  Set data
procedure SetAccentColor(aColor: TColor);
procedure SetAccentColorState(State: Boolean);
procedure SetAppTheme(aTheme: TUTheme);

implementation

{ GET DATA }

function GetAccentColor: TColor;
var
  Reg: TRegistry;
  aColor: Cardinal;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKeyReadOnly('Software\Microsoft\Windows\DWM');
    aColor := Reg.ReadInteger('AccentColor');
    Reg.CloseKey;
  finally
    Reg.Free;
  end;

  Result := aColor - $FF000000; //  ARGB to RGB
end;

function IsAccentColorEnabled: Boolean;
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

{ SET DATA }

procedure SetAccentColor(aColor: TColor);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\DWM', false);
    Reg.WriteInteger('AccentColor', aColor + $FF000000);  //  RGB to ARGB (alpha = 255)
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

procedure SetAccentColorState(State: Boolean);
var
  Reg: TRegistry;
  Value: Byte;
begin
  if State = true then
    Value := 1
  else
    Value := 0;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\DWM', false);
    Reg.WriteInteger('ColorPrevalence', Value);
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

procedure SetAppTheme(aTheme: TUTheme);
var
  Reg: TRegistry;
  Value: Byte;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize', false);
    if aTheme = utLight then
      Value := 1
    else
      Value := 0;
    Reg.WriteInteger('AppsUseLightTheme', Value);
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

end.
