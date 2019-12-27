unit UCL.ShellUIScaling;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows,
  MultiMon;

const
  ShcoreLib = 'Shcore.dll';

type
  TDisplayDeviceType = (DEVICE_PRIMARY = 0, DEVICE_IMMERSIVE = 1);

  TScaleChangeFlags  = (SCF_VALUE_NONE = $00, SCF_SCALE = $01, SCF_PHYSICAL = $02);

  TDeviceScaleFactor = (
    SCALE_100_PERCENT = 100,
    SCALE_120_PERCENT = 120,
    SCALE_140_PERCENT = 140,
    SCALE_150_PERCENT = 150,
    SCALE_160_PERCENT = 160,
    SCALE_180_PERCENT = 180,
    SCALE_225_PERCENT = 225
  );

  TProcessDpiAwareness = (
    PROCESS_DPI_UNAWARE = 0,
    PROCESS_SYSTEM_DPI_AWARE = 1,
    PROCESS_PER_MONITOR_DPI_AWARE = 2
  );

  TMonitorDpiType = (
    MDT_EFFECTIVE_DPI = 0,
    MDT_ANGULAR_DPI = 1,
    MDT_RAW_DPI = 2,
    MDT_DEFAULT = MDT_EFFECTIVE_DPI
  );

// Given a display device, return the preferred DEVICE_SCALE_FACTOR to be used for scaling values.
// Default is SCALE_100_PERCENT
function GetScaleFactorForDevice(deviceType: TDisplayDeviceType): TDeviceScaleFactor; stdcall;

// Register a window to receive callbacks when scaling information changes.
// The uMsgNotify param specifies a message that will be posted to the requesting window.
// The wParam for this message is a combination of SCALE_CHANGE_FLAGS
function RegisterScaleChangeNotifications(displayDevice: TDisplayDeviceType; hwndNotify: HWND; uMsgNotify: UINT; out pdwCookie: DWORD): HRESULT; stdcall;
function RevokeScaleChangeNotifications(displayDevice: TDisplayDeviceType; dwCookie: DWORD): HRESULT; stdcall;

function GetScaleFactorForMonitor(hMon: HMONITOR; out Scale: TDeviceScaleFactor): HRESULT; stdcall;
function RegisterScaleChangeEvent(hEvent: THandle; out pdwCookie: DWORD_PTR): HRESULT; stdcall;
function UnregisterScaleChangeEvent(dwCookie: DWORD_PTR): HRESULT; stdcall;

function SetProcessDpiAwareness(value: TProcessDpiAwareness): HRESULT; stdcall;
function GetProcessDpiAwareness(hprocess: THandle; out value: TProcessDpiAwareness): HRESULT; stdcall;
function GetDpiForMonitor(hmonitor: HMONITOR; dpiType: TMonitorDpiType; out dpiX: UINT; out dpiY: UINT): HRESULT; stdcall;

type
  TShellUIComponent = (
    SHELL_UI_COMPONENT_TASKBARS         = 0,
    SHELL_UI_COMPONENT_NOTIFICATIONAREA = 1,
    SHELL_UI_COMPONENT_DESKBAND         = 2
  );

function GetDpiForShellUIComponent(Component: TShellUIComponent): UINT; stdcall;

implementation

{$WARN SYMBOL_PLATFORM OFF}

function GetScaleFactorForDevice; external ShcoreLib name 'GetScaleFactorForDevice' delayed;
function RegisterScaleChangeNotifications; external ShcoreLib name 'RegisterScaleChangeNotifications' delayed;
function RevokeScaleChangeNotifications; external ShcoreLib name 'RevokeScaleChangeNotifications' delayed;
function GetScaleFactorForMonitor; external ShcoreLib name 'GetScaleFactorForMonitor' delayed;
function RegisterScaleChangeEvent; external ShcoreLib name 'RegisterScaleChangeEvent' delayed;
function UnregisterScaleChangeEvent; external ShcoreLib name 'UnregisterScaleChangeEvent' delayed;
function SetProcessDpiAwareness; external ShcoreLib name 'SetProcessDpiAwareness' delayed;
function GetProcessDpiAwareness; external ShcoreLib name 'GetProcessDpiAwareness' delayed;
function GetDpiForMonitor; external ShcoreLib name 'GetDpiForMonitor' delayed;
function GetDpiForShellUIComponent; external ShcoreLib name 'GetDpiForShellUIComponent' delayed;

end.
