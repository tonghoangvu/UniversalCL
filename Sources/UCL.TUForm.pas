unit UCL.TUForm;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUTooltip, UCL.Utils, UCL.SystemSettings,
  System.Classes,
  Winapi.Windows, Winapi.Messages,
  VCL.Forms, VCL.Controls, VCL.Graphics;

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
      FDrawTopBorder: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_Activate(var Msg: TWMActivate); message WM_ACTIVATE;
      procedure WM_DPIChanged(var Msg: TWMDpi); message WM_DPICHANGED;
      procedure WM_DWMColorizationColorChanged(var Msg: TMessage); message WM_DWMCOLORIZATIONCOLORCHANGED;
      procedure WM_NCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

      //  Internal
      function GetBorderSpace: Integer;
      function IsBorderless: Boolean;
      function CanDrawTopBorder: Boolean;
      procedure UpdateBorderColor;
      procedure DoDrawTopBorder;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property PPI: Integer read FPPI write FPPI default 96;
      property IsActive: Boolean read FIsActive default true;
      property FitDesktopForPopup: Boolean read FFitDesktopForPopup write FFitDesktopForPopup default false;
      property DrawTopBorder: Boolean read FDrawTopBorder write FDrawTopBorder default true;

      property Padding stored false;
  end;

implementation

{ TUForm }

//  INTERNAL

function TUForm.GetBorderSpace: Integer;
begin
  case BorderStyle of
    bsSingle:
      Result :=
        GetSystemMetrics(SM_CYFIXEDFRAME);

    bsDialog, bsToolWindow:
      Result :=
        GetSystemMetrics(SM_CYDLGFRAME);

    bsSizeable, bsSizeToolWin:
      Result :=
        GetSystemMetrics(SM_CYSIZEFRAME) +
        GetSystemMetrics(SM_CXPADDEDBORDER);

    else
      Result := 0;
  end;
end;

function TUForm.IsBorderless: Boolean;
begin
  Result := BorderStyle in [bsNone, bsToolWindow, bsSizeToolWin];
end;

function TUForm.CanDrawTopBorder: Boolean;
begin
  Result :=
    (DrawTopBorder) and
    (WindowState = wsNormal) and
    (not IsBorderless);
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

procedure TUForm.DoDrawTopBorder;
begin
  UpdateBorderColor;
  Canvas.Pen.Color := BorderColor;
  Canvas.MoveTo(0, 0);
  Canvas.LineTo(ClientWidth, 0);
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
  FDrawTopBorder := true;

  //  Get PPI from current screen
  CurrentScreen := Screen.MonitorFromWindow(Handle);
  FPPI := CurrentScreen.PixelsPerInch;

  //  Common props
  Font.Name := 'Segoe UI';
  Font.Size := 10;
end;

//  CUSTOM METHODS

procedure TUForm.Paint;
begin
  inherited;

  if CanDrawTopBorder then
    DoDrawTopBorder;
end;

procedure TUForm.Resize;
var
  Space: Integer;
  CurrentScreen: TMonitor;
begin
  inherited;

  if CanDrawTopBorder then
    Padding.Top := 1
  else
    Padding.Top := 0;

  //  Fit window to desktop - for WS_POPUP window style
  //  If not, if not, window fill full screen when maximized
  if
    (FitDesktopForPopup) and
    (WindowState = wsMaximized) and
    (BorderStyle in [bsDialog, bsSizeToolWin, bsToolWindow])
  then
    begin
      CurrentScreen := Screen.MonitorFromWindow(Handle);
      Space := GetBorderSpace;

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

  //  Redraw top border
  if CanDrawTopBorder then
    DoDrawTopBorder;
end;

procedure TUForm.WM_DPIChanged(var Msg: TWMDpi);
begin
  PPI := Msg.XDpi;
  inherited;
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
begin
  inherited;

  if BorderStyle = bsNone then exit;

  CaptionBarHeight := GetSystemMetrics(SM_CYCAPTION);

  if WindowState = wsNormal then
    Inc(CaptionBarHeight, GetBorderSpace);

  Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight); //  Hide caption bar
end;

procedure TUForm.WM_NCHitTest(var Msg: TWMNCHitTest);
var 
  ResizeSpace: Integer;
begin
  inherited;
  ResizeSpace := GetBorderSpace;

  if
    (WindowState = wsNormal) and
    (BorderStyle in [bsSizeable, bsSizeToolWin]) and
    (Msg.YPos - BoundsRect.Top <= ResizeSpace)
  then
    begin
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
