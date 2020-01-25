unit UCL.TUForm;

interface

uses
  Classes, Windows, Messages, Dialogs, Forms, Controls, Graphics,
  UCL.Classes, UCL.TUThemeManager, UCL.Colors, UCL.Utils, UCL.SystemSettings,
  UCL.TUTooltip, UCL.TUFormOverlay;

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
      FBackColor: TUColorSet;
      FCaptionBar: TControl;
      FOverlay: TUFormOverlay;

      FPPI: Integer;
      FIsActive: Boolean;
      FOverlayType: TUOverlayType;
      FFitDesktopSize: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetOverlayType(const Value: TUOverlayType);

      //  Child events
      procedure BackColor_OnChange(Sender: TObject);

      //  Messages
      procedure WM_Activate(var Msg: TWMActivate); message WM_ACTIVATE;
      procedure WM_DPIChanged(var Msg: TWMDpi); message WM_DPICHANGED;
      procedure WM_DWMColorizationColorChanged(var Msg: TMessage); message WM_DWMCOLORIZATIONCOLORCHANGED;
      procedure WM_NCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

      //  Internal
      function IsWin7: Boolean;
      function IsResizeable: Boolean;
      function HasBorder: Boolean;
      function GetBorderSpace: Integer;
      function GetBorderSpaceWin7: Integer;
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
      constructor CreateNew(aOwner: TComponent; Dummy: Integer = 0); override;
      destructor Destroy; override;
      procedure UpdateTheme;
    {$IF CompilerVersion < 30}
      procedure ScaleForPPI(NewPPI: Integer); virtual;
    {$IFEND}

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property BackColor: TUColorSet read FBackColor write FBackColor;
      property CaptionBar: TControl read FCaptionBar write FCaptionBar;

      property PPI: Integer read FPPI write FPPI default 96;
      property IsActive: Boolean read FIsActive default true;
      property OverlayType: TUOverlayType read FOverlayType write SetOverlayType default otNone;
      property FitDesktopSize: Boolean read FFitDesktopSize write FFitDesktopSize default true;

      property Padding stored false;
  end;

implementation

uses
  SysUtils,
  UCL.Types;

{ TUForm }

//  INTERNAL

function TUForm.IsWin7;
begin
  Result := CheckMaxWin32Version(6, 3);
end;

function TUForm.HasBorder: Boolean;
begin
  Result := BorderStyle in [bsDialog, bsSingle, bsSizeable];
end;

function TUForm.IsResizeable: Boolean;
begin
  Result := BorderStyle in [bsSizeable, bsSizeToolWin];
end;

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

function TUForm.GetBorderSpaceWin7: Integer;
begin
  case BorderStyle of
    bsSingle:
      Result :=
        GetSystemMetrics(SM_CYFIXEDFRAME) - 3;

    bsDialog, bsToolWindow:
      Result :=
        GetSystemMetrics(SM_CYDLGFRAME) - 3;

    bsSizeable, bsSizeToolWin:
      Result :=
        GetSystemMetrics(SM_CYSIZEFRAME) +
        GetSystemMetrics(SM_CXPADDEDBORDER) - 2;

    else
      Result := 0;
  end;
end;

function TUForm.CanDrawBorder: Boolean;
begin
  Result :=
    (WindowState = wsNormal) and
    (HasBorder) and
    (not IsWin7);
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
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
  Canvas.Pen.Color := BorderColor;
  Canvas.MoveTo(0, 0);
  Canvas.LineTo(Width, 0);  //  Paint top border
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
var
  Back: TUColorSet;
begin
  if ThemeManager = nil then
    //  Do nothing
  else
    begin
      //  Select default or custom style
      if not BackColor.Enabled then
        Back := FORM_BACK
      else
        Back := BackColor;

      Color := Back.GetColor(ThemeManager);
    end;

  if ThemeManager = nil then
    HintWindowClass := THintWindow
  else if ThemeManager.Theme = utLight then
    HintWindowClass := TULightTooltip
  else
    HintWindowClass := TUDarkTooltip;

  UpdateBorderColor;
  Invalidate;
end;

procedure TUForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  SETTERS

procedure TUForm.SetOverlayType(const Value: TUOverlayType);
begin
  if Value <> FOverlayType then
    begin
      FOverlayType := Value;
      FOverlay.OverlayType := Value;
      if CanDrawBorder then
        FOverlay.Top := 1
      else
        FOverlay.Top := 0;
    end;
end;

//  MAIN CLASS

constructor TUForm.Create(aOwner: TComponent);
var
  CurrentScreen: TMonitor;
begin
  inherited;

  //  New props
  FIsActive := true;

  //  Get PPI from current screen
  CurrentScreen := Screen.MonitorFromWindow(Handle);
  FPPI := CurrentScreen.PixelsPerInch;
  {$IF CompilerVersion < 30}
    FIsScaling := False;
    FCurrentPPI := FPPI;
  {$IFEND}
  FOverlayType := otNone;
  FFitDesktopSize := true;

  //  Common props
  Font.Name := 'Segoe UI';
  Font.Size := 10;

  if IsWin7 and (BorderStyle = bsSizeable) then
    begin
      SetWindowLong(Handle, GWL_STYLE,
        GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION or WS_MINIMIZEBOX);
      SetWindowPos(handle, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_DRAWFRAME);
    end;

  FOverlay := TUFormOverlay.CreateNew(Self);
  FOverlay.AssignToForm(Self);

  FBackColor := TUColorSet.Create;
  FBackColor.OnChange := BackColor_OnChange;
  FBackColor.Assign(FORM_BACK);
end;

constructor TUForm.CreateNew(aOwner: TComponent; Dummy: Integer = 0);
begin
  inherited;

  Font.Name := 'Segoe UI';
  Font.Size := 10;
end;

destructor TUForm.Destroy;
begin
  FOverlay.Free;
  FBackColor.Free;
  inherited;
end;

//  CUSTOM METHODS

procedure TUForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.style := Params.style or 200000;
end;

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

  if CanDrawBorder then
    Padding.Top := 1
  else
    Padding.Top := 0;

  if FitDesktopSize and (WindowState = wsMaximized) and (BorderStyle in [bsDialog, bsSizeToolWin, bsToolWindow]) then
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

  //  Redraw border
  if CanDrawBorder then
    begin
      UpdateBorderColor;
      DoDrawBorder;
    end;

  //  Update cation bar
  if CaptionBar <> nil then
    CaptionBar.Repaint;
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
begin
  inherited;
  if BorderStyle = bsNone then exit;

  if IsWin7 and (BorderStyle = bsSizeable) then
    begin
      if WindowState = wsNormal then
        CaptionBarHeight := GetBorderSpaceWin7
      else
        CaptionBarHeight := 0;
    end
  else
    begin
      CaptionBarHeight := GetSystemMetrics(SM_CYCAPTION);
      if WindowState = wsNormal then
        inc(CaptionBarHeight, GetBorderSpace);
    end;

  dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight);
end;

procedure TUForm.WM_NCHitTest(var Msg: TWMNCHitTest);
var
  ResizeSpace: Integer;
  AllowResize: Boolean;
begin
  inherited;
  ResizeSpace := GetBorderSpace;

  AllowResize :=
    (WindowState = wsNormal) and
    (IsResizeable);

  if AllowResize and (Msg.YPos - BoundsRect.Top <= ResizeSpace) then  //  Resize top border
    begin
      if Msg.XPos - BoundsRect.Left <= 2 * ResizeSpace then
        Msg.Result := HTTOPLEFT
      else if BoundsRect.Right - Msg.XPos <= 2 * ResizeSpace then
        Msg.Result := HTTOPRIGHT
      else
        Msg.Result := HTTOP;
    end;
end;

//  CHILD EVENTS

procedure TUForm.BackColor_OnChange(Sender: TObject);
begin
  UpdateTheme;
end;

//  DPI

{$REGION 'Compatibility older Delphi'}
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
{$ENDREGION}

end.
