unit UCL.HighDpiApp;

interface

{$IF CompilerVersion <= 30}
function IsDpiAware: Boolean;
function SetHighDpiAware: Boolean;
{$IFEND}

implementation

{$IF CompilerVersion <= 30}
uses
  SysUtils,
  Windows,
  UCL.ShellUIScaling;

function SetHighDpiAware: Boolean;
begin
  if CheckWin32Version(6, 3) then
    Result:=(SetProcessDpiAwareness(TProcessDpiAwareness.PROCESS_PER_MONITOR_DPI_AWARE) = S_OK)
  else
    Result:=SetProcessDpiAware;
end;

function IsDpiAware: Boolean;
var
  LLevel: TProcessDpiAwareness;
begin
  if CheckWin32Version(6, 3) then begin
    GetProcessDpiAwareness(GetCurrentProcess, LLevel);
    Result:=(LLevel = TProcessDpiAwareness.PROCESS_PER_MONITOR_DPI_AWARE);
  end
  else
{$WARN SYMBOL_DEPRECATED OFF}
    Result := IsProcessDPIAware;
{$WARN SYMBOL_DEPRECATED DEFAULT}
end;

{$IFDEF MSWINDOWS}
initialization
  SetHighDpiAware;
{$ENDIF}
{$IFEND}

end.
