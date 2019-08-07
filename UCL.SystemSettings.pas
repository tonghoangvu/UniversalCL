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
  ARGB: Cardinal;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    try
      Reg.OpenKeyReadOnly('Software\Microsoft\Windows\DWM\');
      ARGB := Reg.ReadInteger('AccentColor');
      Result := ARGB mod $FF000000; //  ARGB to RGB
    except
      Result := $D77800;  //  Default blue
    end;
  finally
    Reg.Free;
  end;
end;

function GetColorOnBorderEnabled: Boolean;
var 
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    try
      Reg.OpenKeyReadOnly('Software\Microsoft\Windows\DWM\');
      Result := Reg.ReadInteger('ColorPrevalence') <> 0;
    except
      Result := false;
    end;
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
    try
      Reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\');
      if Reg.ReadInteger('AppsUseLightTheme') = 0 then
        Result := utDark
      else 
        Result := utLight;
    except
      Result := utLight;
      //  Apply this fix
      Reg.CloseKey;
      Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\', true);
      Reg.WriteInteger('AppsUseLightTheme', 1);
    end;
  finally
    Reg.Free;
  end;
end;

end.
