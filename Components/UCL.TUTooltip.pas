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
      DEFAULT_HEIGHT = 26;

    private
      var BorderColor: TColor;
      var BackColor: TColor;

      procedure WMNCPaint(var Msg: TMessage); message WM_NCPAINT;
      procedure WMPaint(var Msg: TMessage); message WM_PAINT;

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

{ LIGHT TOOLTIP }

constructor TULightTooltip.Create(aOwner: TComponent);
begin
  inherited;

  BorderColor := $CCCCCC;
  BackColor := $F2F2F2;
end;

{ DARK TOOLTIP }

constructor TUDarkTooltip.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  BorderColor := $767676;
  BackColor := $2B2B2B;
end;

{ CUSTOM TOOLTIP }

function TUCustomTooltip.CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect;
var
  TextW, TextH: Integer;
begin
  TextW := Canvas.TextWidth(AHint);
  TextH := Canvas.TextHeight(AHint);
  TextW := TextW + (DEFAULT_HEIGHT - TextH);  //  Spacing

  Result := Rect(0, 0, TextW, DEFAULT_HEIGHT);
end;

{ MESSAGES }

procedure TUCustomTooltip.WMNCPaint(var Msg: TMessage);
var
  C: TCanvas;
  R: TRect;
begin
  inherited;

  GetWindowRect(Handle, R);
  Msg.Result := 1;

  C := TCanvas.Create;
  try
    C.Handle := GetWindowDC(Handle);
    C.Pen.Color := BorderColor;
    C.Pen.Width := 2;
    C.Brush.Style := bsClear;
    C.Rectangle(1, 1, R.Right - R.Left, R.Bottom - R.Top);
  finally
    C.Free;
  end;
end;

procedure TUCustomTooltip.WMPaint(var Msg: TMessage);
var
  TextW, TextH, TextX, TextY: Integer;
begin
  inherited;

  //  Clear background
  Canvas.Brush.Color := BackColor;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 8;
  Canvas.Font.Color := GetTextColorFromBackground(BackColor);

  //  Paint text
  TextW := Canvas.TextWidth(Caption);
  TextH := Canvas.TextHeight(Caption);
  TextX := (Width - TextW) div 2;
  TextY := (Height - TextH) div 2 - 1;
  Canvas.TextOut(TextX, TextY, Caption);
end;

end.
