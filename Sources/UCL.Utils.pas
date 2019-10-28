unit UCL.Utils;

interface

uses
  Winapi.Windows,
  VCL.Graphics, VCL.GraphUtil,
  VCL.Themes;

function CreatePreMultipliedRGBQuad(Color: TColor; Alpha: Byte = $FF): TRGBQuad;
function CreateSolidBrushWithAlpha(Color: TColor; Alpha: Byte = $FF): HBRUSH;
procedure DrawGlassText(const Canvas: TCanvas; Text: string; Rect: TRect; Enabled: Boolean; Flags: Cardinal);

//  Color
function BrightenColor(aColor: TColor; Delta: Integer): TColor;
function GetTextColorFromBackground(BackColor: TColor): TColor;
function MulColor(aColor: TColor; Base: Single): TColor;

implementation

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

procedure DrawGlassText(const Canvas: TCanvas; Text: string; Rect: TRect; Enabled: Boolean; Flags: Cardinal);
const
  CStates: array[Boolean] of TThemedTextLabel = (ttlTextLabelDisabled, ttlTextLabelNormal);
var
  LFormat: TTextFormat;
  LOptions: TStyleTextOptions;
begin
  LFormat := TTextFormatFlags(DT_EXPANDTABS or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  Include(LFormat, tfComposited);

  LOptions.Flags := [stfTextColor, stfGlowSize];
  LOptions.TextColor := Canvas.Font.Color;
  LOptions.GlowSize := 3;

  StyleServices.DrawText(Canvas.Handle,
    StyleServices.GetElementDetails(CStates[Enabled]), Text, Rect, LFormat, LOptions);
end;

{ COLOR }

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

end.
