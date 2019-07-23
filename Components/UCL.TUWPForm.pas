unit UCL.TUWPForm;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUTooltip,
  System.Classes, System.SysUtils,
  Winapi.Windows, Winapi.Messages,
  VCL.Forms, VCL.Controls, VCL.ExtCtrls, VCL.Graphics;

type
  TUWPForm = class(TForm, IUThemeControl)
    const
      DEFAULT_BORDERCOLOR = $707070;

    private
      var BorderColor: TColor;

      FThemeManager: TUThemeManager;
      FResizeable: Boolean;
    FResizable: Boolean;

      procedure SetThemeManager(const Value: TUThemeManager);

      procedure WM_DPIChanged(var Msg: TWMDpi); message WM_DPICHANGED;
      procedure WM_NCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
      procedure WM_DWMColorizationColorChanged(var Msg: TMessage); message WM_DWMCOLORIZATIONCOLORCHANGED;

    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;  //  IUThemeControl

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property Resizable: Boolean read FResizable write FResizable default true;
  end;

implementation

{ THEME }

procedure TUWPForm.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current TM
      if FThemeManager <> nil then
        FThemeManager.DisconnectControl(Self);

      //  Connect to new TM
      if Value <> nil then
        Value.ConnectControl(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUWPForm.UpdateTheme;
begin
  //  Background color & tooltip
  if ThemeManager = nil then
    begin
      Color := $FFFFFF;
      HintWindowClass := TULightTooltip; //  Light tooltip
    end
  else if ThemeManager.Theme = utLight then
    begin
      Color := $FFFFFF;
      HintWindowClass := TULightTooltip;
    end
  else
    begin
      Color := $000000;
      HintWindowClass := TUDarkTooltip;
    end;

  //  Border color
  if ThemeManager = nil then
    BorderColor := DEFAULT_BORDERCOLOR
  else if ThemeManager.ColorOnBorder = true then
    BorderColor := ThemeManager.ActiveColor
  else
    BorderColor := DEFAULT_BORDERCOLOR;

  Invalidate; //  Repaint
end;

{ MAIN CLASS }

constructor TUWPForm.Create(aOwner: TComponent);
begin
  inherited;

  PixelsPerInch := Screen.PixelsPerInch;  //  Get screen PPI on create
  Padding.SetBounds(0, 1, 0, 0);

  FResizeable := true;

  UpdateTheme;
end;

{ CUSTOM METHODS }

procedure TUWPForm.Paint;
begin
  inherited;
  if WindowState <> wsMaximized then
    begin
      Canvas.Pen.Color := BorderColor;
      Canvas.MoveTo(0, 0);
      Canvas.LineTo(Width, 0);
    end;
end;

procedure TUWPForm.Resize;
begin
  if WindowState = wsMaximized then
    begin
      Left := Screen.WorkAreaRect.Left;
      Top := Screen.WorkAreaRect.Top;
      Width := Screen.WorkAreaRect.Right - Screen.WorkAreaRect.Left;
      Height := Screen.WorkAreaRect.Bottom - Screen.WorkAreaRect.Top - 1;

      Padding.SetBounds(0, 0, 0, 0);
    end
  else
    Padding.SetBounds(0, 1, 0, 0);

  inherited;
  Invalidate;
end;

{ MESSAGES }

procedure TUWPForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or WS_OVERLAPPEDWINDOW;  //  Enabled aerosnap
end;

procedure TUWPForm.WM_DPIChanged(var Msg: TWMDpi);
begin
  PixelsPerInch := Msg.XDpi;
end;

procedure TUWPForm.WM_DWMColorizationColorChanged(var Msg: TMessage);
begin
  if ThemeManager <> nil then
    ThemeManager.ReloadAutoSettings;
  inherited;
end;

procedure TUWPForm.WM_NCCalcSize(var Msg: TWMNCCalcSize);
begin
  if WindowState = wsMaximized then
    Msg.Result := 0
  else
    begin
      inherited;
      Msg.CalcSize_Params.rgrc[0].Top := Msg.CalcSize_Params.rgrc[0].Top - 31;
    end;
end;

procedure TUWPForm.WM_NCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if Msg.YPos - BoundsRect.Top < 5 then
    Msg.Result := HTTOP;
end;

end.
