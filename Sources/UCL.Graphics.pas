unit UCL.Graphics;

interface

uses
  System.Classes, System.Types,
  Winapi.Windows,
  VCL.Graphics, VCL.Themes;

function PointInRect(const X, Y: Integer; const Rect: TRect): Boolean; overload;
function PointInRect(const p: TPoint; const Rect: TRect): Boolean; overload;
procedure DrawTextRect(const Canvas: TCanvas;
  HAlign: TAlignment; VAlign: TVerticalAlignment;
  Rect: TRect;
  Text: string; TextOnGlass: Boolean);
procedure GetCenterPos(Width, Height: Integer; Rect: TRect;
  out X, Y: Integer);

var
  DEFAULT_GLASSTEXT_GLOWSIZE: Byte;

implementation

const
  HAlignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);
  VAlignments: array[TVerticalAlignment] of Longint = (DT_TOP, DT_BOTTOM, DT_VCENTER);
  CStates: array[Boolean] of TThemedTextLabel = (ttlTextLabelDisabled, ttlTextLabelNormal);

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

procedure DrawTextRect(const Canvas: TCanvas;
  HAlign: TAlignment; VAlign: TVerticalAlignment;
  Rect: TRect;
  Text: string; TextOnGlass: Boolean);
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
      LFormat := TTextFormatFlags(Flags);
      Include(LFormat, tfComposited);

      LOptions.Flags := [stfTextColor, stfGlowSize];
      LOptions.TextColor := Canvas.Font.Color;
      LOptions.GlowSize := DEFAULT_GLASSTEXT_GLOWSIZE;

      StyleServices.DrawText(Canvas.Handle, StyleServices.GetElementDetails(ttlTextLabelNormal),
        Text, Rect, LFormat, LOptions);
    end;
end;

procedure GetCenterPos(Width, Height: Integer; Rect: TRect;
  out X, Y: Integer);
begin
  X := Rect.Left + (Rect.Width - Width) div 2;
  Y := Rect.Top + (Rect.Height - Height) div 2;
end;

initialization
  DEFAULT_GLASSTEXT_GLOWSIZE := 3;

end.
