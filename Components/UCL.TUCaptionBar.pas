unit UCL.TUCaptionBar;

interface

uses
  UCL.Classes, UCL.Utils, UCL.TUThemeManager,
  Winapi.Windows, Winapi.Messages,
  System.Classes,
  VCL.Controls, VCL.ExtCtrls, VCL.Forms, VCL.Graphics;

type
  TUCustomCaptionBar = class(TCustomPanel, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FDragMovement: Boolean;
      FSystemMenuEnabled: Boolean;
      FDoubleClickMaximize: Boolean;
      FUseNormalStyle: Boolean;

      procedure SetThemeManager(const Value: TUThemeManager);

      //  Setters
      procedure SetUseNormalStyle(const Value: Boolean);

      procedure WM_LButtonDblClk(var Msg: TMessage); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TMessage); message WM_LBUTTONDOWN;
      procedure WM_RButtonUp(var Msg: TMessage); message WM_RBUTTONUP;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      //  Field property
      property DragMovement: Boolean read FDragMovement write FDragMovement default true;
      property SystemMenuEnabled: Boolean read FSystemMenuEnabled write FSystemMenuEnabled default true;
      property DoubleClickMaximize: Boolean read FDoubleClickMaximize write FDoubleClickMaximize default true;

      //  Setter property
      property UseNormalStyle: Boolean read FUseNormalStyle write SetUseNormalStyle default false;
  end;

  TUCaptionBar = class(TUCustomCaptionBar)
    published
      //  Common properties
      property Align;
      property Alignment;
      property Anchors;
      property AutoSize;
      property BevelEdges;
      property BevelInner;
      property BevelKind;
      property BevelOuter;
      property BevelWidth;
      property BiDiMode;
      property BorderWidth;
      property BorderStyle;
      property Caption;
      property Constraints;
      property Ctl3D;
      property UseDockManager default True;
      property DockSite;
      property DoubleBuffered;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property FullRepaint;
      property Font;
      property Locked;
      property Padding;
      property ParentBiDiMode;
      property ParentBackground;
      property ParentCtl3D;
      property ParentDoubleBuffered;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowCaption;
      property ShowHint;
      property TabOrder;
      property TabStop;
      property Touch;
      property VerticalAlignment;
      property Visible;
      property StyleElements;

      //  Common events
      property OnAlignInsertBefore;
      property OnAlignPosition;
      property OnCanResize;
      property OnClick;
      property OnConstrainedResize;
      property OnContextPopup;
      property OnDockDrop;
      property OnDockOver;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      property OnEnter;
      property OnExit;
      property OnGesture;
      property OnGetSiteInfo;
      property OnMouseActivate;
      property OnMouseDown;
      property OnMouseEnter;
      property OnMouseLeave;
      property OnMouseMove;
      property OnMouseUp;
      property OnResize;
      property OnStartDock;
      property OnStartDrag;
      property OnUnDock;
  end;

implementation

{ THEME }

procedure TUCustomCaptionBar.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomCaptionBar.UpdateTheme;
begin
  //  Not set ThemeManager
  if ThemeManager = nil then
    Color := $FFFFFF

  //  Normal style (like VCL)
  else if UseNormalStyle = true then
    begin
      if ThemeManager.ColorOnBorder = true then
        Color := ThemeManager.ActiveColor //  Active color
      else
        Color := $FFFFFF;
    end

  //  New style (like UWP), depend AppTheme light or dark
  else
    begin
      if ThemeManager.Theme = utLight then
        Color := $F2F2F2  //  Light color
      else
        Color := $2B2B2B; //  Dark color
    end;

  Font.Color := GetTextColorFromBackground(Color);
end;

{ SETTERS }

procedure TUCustomCaptionBar.SetUseNormalStyle(const Value: Boolean);
begin
  if Value <> FUseNormalStyle then
    begin
      FUseNormalStyle := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUCustomCaptionBar.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New properties
  FDragMovement := true;
  FSystemMenuEnabled := true;
  FDoubleClickMaximize := true;
  FUseNormalStyle := false;

  //  Common properties
  Align := alTop;
  BevelOuter := bvNone;
  BorderStyle := bsNone;
  Height := 32;
  TabStop := false;
  ParentColor := false;
  ParentBackground := false;

  Font.Name := 'Segoe UI';
  Font.Size := 9;

  UpdateTheme;
end;

{ MESSAGES }

procedure TUCustomCaptionBar.WM_LButtonDblClk(var Msg: TMessage);
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

procedure TUCustomCaptionBar.WM_LButtonDown(var Msg: TMessage);
begin
  inherited;

  if DragMovement = true then
    begin
      ReleaseCapture;
      Parent.Perform(WM_SYSCOMMAND, $F012, 0);
    end;
end;

procedure TUCustomCaptionBar.WM_RButtonUp(var Msg: TMessage);
const
  WM_SYSMENU = 787;
var
  P: TPoint;
begin
  inherited;
  if SystemMenuEnabled = true then
    begin
      P.X := Msg.LParamLo;
      P.Y := Msg.LParamHi;
      P := ClientToScreen(P);
      Msg.LParamLo := P.X;
      Msg.LParamHi := P.Y;
      PostMessage(Parent.Handle, WM_SYSMENU, 0, Msg.LParam);
    end;
end;

end.
