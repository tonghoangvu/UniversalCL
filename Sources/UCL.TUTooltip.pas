unit UCL.TUTooltip;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.Graphics;

type
  TUCustomTooltip = class(THintWindow)
    const
      DEFAULT_TOOLTIP_HEIGHT = 26;
    private
      var BorderColor: TColor;
      var BackColor: TColor;
      procedure WM_Paint(var Msg: TWMPaint); message WM_PAINT;
      procedure WM_NCPaint(var Msg: TWMNCPaint); message WM_NCPAINT;
    protected
      procedure CreateParams(var Params: TCreateParams); override;
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

//  CUSTOM METHODS

function TUCustomTooltip.CalcHintRect(MaxWidth: Integer;
  const AHint: string; AData: Pointer): TRect;
var
  TextW, TextH: Integer;
begin
  TextW := Canvas.TextWidth(AHint);
  TextH := Canvas.TextHeight(AHint);
  TextW := TextW + (DEFAULT_TOOLTIP_HEIGHT - TextH);  //  Spacing

  Result := Rect(0, 0, TextW, DEFAULT_TOOLTIP_HEIGHT);
end;

//  MESSAGES

procedure TUCustomTooltip.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WindowClass.Style := Params.WindowClass.style and not CS_DROPSHADOW; //  Remove shadow
end;

procedure TUCustomTooltip.WM_NCPaint(var Msg: TWMNCPaint);
var
  TempCanvas: TCanvas;
  TempRect: TRect;
begin
  inherited;
  GetWindowRect(Handle, TempRect);

  //  Paint border (don't use Canvas)
  TempCanvas := TCanvas.Create;
  try
    TempCanvas.Handle := GetWindowDC(Handle);
    TempCanvas.Pen.Color := BorderColor;
    TempCanvas.Pen.Width := 1;
    TempCanvas.Brush.Style := bsClear;
    TempCanvas.Rectangle(0, 0, TempRect.Width, TempRect.Height);
  finally
    TempCanvas.Free;
  end;
end;

procedure TUCustomTooltip.WM_Paint(var Msg: TWMPaint);
var
  TextW, TextH, TextX, TextY: Integer;
begin
  inherited;

  { OPTIMIZE }

  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;
  Canvas.Font.Color := GetTextColorFromBackground(BackColor);

  Canvas.Brush.Color := BackColor;

  TextW := Canvas.TextWidth(Caption);
  TextH := Canvas.TextHeight(Caption);
  TextX := (Width - TextW) div 2;
  TextY := (Height - TextH) div 2 - 1;

  { PAINT }

  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(Rect(0, 0, Width, Height)); //  Clear background
  Canvas.Brush.Style := bsClear;
  Canvas.TextOut(TextX, TextY, Caption);
end;

end.
