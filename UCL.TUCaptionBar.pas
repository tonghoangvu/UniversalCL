unit UCL.TUCaptionBar;

interface

uses
  UCL.Classes, UCL.Utils, UCL.TUThemeManager,
  Winapi.Windows, Winapi.Messages,
  System.Classes,
  VCL.Controls, VCL.ExtCtrls, VCL.Forms, VCL.Graphics;

type
  TUCaptionBar = class(TCustomPanel, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FDragMovement: Boolean;
      FSystemMenuEnabled: Boolean;
      FDoubleClickMaximize: Boolean;
      FUseNormalStyle: Boolean;

      procedure SetThemeManager(const Value: TUThemeManager);

      procedure WM_LButtonDblClk(var Msg: TMessage); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TMessage); message WM_LBUTTONDOWN;
      procedure WM_RButtonUp(var Msg: TMessage); message WM_RBUTTONUP;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property DragMovement: Boolean read FDragMovement write FDragMovement default true;
      property SystemMenuEnabled: Boolean read FSystemMenuEnabled write FSystemMenuEnabled default true;
      property DoubleClickMaximize: Boolean read FDoubleClickMaximize write FDoubleClickMaximize default true;
      property UseNormalStyle: Boolean read FUseNormalStyle write FUseNormalStyle default false;

      {$REGION 'Common properties'}
      property Align;
      property Alignment;
      property Anchors;
      property BiDiMode;
      property Caption;
      //property Color;
      property DoubleBuffered;
      property Enabled;
      property Font;
      property Padding;
      property ParentBiDiMode;
      //property ParentBackground;
      //property ParentColor;
      //property ParentCtl3D;
      property ParentDoubleBuffered;
      property ParentFont;
      property ParentShowHint;
      property ShowCaption;
      property ShowHint;
      property Touch;
      property VerticalAlignment;
      property Visible;
      property OnClick;
      property OnDblClick;
      property OnGesture;
      property OnMouseDown;
      property OnMouseEnter;
      property OnMouseLeave;
      property OnMouseMove;
      property OnMouseUp;
      property OnResize;
      {$ENDREGION}
  end;

implementation

{ THEME }

procedure TUCaptionBar.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCaptionBar.UpdateTheme;
begin
  //  Not set ThemeManager
  if ThemeManager = nil then
    Color := $00FFFFFF

  //  Normal style (like VCL)
  else if UseNormalStyle = true then
    begin
      if ThemeManager.ColorOnBorder = true then
        Color := ThemeManager.ActiveColor //  Active color
      else
        Color := $00FFFFFF; //  White
    end

  //  New style (like UWP), depend AppTheme light or dark
  else
    begin
      if ThemeManager.Theme = utLight then
        Color := $00F2F2F2  //  Light color
      else
        Color := $002B2B2B; //  Dark color
    end;

  Font.Color := GetTextColorFromBackground(Color);
end;

{ MAIN CLASS }

constructor TUCaptionBar.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New properties
  FDragMovement := true;
  FSystemMenuEnabled := true;
  FDoubleClickMaximize := true;
  FUseNormalStyle := false;

  //  Common properties
  Align := alTop;
  AutoSize := false;
  BevelOuter := bvNone;
  BorderWidth := 0;
  BorderStyle := bsNone;
  Height := 32;
  Ctl3D := false;
  DoubleBuffered := false;
  Enabled := true;
  FullRepaint := false;
  StyleElements := [];
  TabStop := false;
  ParentFont := false;
  Font.Name := 'Segoe UI';
  Font.Size := 9;

  UpdateTheme;
end;

{ MESSAGES }

procedure TUCaptionBar.WM_LButtonDblClk(var Msg: TMessage);
begin
  inherited;
  if DoubleClickMaximize = true then
    if Parent is TForm then
      begin
        if (Parent as TForm).WindowState <> wsMaximized then
          (Parent as TForm).WindowState := wsMaximized
        else
          (Parent as TForm).WindowState := wsNormal;
      end;
end;

procedure TUCaptionBar.WM_LButtonDown(var Msg: TMessage);
begin
  inherited;
  if DragMovement = true then
    begin
      ReleaseCapture;
      Parent.Perform(WM_SYSCOMMAND, $F012, 0);
    end;
end;

procedure TUCaptionBar.WM_RButtonUp(var Msg: TMessage);
const
  WM_SYSMENU = 787;
var
  P: TPoint;
begin
  inherited;
  if SystemMenuEnabled then
    begin
      P.X := Msg.LParamLo;
      P.Y := Msg.LParamHi;
      P := ClientToScreen(P);
      Msg.LParamLo := P.X;
      Msg.LParamHi := P.Y;
      SendMessage(Parent.Handle, WM_SYSMENU, 0, Msg.LParam);
    end;
end;

end.
