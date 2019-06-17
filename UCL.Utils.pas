unit UCL.Utils;

interface

uses
  VCL.Graphics, VCL.GraphUtil,
  Winapi.Windows;

//  Color utils
function BrightenColor(aColor: TColor; Delta: Integer): TColor;
function GetTextColorFromBackground(BackgroundColor: TColor): TColor;
function ChangeColor(aColor: TColor; Base: Single): TColor;

implementation

{ COLOR UTILS }

function BrightenColor(aColor: TColor; Delta: Integer): TColor;
var
  H, S, L: Word;
begin
  ColorRGBToHLS(aColor, H, L, S);   //  VCL.GraphUtil
  L := L + Delta;
  Result := ColorHLSToRGB(H, L, S);
end;

function GetTextColorFromBackground(BackgroundColor: TColor): TColor;
var
  C: Integer;
  R, G, B: Byte;
begin
  C := ColorToRGB(BackgroundColor);
  R := GetRValue(C);
  G := GetGValue(C);
  B := GetBValue(C);
  if 0.299 * R + 0.587 * G + 0.114 * B > 186 then
    Result := clBlack
  else
    Result := clWhite;
end;

function ChangeColor(aColor: TColor; Base: Single): TColor;
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
