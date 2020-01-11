unit UCL.Utils;

interface

uses
  UCL.Classes,
  Types,
  Windows,
  Graphics, GraphUtil,
  Themes,
  UCL.Types;

//  Form
function EnableBlur(FormHandle: HWND; AccentState: Integer): Integer;

//  Glass support
function CreatePreMultipliedRGBQuad(Color: TColor; Alpha: Byte = $FF): TRGBQuad;
function CreateSolidBrushWithAlpha(Color: TColor; Alpha: Byte = $FF): HBRUSH;

//  Color
function BrightenColor(aColor: TColor; Delta: Integer): TColor;
function GetTextColorFromBackground(BackColor: TColor): TColor;
function MulColor(aColor: TColor; Base: Single): TColor;

//  Blend support
function CreateBlendFunc(Alpha: Byte; Gradient: Boolean): BLENDFUNCTION;
procedure AssignBlendBitmap(const Bmp: TBitmap; Color: TColor);
procedure AssignGradientBlendBitmap(const Bmp: TBitmap; Color: TColor; A1, A2: Byte; Direction: TUDirection);
procedure PaintBlendBitmap(const Canvas: TCanvas; DestRect: TRect; const BlendBitmap: TBitmap; BlendFunc: BLENDFUNCTION);

// OS
function CheckMaxWin32Version(AMajor: Integer; AMinor: Integer = 0): Boolean;

implementation

uses
  SysUtils;

//  FORM

function EnableBlur(FormHandle: HWND; AccentState: Integer): Integer;
const
  WCA_ACCENT_POLICY = 19;
var
  apiHandle: THandle;
  Accent: AccentPolicy;
  Data: WindowCompositionAttributeData;
  SetWindowCompositionAttribute: function (hWnd: HWND; var data: WindowCompositionAttributeData):integer; stdcall;
begin
  apiHandle := LoadLibrary('user32.dll');
  try
    @SetWindowCompositionAttribute := GetProcAddress(apiHandle, 'SetWindowCompositionAttribute');
    if @SetWindowCompositionAttribute = nil then
      Result := -1
    else
      begin
        Accent.AccentState := AccentState;

        Data.Attribute := WCA_ACCENT_POLICY;
        Data.SizeOfData := SizeOf(Accent);
        Data.Data := @Accent;

        Result := SetWindowCompositionAttribute(FormHandle, Data);
      end;
  finally
    FreeLibrary(apiHandle);
  end;
end;

//  GLASS SUPPORT

function CreatePreMultipliedRGBQuad(Color: TColor; Alpha: Byte = $FF): TRGBQuad;
begin
  Color := ColorToRGB(Color);
  Result.rgbBlue := MulDiv(GetBValue(Color), Alpha, $FF);
  Result.rgbGreen := MulDiv(GetGValue(Color), Alpha, $FF);
  Result.rgbRed := MulDiv(GetRValue(Color), Alpha, $FF);
  Result.rgbReserved := Alpha;
end;

function CreateSolidBrushWithAlpha(Color: TColor; Alpha: Byte = $FF): HBRUSH;
var
  Info: TBitmapInfo;
begin
  FillChar(Info, SizeOf(Info), 0);
  with Info.bmiHeader do
    begin
      biSize := SizeOf(Info.bmiHeader);
      biWidth := 1;
      biHeight := 1;
      biPlanes := 1;
      biBitCount := 32;
      biCompression := BI_RGB;
    end;
  Info.bmiColors[0] := CreatePreMultipliedRGBQuad(Color, Alpha);
  Result := CreateDIBPatternBrushPt(@Info, 0);
end;

//  COLOR

function BrightenColor(aColor: TColor; Delta: Integer): TColor;
var
  H, S, L: Word;
begin
  ColorRGBToHLS(aColor, H, L, S);   //  VCL.GraphUtil
  L := L + Delta;
  Result := ColorHLSToRGB(H, L, S);
end;

function GetTextColorFromBackground(BackColor: TColor): TColor;
var
  C: Integer;
  R, G, B: Byte;
begin
  C := ColorToRGB(BackColor);
  R := GetRValue(C);
  G := GetGValue(C);
  B := GetBValue(C);
  if 0.299 * R + 0.587 * G + 0.114 * B > 156 then
    Result := $000000
  else
    Result := $FFFFFF;
end;

function MulColor(aColor: TColor; Base: Single): TColor;
var
  C: Integer;
  R, G, B: Byte;
begin
  C := ColorToRGB(aColor);
  R := Round(GetRValue(C) * Base);
  G := Round(GetGValue(C) * Base);
  B := Round(GetBValue(C) * Base);
  Result := RGB(R, G, B);
end;

//  BLEND SUPPORT

function CreateBlendFunc(Alpha: Byte; Gradient: Boolean): BLENDFUNCTION;
begin
  Result.BlendOp := AC_SRC_OVER;
  Result.BlendFlags := 0;
  Result.SourceConstantAlpha := Alpha;

  if Gradient then
    Result.AlphaFormat := AC_SRC_ALPHA
  else
    Result.AlphaFormat := 0;
end;

procedure AssignBlendBitmap(const Bmp: TBitmap; Color: TColor);
begin
  if Bmp <> nil then
    begin
      Bmp.PixelFormat := pf32Bit;
      Bmp.Width := 1;
      Bmp.Height := 1;
      Bmp.Canvas.Brush.Color := Color;
      Bmp.Canvas.FillRect(Rect(0, 0, 1, 1));
    end;
end;

procedure AssignGradientBlendBitmap(const Bmp: TBitmap; Color: TColor; A1, A2: Byte; Direction: TUDirection);
var
  Alpha, Percent: Single;
  R, G, B, A: Byte;
  X, Y: Integer;
  Pixel: PQuadColor;
begin
  if Bmp = nil then exit;
  Bmp.PixelFormat := pf32Bit;

  R := GetRValue(Color);
  G := GetGValue(Color);
  B := GetBValue(Color);

  for Y := 0 to Bmp.Height - 1 do
    begin
      Pixel := Bmp.ScanLine[Y];
      for X := 0 to Bmp.Width - 1 do
        begin
          case Direction of
            dTop:
              Percent := 1 - Y / Bmp.Height;
            dLeft:
              Percent := 1 - X / Bmp.Width;
            dRight:
              Percent := X / Bmp.Width;
            dBottom:
              Percent := Y / Bmp.Height;
            else
              continue;
          end;

          A := A1 + Trunc(Percent * (A2 - A1));
          Alpha := A / 255;

          Pixel.Alpha := A;
          Pixel.Red := Trunc(R * Alpha);
          Pixel.Green := Trunc(G * Alpha);
          Pixel.Blue := Trunc(B * Alpha);
          inc(Pixel);
        end;
    end;
end;

procedure PaintBlendBitmap(const Canvas: TCanvas; DestRect: TRect; const BlendBitmap: TBitmap; BlendFunc: BLENDFUNCTION);
begin
  AlphaBlend(Canvas.Handle,
    DestRect.Left, DestRect.Top, DestRect.Width, DestRect.Height,
    BlendBitmap.Canvas.Handle, 0, 0, BlendBitmap.Width, BlendBitmap.Height,
    BlendFunc);
end;

function CheckMaxWin32Version(AMajor: Integer; AMinor: Integer = 0): Boolean;
begin
  Result := (Win32MajorVersion <= AMajor) or
            ((Win32MajorVersion = AMajor) and
             (Win32MinorVersion <= AMinor));
end;

end.
