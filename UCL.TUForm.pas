unit UCL.TUForm;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes,
  Winapi.Windows, Winapi.Messages,
  VCL.Forms, VCL.Controls, VCL.ExtCtrls, VCL.Graphics;

type
  TUForm = class(TForm, IUThemeControl)
    const
      BorderColorDefault = $00707070;

    private
      FThemeManager: TUThemeManager;
      FBorderColor: TColor;

      FResizeable: Boolean;

      procedure SetThemeManager(const Value: TUThemeManager);

      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    protected
      procedure WndProc(var Msg: TMessage); override;
      procedure CreateParams(var Params: TCreateParams); override;

      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property Resizeable: Boolean read FResizeable write FResizeable;
  end;

implementation

{ THEME }

procedure TUForm.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current ThemeManager
      if FThemeManager <> nil then
        FThemeManager.DisconnectControl(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.ConnectControl(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUForm.UpdateTheme;
begin
  //  Change background color
  if ThemeManager = nil then
    Color := $00FFFFFF
  else if ThemeManager.Theme = utLight then
    Color := $00FFFFFF
  else
    Color := $00000000;

  //  Change border color
  if ThemeManager = nil then
    FBorderColor := BorderColorDefault
  else if ThemeManager.ColorOnBorder = true then
    FBorderColor := ThemeManager.ActiveColor
  else
    FBorderColor := BorderColorDefault;

  Invalidate;
end;

{ MAIN CLASS }

constructor TUForm.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FResizeable := true;

  Padding.SetBounds(1, 1, 1, 1);

  UpdateTheme;
end;

{ CUSTOM EVENTS }

procedure TUForm.Paint;
begin
  inherited;

  if Self.WindowState <> wsMaximized then
    begin
      Canvas.Pen.Color := FBorderColor;
      Canvas.Rectangle(0, 0, ClientWidth, ClientHeight);
    end;
end;

procedure TUForm.Resize;
begin
  inherited;
  if WindowState = wsMaximized then
    begin
      with Screen.WorkAreaRect do
        Self.SetBounds(Left, Top, Right - Left, Bottom - Top - 1);  //  Without -1, form will over screen size
      Self.Padding.SetBounds(0, 0, 0, 0);
    end
  else
    Self.Padding.SetBounds(1, 1, 1, 1);
  Invalidate; //  Neccesary
end;

{ MESSAGES }

procedure TUForm.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_NCCALCSIZE then
    begin
      Msg.Msg:= WM_NULL;
    end;
  inherited WndProc(Msg);
end;

procedure TUForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
  Params.Style := Params.Style or WS_OVERLAPPEDWINDOW;
end;

procedure TUForm.WM_NCHitTest(var Msg: TWMNCHitTest);
const
  EDGEDETECT = 12;
var
  deltaRect: TRect;
begin
  inherited;
  if Resizeable = true then
    if WindowState <> wsMaximized then
      with Msg, deltaRect do
        begin
          Left := XPos - BoundsRect.Left;
          Right := BoundsRect.Right - XPos;
          Top := YPos - BoundsRect.Top;
          Bottom := BoundsRect.Bottom - YPos;
          if (Top < EDGEDETECT) and (Left < EDGEDETECT) then
            Result := HTTOPLEFT
          else if (Top < EDGEDETECT) and (Right < EDGEDETECT) then
            Result := HTTOPRIGHT
          else if (Bottom < EDGEDETECT) and (Left < EDGEDETECT) then
            Result := HTBOTTOMLEFT
          else if (Bottom < EDGEDETECT) and (Right < EDGEDETECT) then
            Result := HTBOTTOMRIGHT
          else if (Top < EDGEDETECT) then
            Result := HTTOP
          else if (Left < EDGEDETECT) then
            Result := HTLEFT
          else if (Bottom < EDGEDETECT) then
            Result := HTBOTTOM
          else if (Right < EDGEDETECT) then
            Result := HTRIGHT
        end;
end;

end.
