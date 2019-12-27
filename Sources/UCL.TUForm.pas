unit UCL.TUForm;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUTooltip, UCL.Utils, UCL.SystemSettings,
  Classes,
  Windows, Messages,
  Forms, Controls, Graphics;

type
  TUFocusForm = class(TForm)
    protected
      procedure Paint; override;
  end;

  TUForm = class(TForm, IUThemeComponent)
    const
      DEFAULT_BORDERCOLOR_ACTIVE_LIGHT = $707070;
      DEFAULT_BORDERCOLOR_ACTIVE_DARK = $242424;
      DEFAULT_BORDERCOLOR_INACTIVE_LIGHT = $9B9B9B;
      DEFAULT_BORDERCOLOR_INACTIVE_DARK = $414141;

    private
      var BorderColor: TColor;

      FThemeManager: TUThemeManager;

      FPPI: Integer;
      FIsActive: Boolean;
      FFitDesktopForPopup: Boolean;
      FDrawBorder: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_Activate(var Msg: TWMActivate); message WM_ACTIVATE;
      procedure WM_DPIChanged(var Msg: TWMDpi); message WM_DPICHANGED;
      procedure WM_DWMColorizationColorChanged(var Msg: TMessage); message WM_DWMCOLORIZATIONCOLORCHANGED;
      procedure WM_NCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

      //  Internal
      function GetTopBorderSpace: Integer;
      function GetBottomBorderSpace: Integer;
      function GetBorderSpace: Integer;
      function IsBorderless: Boolean;
      function CanDrawBorder: Boolean;
      procedure UpdateBorderColor;
      procedure DoDrawBorder;

    protected
    {$IF CompilerVersion < 30}
      FCurrentPPI: Integer;
      FIsScaling: Boolean;
      function GetDesignDpi: Integer; virtual;
      function GetParentCurrentDpi: Integer; virtual;
    {$IFEND}

      procedure CreateParams(var Params: TCreateParams); override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
    {$IF CompilerVersion < 30}
      procedure ScaleForPPI(NewPPI: Integer); virtual;
    {$IFEND}

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property PPI: Integer read FPPI write FPPI default 96;
      property IsActive: Boolean read FIsActive default true;
      property FitDesktopForPopup: Boolean read FFitDesktopForPopup write FFitDesktopForPopup default false;
      property DrawBorder: Boolean read FDrawBorder write FDrawBorder default true;

      property Padding stored false;
  end;

implementation

uses
  SysUtils,
  UCL.Types;

{ TUFocusForm }

procedure TUFocusForm.Paint;
begin
  inherited;
  Canvas.Pen.Color := clblack;
  Canvas.pen.Width := 2;
  Canvas.Rectangle(1, 1, ClientWidth - 1, ClientHeight - 1);
end;

{ TUForm }

//  INTERNAL

function TUForm.GetTopBorderSpace: Integer;
begin
  case BorderStyle of
    bsSingle: begin
      Result := GetSystemMetrics(SM_CYFIXEDFRAME);
    end;
    bsDialog, bsToolWindow: begin
      Result := GetSystemMetrics(SM_CYDLGFRAME);
    end;
    bsSizeable, bsSizeToolWin: begin
      Result := GetSystemMetrics(SM_CYSIZEFRAME) + GetSystemMetrics(SM_CXPADDEDBORDER);
    end
  else
    Result := 0;
  end;
end;

function TUForm.GetBottomBorderSpace: Integer;
begin
  case BorderStyle of
    bsSingle: begin
      Result := GetSystemMetrics(SM_CYFIXEDFRAME);
    end;
    bsDialog, bsToolWindow: begin
      Result := GetSystemMetrics(SM_CYDLGFRAME);
    end;
    bsSizeable, bsSizeToolWin: begin
      Result := GetSystemMetrics(SM_CYSIZEFRAME);
    end
  else
    Result := 0;
  end;
end;

procedure TUForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
{$IF CompilerVersion < 30}
  with Params do
    WindowClass.Style := WindowClass.Style or CS_DROPSHADOW;
{$IFEND}
end;

function TUForm.GetBorderSpace: Integer;
begin
  case BorderStyle of
    bsSingle: begin
      Result := GetSystemMetrics(SM_CXFIXEDFRAME);
    end;
    bsDialog, bsToolWindow: begin
      Result := GetSystemMetrics(SM_CXDLGFRAME);
    end;
    bsSizeable, bsSizeToolWin: begin
      Result := GetSystemMetrics(SM_CXSIZEFRAME) + GetSystemMetrics(SM_CXPADDEDBORDER);
    end
  else
    Result := 0;
  end;
end;

function TUForm.IsBorderless: Boolean;
begin
  Result := BorderStyle in [bsNone, bsToolWindow, bsSizeToolWin];
end;

function TUForm.CanDrawBorder: Boolean;
begin
  Result := DrawBorder and (WindowState = wsNormal) and (not IsBorderless);
end;

procedure TUForm.UpdateBorderColor;
begin
  if ThemeManager = nil then
    BorderColor := DEFAULT_BORDERCOLOR_ACTIVE_LIGHT

  //  Active window
  else if IsActive then
    begin
      if ThemeManager.ColorOnBorder then
        BorderColor := GetAccentColor
      else if ThemeManager.Theme = utLight then
        BorderColor := DEFAULT_BORDERCOLOR_ACTIVE_LIGHT
      else
        BorderColor := DEFAULT_BORDERCOLOR_ACTIVE_DARK;
    end

  //  In active window
  else
    begin
      if ThemeManager.Theme = utLight then
        BorderColor := DEFAULT_BORDERCOLOR_INACTIVE_LIGHT
      else
        BorderColor := DEFAULT_BORDERCOLOR_INACTIVE_DARK;
    end;
end;

procedure TUForm.DoDrawBorder;
begin
  UpdateBorderColor;
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
  Canvas.Pen.Color := BorderColor;
  Canvas.MoveTo(0, 0);
//  Canvas.LineTo(ClientWidth, 0);
  Canvas.LineTo(Width, 0);  //  Paint top border
  if CheckMaxWin32Version(6, 3) then begin // paint other borders
    Canvas.MoveTo(Width - 1, 0);
    Canvas.LineTo(Width - 1, Height);
    Canvas.MoveTo(Width - 1, Height - 1);
    Canvas.LineTo(0, Height - 1);
    Canvas.LineTo(0, 0);
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
        begin
          Value.Connect(Self);
          Value.FreeNotification(Self);
        end;

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
      HintWindowClass := THintWindow;   //  Default
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

{$IF CompilerVersion < 30}
function TUForm.GetDesignDpi: Integer;
var
  LForm: TCustomForm;
begin
  LForm := GetParentForm(Self);

  if (LForm <> nil) and (LForm is TForm) then
    Result := TForm(LForm).PixelsPerInch
  else
    Result := Windows.USER_DEFAULT_SCREEN_DPI;
end;

function TUForm.GetParentCurrentDpi: Integer;
begin
//  if Parent <> nil then
//    Result := Parent.GetParentCurrentDpi
//  else
    Result := FCurrentPPI;
end;

procedure TUForm.ScaleForPPI(NewPPI: Integer);
begin
  if not FIsScaling and (NewPPI > 0) then begin
    FIsScaling := True;
    try
      if FCurrentPPI = 0 then
        FCurrentPPI := GetDesignDpi;

      if NewPPI <> FCurrentPPI then begin
        ChangeScale(NewPPI, FCurrentPPI{, True});
        FCurrentPPI := NewPPI;
      end
    finally
      FIsScaling := False;
    end;
  end;
end;
{$IFEND}

procedure TUForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  MAIN CLASS

constructor TUForm.Create(aOwner: TComponent);
var
  CurrentScreen: TMonitor;
begin
  inherited;

  //  New props
  FIsActive := true;
  FFitDesktopForPopup := false;
  FDrawBorder := true;

  //  Get PPI from current screen
  CurrentScreen := Screen.MonitorFromWindow(Handle);
  FPPI := CurrentScreen.PixelsPerInch;
{$IF CompilerVersion < 30}
  FIsScaling := False;
  FCurrentPPI := FPPI;
{$IFEND}

  //  Common props
  Font.Name := 'Segoe UI';
  Font.Size := 10;
end;

//  CUSTOM METHODS

procedure TUForm.Paint;
begin
  inherited;

  if CanDrawBorder then
    DoDrawBorder;
end;

procedure TUForm.Resize;
var
  Space: Integer;
  CurrentScreen: TMonitor;
begin
  inherited;

  if CanDrawBorder then begin
    Padding.Top := 1;
    if CheckMaxWin32Version(6, 3) then begin
      Padding.Left := 1;
      Padding.Right := 1;
      Padding.Bottom := 1;
    end;
  end
  else begin
    Padding.Top := 0;
    if CheckMaxWin32Version(6, 3) then begin
      Padding.Left := 0;
      Padding.Right := 0;
      Padding.Bottom := 0;
    end;
  end;

  //  Fit window to desktop - for WS_POPUP window style
  //  If not, if not, window fill full screen when maximized
  if FitDesktopForPopup and (WindowState = wsMaximized) and (BorderStyle in [bsDialog, bsSizeToolWin, bsToolWindow]) then begin
    CurrentScreen := Screen.MonitorFromWindow(Handle);
    Space := GetTopBorderSpace;

    Top := - Space;
    Left :=  - Space;
    Width := CurrentScreen.WorkareaRect.Width + 2 * Space;
    Height := CurrentScreen.WorkAreaRect.Height + 2 * Space;
  end;
end;

//  MESSAGES

procedure TUForm.WM_Activate(var Msg: TWMActivate);
begin
  inherited;
  FIsActive := Msg.Active <> WA_INACTIVE;

  //  Redraw border
  if CanDrawBorder then
    DoDrawBorder;
end;

procedure TUForm.WM_DPIChanged(var Msg: TWMDpi);
begin
  PPI := Msg.XDpi;
  inherited;
  ScaleForPPI(PPI);
end;

procedure TUForm.WM_DWMColorizationColorChanged(var Msg: TMessage);
begin
  if ThemeManager <> nil then
    ThemeManager.Reload;
  inherited;
end;

procedure TUForm.WM_NCCalcSize(var Msg: TWMNCCalcSize);
var
  CaptionBarHeight: Integer;
  BorderWidth: Integer;
  BorderHeight: Integer;
begin
  inherited;

  if BorderStyle = bsNone then exit;

  CaptionBarHeight := GetSystemMetrics(SM_CYCAPTION);

  if WindowState = wsNormal then
    Inc(CaptionBarHeight, GetTopBorderSpace);

  Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight); //  Hide caption bar
  if CheckMaxWin32Version(6, 3) then begin
    BorderWidth := GetBorderSpace;
    BorderHeight := GetBottomBorderSpace;
    //
    Dec(Msg.CalcSize_Params.rgrc[0].Left, BorderWidth); //  Hide borders
    Inc(Msg.CalcSize_Params.rgrc[0].Right, BorderWidth); //  Hide borders
    Inc(Msg.CalcSize_Params.rgrc[0].Bottom, BorderHeight); //  Hide borders
  end
end;

procedure TUForm.WM_NCHitTest(var Msg: TWMNCHitTest);
var 
  ResizeSpace: Integer;
begin
  inherited;
  ResizeSpace := GetBorderSpace;

  if (WindowState = wsNormal) and (BorderStyle in [bsSizeable, bsSizeToolWin]) and (Msg.YPos - BoundsRect.Top <= ResizeSpace) then begin
    if Msg.XPos - BoundsRect.Left <= 2 * ResizeSpace then
      Msg.Result := HTTOPLEFT
    else if BoundsRect.Right - Msg.XPos <= 2 * ResizeSpace then
      Msg.Result := HTTOPRIGHT
    else
      Msg.Result := HTTOP;
  end;
end;

{ TUFocusForm }

procedure TUFocusForm.Paint;
begin
  inherited;
  Canvas.Pen.Color := clblack;
  Canvas.pen.Width := 2;
  Canvas.Rectangle(1, 1, ClientWidth - 1, ClientHeight - 1);
end;

end.
