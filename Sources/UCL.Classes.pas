unit UCL.Classes;

interface

uses
  Classes,
  Windows,
  Graphics,
  Forms;

{$IF CompilerVersion <= 30}
const
  {$EXTERNALSYM WM_DPICHANGED}
  WM_DPICHANGED       = $02E0;

type
  TDWordFiller = record
  {$IFDEF CPUX64}
    Filler: array[1..4] of Byte; // Pad DWORD to make it 8 bytes (4+4) [x64 only]
  {$ENDIF}
  end;

  PRect = ^TRect;

  TWMDpi = record
    Msg: Cardinal;
    MsgFiller: TDWordFiller;
    YDpi: Word;
    XDpi: Word;
    WParamFiller: TDWordFiller;
    ScaledRect: PRECT;
    Result: LRESULT;
  end;

  TMonitorHelper = class helper for TMonitor
  private
    function GetPixelsPerInch: Integer;
  public
    property PixelsPerInch: Integer read GetPixelsPerInch;
  end;
{$IFEND}

type
  TUTheme = (utLight, utDark);

  TUOrientation = (oHorizontal, oVertical);

  TUDirection = (dLeft, dTop, dRight, dBottom);

  TUControlState = (csNone, csHover, csPress, csDisabled, csFocused);

  TUImageKind = (ikFontIcon, ikImage);

  TDefColor = array [TUTheme, TUControlState] of TColor;

  AccentPolicy = packed record
    AccentState: Integer;
    AccentFlags: Integer;
    GradientColor: Integer;
    AnimationId: Integer;
  end;

  WindowCompositionAttributeData = packed record
    Attribute: Cardinal;
    Data: Pointer;
    SizeOfData: Integer;
  end;

  TQuadColor = packed record
    case Boolean of
      True : (Blue, Green, Red, Alpha : Byte);
      False : (Quad : Cardinal);
  end;

  PQuadColor = ^TQuadColor;
  PPQuadColor = ^PQuadColor;

  TControlStateColors = class(TPersistent)
    private
      FNone: TColor;
      FHover: TColor;
      FPress: TColor;
      FDisabled: TColor;
      FFocused: TColor;

      FOnChange: TNotifyEvent;

      procedure SetStateColor(const Index: Integer; const Value: TColor);

    protected 
      procedure Changed;

    public
      constructor Create(aNone, aHover, aPress, aDisabled, aFocused: TColor); overload;
      function GetStateColor(const State: TUControlState): TColor;

    published
      property None: TColor index 0 read FNone write SetStateColor default $000000;
      property Hover: TColor index 1 read FHover write SetStateColor default $000000;
      property Press: TColor index 2 read FPress write SetStateColor default $000000;
      property Disabled: TColor index 3 read FDisabled write SetStateColor default $000000;
      property Focused: TColor index 4 read FFocused write SetStateColor default $000000;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

{$IF CompilerVersion <= 30}
uses
  SysUtils,
  UCL.ShellUIScaling;

function TMonitorHelper.GetPixelsPerInch: Integer;
var
  Ydpi: Cardinal;
  Xdpi: Cardinal;
  DC: HDC;
begin
  if CheckWin32Version(6, 3) then begin
    if GetDpiForMonitor(Handle, TMonitorDpiType.MDT_EFFECTIVE_DPI, Ydpi, Xdpi) = S_OK then
      Result := Ydpi
    else
      Result := 0;
  end
  else begin
    DC := GetDC(0);
    Result := GetDeviceCaps(DC, LOGPIXELSY);
    ReleaseDC(0, DC);
  end;
end;
{$IFEND}

{ TControlStateColors }

procedure TControlStateColors.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

constructor TControlStateColors.Create(aNone, aHover, aPress, aDisabled, aFocused: TColor);
begin
  inherited Create;

  FNone := aNone;
  FHover := aHover;
  FPress := aPress;
  FDisabled := aDisabled;
  FFocused := aFocused;
end;

function TControlStateColors.GetStateColor(const State: TUControlState): TColor;
begin
  case State of
    csNone    : Result := None;
    csHover   : Result := Hover;
    csPress   : Result := Press;
    csDisabled: Result := Disabled;
    csFocused : Result := Focused;
    else
      Result := None;
  end;
end;

procedure TControlStateColors.SetStateColor(const Index: Integer; const Value: TColor);
begin
  case Index of
    0: if Value <> FNone then begin
      FNone := Value;
      Changed;
    end;
    1: if Value <> FHover then begin
      FHover := Value;
      Changed;
    end;
    2: if Value <> FPress then begin
      FPress := Value;
      Changed;
    end;
    3: if Value <> FDisabled then begin
      FDisabled := Value;
      Changed;
    end;
    4: if Value <> FFocused then begin
      FFocused := Value;
      Changed;
    end;
  end;
end;

end.
