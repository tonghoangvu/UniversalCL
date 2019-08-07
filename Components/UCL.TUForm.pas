unit UCL.TUForm;

interface

uses
  UCL.Classes, UCL.SystemSettings, UCL.TUThemeManager, UCL.TUTooltip,
  System.Classes, System.SysUtils,
  Winapi.Windows, Winapi.Messages,
  VCL.Forms, VCL.Controls, VCL.ExtCtrls, VCL.Graphics;

type
  TUForm = class(TForm, IUThemeComponent)
    const
      DEFAULT_BORDERCOLOR_ACTIVE_LIGHT = $707070;
      DEFAULT_BORDERCOLOR_ACTIVE_DARK = $242424;
      DEFAULT_BORDERCOLOR_INACTIVE_LIGHT = $9B9B9B;
      DEFAULT_BORDERCOLOR_INACTIVE_DARK = $414141;

    private
      var BorderColor: TColor;

      FThemeManager: TUThemeManager;
      FIsActive: Boolean;
      FResizable: Boolean;
      FPPI: Integer;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_Activate(var Msg: TWMActivate); message WM_ACTIVATE;
      procedure WM_DPIChanged(var Msg: TWMDpi); message WM_DPICHANGED;
      procedure WM_DWMColorizationColorChanged(var Msg: TMessage); message WM_DWMCOLORIZATIONCOLORCHANGED;
      procedure WM_NCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    protected
      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
      procedure UpdateBorderColor;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property IsActive: Boolean read FIsActive default true;
      property Resizable: Boolean read FResizable write FResizable default true;
      property PPI: Integer read FPPI write FPPI default 96;
  end;

implementation

{ TUForm }

//  UTILS

procedure TUForm.UpdateBorderColor;
begin
  //  Border color
  if ThemeManager = nil then
    BorderColor := DEFAULT_BORDERCOLOR_ACTIVE_LIGHT //  Not set ThemeManager

  else if ThemeManager.ColorOnBorder then
    BorderColor := ThemeManager.AccentColor //  Use accent color

  else if ThemeManager.Theme = utLight then
    //  Light
    begin
      if IsActive then
        BorderColor := DEFAULT_BORDERCOLOR_ACTIVE_LIGHT
      else
        BorderColor := DEFAULT_BORDERCOLOR_INACTIVE_LIGHT;
    end
  else
    //  Dark
    begin
      if IsActive then
        BorderColor := DEFAULT_BORDERCOLOR_ACTIVE_DARK
      else
        BorderColor := DEFAULT_BORDERCOLOR_INACTIVE_DARK;
    end;
end;

//  THEME

procedure TUForm.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      if Value <> nil then
        Value.Connect(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUForm.UpdateTheme;
begin
  //  Background color & tooltip style
  if ThemeManager = nil then
    begin
      Color := $FFFFFF;
      HintWindowClass := THintWindow; //  Default hint style
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

  UpdateBorderColor;
  Invalidate;
end;

//  MAIN CLASS

constructor TUForm.Create(aOwner: TComponent);
var
  CurrentScreen: TMonitor;
begin
  inherited;
  FIsActive := true;
  FResizable := true;

  Padding.SetBounds(0, 1, 0, 0);  //  Top space

  //  Get PPI from current screen
  CurrentScreen := Screen.MonitorFromWindow(Handle);
  FPPI := CurrentScreen.PixelsPerInch;

  UpdateTheme;
end;

//  CUSTOM METHODS

procedure TUForm.Paint;
begin
  inherited;
  if WindowState <> wsMaximized then  //  No border on maximized
    begin
      Canvas.Pen.Color := BorderColor;
      Canvas.MoveTo(0, 0);
      Canvas.LineTo(Width, 0);  //  Paint top border
    end;
end;

procedure TUForm.Resize;
begin
  inherited;
  if WindowState = wsMaximized then
    Padding.SetBounds(0, 0, 0, 0)
  else
    Padding.SetBounds(0, 1, 0, 0);
end;

//  MESSAGES

procedure TUForm.WM_Activate(var Msg: TWMActivate);
begin
  inherited;
  FIsActive := Msg.Active <> WA_INACTIVE;

  //  Paint top border
  if WindowState <> wsMaximized then
    begin
      UpdateBorderColor;
      Canvas.Pen.Color := BorderColor;
      Canvas.MoveTo(0, 0);
      Canvas.LineTo(Width, 0);
    end;
end;

procedure TUForm.WM_DPIChanged(var Msg: TWMDpi);
begin
  PPI := Msg.XDpi;
  inherited;
end;

procedure TUForm.WM_DWMColorizationColorChanged(var Msg: TMessage);
begin
  if ThemeManager <> nil then
    ThemeManager.ReloadAutoSettings;
  inherited;
end;

procedure TUForm.WM_NCCalcSize(var Msg: TWMNCCalcSize);
var
  CaptionBarHeight: Integer;
  BorderSpace: Integer;
begin
  inherited;

  CaptionBarHeight :=
    GetSystemMetrics(SM_CYFRAME) +
    GetSystemMetrics(SM_CYCAPTION) +
    GetSystemMetrics(SM_CXPADDEDBORDER);
  Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight); //  Hide caption bar

  if WindowState = wsMaximized then //  Add space on top
    begin
      BorderSpace := GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CXPADDEDBORDER);
      Inc(Msg.CalcSize_Params.rgrc[0].Top, BorderSpace);
    end;
end;

procedure TUForm.WM_NCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if Resizable then
    begin
      if Msg.YPos - BoundsRect.Top < 5 then
        Msg.Result := HTTOP;
    end
  else if //  Preparing to resize
    Msg.Result in [HTTOP, HTTOPLEFT, HTTOPRIGHT, HTLEFT, HTRIGHT, HTBOTTOM, HTBOTTOMLEFT, HTBOTTOMRIGHT]
  then
    Msg.Result := HTNOWHERE;
end;

end.
