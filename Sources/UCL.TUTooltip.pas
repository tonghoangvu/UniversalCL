unit UCL.TUTooltip;

interface

uses
  UCL.Classes, UCL.Utils,
  Classes,
  Windows, Messages,
  Controls, Graphics;

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

uses
  UCL.Colors;

{ TULightTooltip }

constructor TULightTooltip.Create(aOwner: TComponent);
begin
  inherited;
  BorderColor := TOOLTIP_BORDER_LIGHT;
  BackColor := TOOLTIP_BACK_LIGHT;
end;

{ TUDarkTooltip }

constructor TUDarkTooltip.Create(aOwner: TComponent);
begin
  inherited;
  BorderColor := TOOLTIP_BORDER_DARK;
  BackColor := TOOLTIP_BACK_DARK;
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
  MaxTextW: Integer;
  i, LineCount, Pos: Integer;
begin
  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;

  LineCount := 1;                            //   123456789
  Pos := 0;                                  //   A_BCD_123
  MaxTextW := 0;
  for i := 1 to Length(AHint) do
    if (AHint[i] = #13) or (i = Length(AHint)) then
      begin
        if AHint[i] = #13 then
          TextW := Canvas.TextWidth(Copy(AHint, Pos, i - Pos - 1))
        else 
          TextW := Canvas.TextWidth(Copy(AHint, Pos, i - Pos));
        
        if TextW > MaxTextW then
          MaxTextW := TextW;
        Pos := i;
        
        if AHint[i] = #13 then
          inc(LineCount);
      end;

  if LineCount = 1 then
    begin
      TextW := Canvas.TextWidth(AHint);
      TextH := Canvas.TextHeight(AHint);
    end
  else 
    begin
      TextW := MaxTextW;
      TextH := LineCount * Canvas.TextHeight(AHint);  
    end;
      
  Result := Rect(0, 0, TextW + 16, TextH + 12);
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
  Canvas.Pen.Color := BorderColor;
  Canvas.Rectangle(0, 0, Width, Height);

  //  Draw text
  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;
  Canvas.Font.Color := GetTextColorFromBackground(BackColor);

  TextRect := Rect(8, 6, Width - 8, Height);
  DrawText(Canvas.Handle, Caption, -1, TextRect, DT_WORDBREAK or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);
end;

procedure TUCustomTooltip.NCPaint(DC: HDC);
begin
  //  Do nothing
end;

end.
