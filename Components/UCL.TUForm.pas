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

      procedure SetThemeManager(const Value: TUThemeManager);

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

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property IsActive: Boolean read FIsActive default true;
      property Resizable: Boolean read FResizable write FResizable default true;
  end;

implementation

{ TUForm }

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
  PixelsPerInch := CurrentScreen.PixelsPerInch;

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
var
  CurrentScreen: TMonitor;
begin
  if WindowState = wsMaximized then
    begin
      CurrentScreen := Screen.MonitorFromWindow(Handle);
      Top := CurrentScreen.WorkareaRect.Top;
      Left := CurrentScreen.WorkareaRect.Left;
      Width := CurrentScreen.WorkareaRect.Right - CurrentScreen.WorkareaRect.Left;
      Height := CurrentScreen.WorkareaRect.Bottom - CurrentScreen.WorkareaRect.Top - 1;
        //  Without -1, form will be over screen

      Padding.SetBounds(0, 0, 0, 0);  //  No border space
      Invalidate;
    end
  else
    begin
      Padding.SetBounds(0, 1, 0, 0);
      Invalidate;
      inherited;
    end;
end;

//  MESSAGES

procedure TUForm.WM_Activate(var Msg: TWMActivate);
begin
  inherited;
  FIsActive := Msg.Active <> WA_INACTIVE;
end;

procedure TUForm.WM_DPIChanged(var Msg: TWMDpi);
begin
  PixelsPerInch := Msg.XDpi;
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
  BorderThickness: Integer;
begin
  inherited;

  CaptionBarHeight :=
    GetSystemMetrics(SM_CYFRAME) +
    GetSystemMetrics(SM_CYCAPTION) +
    GetSystemMetrics(SM_CXPADDEDBORDER);
  Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight); //  Hide caption bar

  if WindowState = wsMaximized then
    begin
      BorderThickness := GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CXPADDEDBORDER);
      Dec(Msg.CalcSize_Params.rgrc[0].Left, BorderThickness);
      Inc(Msg.CalcSize_Params.rgrc[0].Right, BorderThickness);
      Inc(Msg.CalcSize_Params.rgrc[0].Bottom, BorderThickness);
    end;
end;

procedure TUForm.WM_NCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if Resizable then
    begin
      if Msg.YPos - BoundsRect.Top < 5 then
        Msg.Result := HTTOP;
    end;
end;

end.
