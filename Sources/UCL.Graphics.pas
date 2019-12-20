unit UCL.Graphics;

interface

uses
  Classes,
  Types,
  Windows,
  Graphics,
  Themes;

{$IF CompilerVersion <= 30}
type
  // Note: tfComposited only supported by ThemeServices.DrawText
  TTextFormats = (tfBottom, tfCalcRect, tfCenter, tfEditControl, tfEndEllipsis,
    tfPathEllipsis, tfExpandTabs, tfExternalLeading, tfLeft, tfModifyString,
    tfNoClip, tfNoPrefix, tfRight, tfRtlReading, tfSingleLine, tfTop,
    tfVerticalCenter, tfWordBreak, tfHidePrefix, tfNoFullWidthCharBreak,
    tfPrefixOnly, tfTabStop, tfWordEllipsis, tfComposited);
  TTextFormat = set of TTextFormats;

const
  DT_NOFULLWIDTHCHARBREAK = $0080000;
  // MASK for tfComposited
  MASK_TF_COMPOSITED      = $00800000;
{$IFEND}  

function PointInRect(const X, Y: Integer; const Rect: TRect): Boolean; overload;
function PointInRect(const p: TPoint; const Rect: TRect): Boolean; overload;
function PointInRect(const p: TSmallPoint; const Rect: TRect): Boolean; overload;
procedure GetCenterPos(Width, Height: Integer; Rect: TRect; out X, Y: Integer);
procedure DrawTextRect(const Canvas: TCanvas; HAlign: TAlignment; VAlign: TVerticalAlignment; Rect: TRect; Text: string; TextOnGlass: Boolean);

var
  DEFAULT_GLASSTEXT_GLOWSIZE: Byte;

implementation

{$IF CompilerVersion <= 30}
uses
  SysUtils,
  DwmApi,
  UxTheme,
  UCL.Types;

type
  TStyleTextFlag = (stfTextColor, stfBorderColor, stfBorderSize, stfShadowColor, stfShadowOffset, stfGlowSize);
  TStyleTextFlags = set of TStyleTextFlag;

  TStyleTextOptions = record
    Flags: TStyleTextFlags;
    TextColor: TColor;
    BorderColor: TColor;
    BorderSize: Integer;
    ShadowColor: TColor;
    ShadowOffset: TPoint;
    GlowSize: Integer;
  end;

const
  COptions: array[TStyleTextFlag] of Cardinal = (DTT_TEXTCOLOR, DTT_BORDERCOLOR, DTT_BORDERSIZE, DTT_SHADOWCOLOR, DTT_SHADOWOFFSET, DTT_GLOWSIZE);
{$IFEND}

const
  HAlignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);
  VAlignments: array[TVerticalAlignment] of Longint = (DT_TOP, DT_BOTTOM, DT_VCENTER);
{$IF CompilerVersion > 29}
  CStates: array[Boolean] of TThemedTextLabel = (ttlTextLabelDisabled, ttlTextLabelNormal);
{$IFEND}

function PointInRect(const X, Y: Integer; const Rect: TRect): Boolean;
begin
  Result :=
    (X >= Rect.Left) and (X <= Rect.Right) and
    (Y >= Rect.Top) and (Y <= Rect.Bottom);
end;

function PointInRect(const p: TPoint; const Rect: TRect): Boolean;
begin
  Result := PointInRect(p.X, p.Y, Rect);
end;

function PointInRect(const p: TSmallPoint; const Rect: TRect): Boolean;
begin
  Result := PointInRect(p.x, p.y, Rect);
end;

procedure GetCenterPos(Width, Height: Integer; Rect: TRect; out X, Y: Integer);
begin
  X := Rect.Left + (Rect.Width - Width) div 2;
  Y := Rect.Top + (Rect.Height - Height) div 2;
end;

{$IF CompilerVersion <= 30}
function TextFlagsToTextFormat(Value: Cardinal): TTextFormat;
begin
  Result := [];
  if (Value and DT_BOTTOM) = DT_BOTTOM then
    Include(Result, tfBottom);
  if (Value and DT_CALCRECT) = DT_CALCRECT then
    Include(Result, tfCalcRect);
  if (Value and DT_CENTER) = DT_CENTER then
    Include(Result, tfCenter);
  if (Value and DT_EDITCONTROL) = DT_EDITCONTROL then
    Include(Result, tfEditControl);
  if (Value and DT_END_ELLIPSIS) = DT_END_ELLIPSIS then
    Include(Result, tfEndEllipsis);
  if (Value and DT_PATH_ELLIPSIS) = DT_PATH_ELLIPSIS then
    Include(Result, tfPathEllipsis);
  if (Value and DT_EXPANDTABS) = DT_EXPANDTABS then
    Include(Result, tfExpandTabs);
  if (Value and DT_EXTERNALLEADING) = DT_EXTERNALLEADING then
    Include(Result, tfExternalLeading);
  if (Value and DT_LEFT) = DT_LEFT then
    Include(Result, tfLeft);
  if (Value and DT_MODIFYSTRING) = DT_MODIFYSTRING then
    Include(Result, tfModifyString);
  if (Value and DT_NOCLIP) = DT_NOCLIP then
    Include(Result, tfNoClip);
  if (Value and DT_NOPREFIX) = DT_NOPREFIX then
    Include(Result, tfNoPrefix);
  if (Value and DT_RIGHT) = DT_RIGHT then
    Include(Result, tfRight);
  if (Value and DT_RTLREADING) = DT_RTLREADING then
    Include(Result, tfRtlReading);
  if (Value and DT_SINGLELINE) = DT_SINGLELINE then
    Include(Result, tfSingleLine);
  if (Value and DT_TOP) = DT_TOP then
    Include(Result, tfTop);
  if (Value and DT_VCENTER) = DT_VCENTER then
    Include(Result, tfVerticalCenter);
  if (Value and DT_WORDBREAK) = DT_WORDBREAK then
    Include(Result, tfWordBreak);
  if (Value and DT_HIDEPREFIX) = DT_HIDEPREFIX then
    Include(Result, tfHidePrefix);
  if (Value and DT_NOFULLWIDTHCHARBREAK) = DT_NOFULLWIDTHCHARBREAK then
    Include(Result, tfNoFullWidthCharBreak);
  if (Value and DT_PREFIXONLY) = DT_PREFIXONLY then
    Include(Result, tfPrefixOnly);
  if (Value and DT_TABSTOP) = DT_TABSTOP then
    Include(Result, tfTabStop);
  if (Value and DT_WORD_ELLIPSIS) = DT_WORD_ELLIPSIS then
    Include(Result, tfWordEllipsis);
  if (Value and MASK_TF_COMPOSITED) = MASK_TF_COMPOSITED then
    Include(Result, tfComposited);
end;

function StyleTextOptionsToDTTOpts(Options: TStyleTextOptions; Flags: TTextFormat): TDTTOpts;
var
  LTextOption: TStyleTextFlag;
begin
  FillChar(Result, SizeOf(TDTTOpts), 0);
  Result.dwSize := SizeOf(TDTTOpts);
  //
  for LTextOption := Low(TStyleTextFlag) to High(TStyleTextFlag) do
    if (LTextOption in Options.Flags) then
      Result.dwFlags := Result.dwFlags or COptions[LTextOption];
  //
  Result.crText         := Graphics.ColorToRGB(Options.TextColor);
  Result.crBorder       := Graphics.ColorToRGB(Options.BorderColor);
  Result.iBorderSize    := Options.BorderSize;
  Result.crShadow       := Graphics.ColorToRGB(Options.ShadowColor);
  Result.ptShadowOffset := Options.ShadowOffset;
  Result.iGlowSize      := Options.GlowSize;
  if (tfComposited in Flags) then
    Result.dwFlags := Result.dwFlags or DTT_COMPOSITED;
  if (tfCalcRect in Flags) then
    Result.dwFlags := Result.dwFlags or DTT_CALCRECT;
end;

procedure DrawGlassText(Canvas: TCanvas; GlowSize: Integer; var Rect: TRect; var Text: String; Format: DWORD; Options: TStyleTextOptions); overload;
var
  DTTOpts: TDTTOpts;
begin
  if Win32MajorVersion < 6 then begin
    DrawTextW(Canvas.Handle, PWideChar(Text), Length(Text), Rect, Format);
    Exit;
  end;
  DTTOpts:=StyleTextOptionsToDTTOpts(Options, TextFlagsToTextFormat(Format));
  with ThemeServices.GetElementDetails(teEditTextNormal) do
    DrawThemeTextEx(ThemeServices.Theme[teEdit], Canvas.Handle, Part, State, PWideChar(Text), Length(Text), Format, @Rect, DTTOpts);
end;

procedure DrawGlassText(Canvas: TCanvas; GlowSize: Integer; var Rect: TRect; var Text: String; TextFormat: TTextFormat; Options: TStyleTextOptions); overload;
const
  cTextFormats: array[TTextFormats] of DWORD = (
    DT_BOTTOM, DT_CALCRECT, DT_CENTER, DT_EDITCONTROL, DT_END_ELLIPSIS, DT_PATH_ELLIPSIS, DT_EXPANDTABS, DT_EXTERNALLEADING, DT_LEFT,
    DT_MODIFYSTRING, DT_NOCLIP, DT_NOPREFIX, DT_RIGHT, DT_RTLREADING, DT_SINGLELINE, DT_TOP, DT_VCENTER, DT_WORDBREAK, DT_HIDEPREFIX,
    DT_NOFULLWIDTHCHARBREAK, DT_PREFIXONLY, DT_TABSTOP, DT_WORD_ELLIPSIS, MASK_TF_COMPOSITED {tfComposited}
  );
var
  Format: DWORD;
  F: TTextFormats;
begin
  Format := 0;
  for F in TextFormat do
    Format := Format or cTextFormats[F];
  DrawGlassText(Canvas, GlowSize, Rect, Text, Format, Options);
end;
{$IFEND}

procedure DrawTextRect(const Canvas: TCanvas; HAlign: TAlignment; VAlign: TVerticalAlignment; Rect: TRect; Text: string; TextOnGlass: Boolean);
var
  Flags: Cardinal;
  LFormat: TTextFormat;
  LOptions: TStyleTextOptions;
begin
  Flags := DT_EXPANDTABS or DT_SINGLELINE or HAlignments[HAlign] or VAlignments[VAlign];

  if not TextOnGlass then
    DrawText(Canvas.Handle, Text, Length(Text), Rect, Flags)
  else
    begin
    {$IF CompilerVersion <= 30}
      LFormat := TextFlagsToTextFormat(Flags);
    {$ELSE}
      LFormat := TTextFormatFlags(Flags);
    {$IFEND}

      LOptions.Flags := [stfTextColor, stfGlowSize];
      LOptions.TextColor := Canvas.Font.Color;
      LOptions.GlowSize := DEFAULT_GLASSTEXT_GLOWSIZE;

    {$IF CompilerVersion <= 30}
      //GetThemeInt() // TMT_TEXTGLOWSIZE
      DrawGlassText(Canvas, DEFAULT_GLASSTEXT_GLOWSIZE, Rect, Text, LFormat, LOptions);
    {$ELSE}
      Include(LFormat, tfComposited);
      StyleServices.DrawText(Canvas.Handle, StyleServices.GetElementDetails(ttlTextLabelNormal), Text, Rect, LFormat, LOptions);
    {$IFEND}
    end;
end;

initialization
  DEFAULT_GLASSTEXT_GLOWSIZE := 0;

end.
