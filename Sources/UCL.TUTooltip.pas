unit UCL.TUTooltip;

interface

uses
  UCL.Classes, UCL.Utils,
  System.Classes,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.Graphics;

type
  TUCustomTooltip = class(THintWindow)
    const
      DEF_HEIGHT = 26;

    private
      var BorderColor: TColor;
      var BackColor: TColor;

    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure Paint; override;
      procedure NCPaint(DC: HDC); override;

    public
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
  BorderColor := $CCCCCC;
  BackColor := $F2F2F2;
end;

{ TUDarkTooltip }

constructor TUDarkTooltip.Create(aOwner: TComponent);
begin
  inherited;
  BorderColor := $767676;
  BackColor := $2B2B2B;
end;

{ TUCustomTooltip }

//  MAIN CLASS

procedure TUCustomTooltip.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not WS_BORDER;
  Params.WindowClass.style := Params.WindowClass.style and not CS_DROPSHADOW;
end;

//  CUSTOM METHODS

function TUCustomTooltip.CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect;
var
  TextW, TextH: Integer;
begin
  TextW := Canvas.TextWidth(AHint);
  TextH := Canvas.TextHeight(AHint);
  TextW := TextW + (DEF_HEIGHT - TextH);  //  Spacing

  Result := Rect(0, 0, TextW, DEF_HEIGHT);
end;

procedure TUCustomTooltip.Paint;
var
  TextW, TextH, TextX, TextY: Integer;
begin
  //  Paint background
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  //  Draw border
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Color := BorderColor;
  Canvas.Rectangle(0, 0, Width, Height);

  //  Draw text
  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;
  Canvas.Font.Color := GetTextColorFromBackground(BackColor);

  TextW := Canvas.TextWidth(Caption);
  TextH := Canvas.TextHeight(Caption);
  TextX := (Width - TextW) div 2;
  TextY := (Height - TextH) div 2 - 1;

  Canvas.TextOut(TextX, TextY, Caption);
end;

procedure TUCustomTooltip.NCPaint(DC: HDC);
begin
  //  Do nothing
end;

end.
