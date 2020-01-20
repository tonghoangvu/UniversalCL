unit UCL.TUTooltip;

interface

uses
  UCL.Classes, UCL.Utils, UCL.Graphics, UCL.Colors,
  Classes, Types,
  Windows, Messages,
  Controls, Graphics;

type
  TUCustomTooltip = class(THintWindow)
    const
      VERT_SPACE: Byte = 5;
      HORZ_SPACE: Byte = 7;

    private
      var ShowShadow: Boolean;
      var BorderThickness: Byte;
      var BorderColor, BackColor: TColor;

    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure Paint; override;
      procedure NCPaint(DC: HDC); override;

    public
      constructor Create(aOwner: TComponent); override;
      function CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect; override;
  end;

  TULightTooltip = class(TUCustomTooltip)
    public
      constructor Create(aOwner: TComponent); override;
  end;

  TUDarkTooltip = class(TUCustomTooltip)
    public
      constructor Create(aOwner: TComponent); override;
  end;

implementation

{ TULightTooltip }

constructor TULightTooltip.Create(aOwner: TComponent);
begin
  inherited;
  BackColor := TOOLTIP_BACK.LightColor;
  BorderColor := TOOLTIP_BORDER.LightColor;
end;

{ TUDarkTooltip }

constructor TUDarkTooltip.Create(aOwner: TComponent);
begin
  inherited;
  BackColor := TOOLTIP_BACK.DarkColor;
  BorderColor := TOOLTIP_BORDER.DarkColor;
end;

{ TUCustomTooltip }

//  MAIN CLASS

constructor TUCustomTooltip.Create(aOwner: TComponent);
begin
  inherited;
  ShowShadow := TOOLTIP_SHADOW;
  BorderThickness := TOOLTIP_BORDER_THICKNESS;
end;

procedure TUCustomTooltip.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not WS_BORDER;

  if not ShowShadow then
    Params.WindowClass.style := Params.WindowClass.style and not CS_DROPSHADOW;
end;

//  CUSTOM METHODS

function TUCustomTooltip.CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect;
begin
  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;

  Result := System.Types.Rect(0, 0, MaxWidth, 0);
  DrawText(Canvas.Handle, AHint, -1, Result, DT_CALCRECT or DT_LEFT or
    DT_WORDBREAK or DT_NOPREFIX or DrawTextBiDiModeFlagsReadingOnly);
  Inc(Result.Right, 2 * (HORZ_SPACE + BorderThickness));
  Inc(Result.Bottom, 2 * (VERT_SPACE + BorderThickness));
end;

procedure TUCustomTooltip.Paint;
var
  TextRect: TRect;
begin
  //  Paint background
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  //  Draw border
  Canvas.Brush.Style := bsClear;
  DrawBorder(Canvas, Rect(0, 0, Width, Height), BorderColor, BorderThickness);

  //  Draw text
  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;
  Canvas.Font.Color := GetTextColorFromBackground(BackColor);

  TextRect := Rect(
    HORZ_SPACE + BorderThickness, VERT_SPACE + BorderThickness,
    Width - HORZ_SPACE - BorderThickness, Height - VERT_SPACE - BorderThickness);
  DrawText(Canvas.Handle, Caption, -1, TextRect, DT_WORDBREAK or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);
end;

procedure TUCustomTooltip.NCPaint(DC: HDC);
begin
  //  Do nothing
end;

end.
