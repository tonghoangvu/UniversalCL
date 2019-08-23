unit UCL.TUCaptionBar;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils,
  VCL.Controls, VCL.ExtCtrls, VCL.Forms, VCL.Graphics;

type
  TUCustomCaptionBar = class(TCustomPanel, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;

      FDragMovement: Boolean;
      FSystemMenuEnabled: Boolean;
      FDoubleClickMaximize: Boolean;
      FCustomColor: TColor;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_RButtonUp(var Msg: TMessage); message WM_RBUTTONUP;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property DragMovement: Boolean read FDragMovement write FDragMovement default true;
      property SystemMenuEnabled: Boolean read FSystemMenuEnabled write FSystemMenuEnabled default true;
      property DoubleClickMaximize: Boolean read FDoubleClickMaximize write FDoubleClickMaximize default true;
      property CustomColor: TColor read FCustomColor write FCustomColor default $D77800;
  end;

  TUCaptionBar = class(TUCustomCaptionBar)
    public
      property DockManager;
    published
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
      property Color;
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
      property ParentColor;
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

{ TUCustomCaptionBar }

//  THEME

procedure TUCustomCaptionBar.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomCaptionBar.UpdateTheme;
begin
  //  Background color
  if ThemeManager = nil then
    Color := CustomColor
  else if ThemeManager.Theme = utLight then
    Color := $F2F2F2
  else
    Color := $2B2B2B;

  //  Font color
  Font.Color := GetTextColorFromBackground(Color);
end;

// MAIN CLASS

constructor TUCustomCaptionBar.Create(aOwner: TComponent);
begin
  inherited;
  FDragMovement := true;
  FSystemMenuEnabled := true;
  FDoubleClickMaximize := true;
  FCustomColor := $D77800;

  Align := alTop;
  Alignment := taLeftJustify;
  Caption := '   TUCaptionBar';
  BevelOuter := bvNone;
  TabStop := false;
  Height := 32;
  Font.Name := 'Segoe UI';
  Font.Size := 9;

  UpdateTheme;
end;

// MESSAGES

procedure TUCustomCaptionBar.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
var
  ParentForm: TCustomForm;
begin
  inherited;
  if DoubleClickMaximize then
    begin
      ParentForm := GetParentForm(Self, true);
      if ParentForm.WindowState <> wsMaximized then
        ParentForm.WindowState := wsMaximized
      else
        ParentForm.WindowState := wsNormal;
    end;
end;

procedure TUCustomCaptionBar.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  inherited;
  if DragMovement then
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
  if SystemMenuEnabled then
    begin
      P.X := Msg.LParamLo;
      P.Y := Msg.LParamHi;
      P := ClientToScreen(P);
      Msg.LParamLo := P.X;
      Msg.LParamHi := P.Y;
      PostMessage(Parent.Handle, WM_SYSMENU, 0, Msg.LParam);
    end;
end;

procedure TUCustomCaptionBar.WM_NCHitTest(var Msg: TWMNCHitTest);
var
  P: TPoint;
  ParentForm: TCustomForm;
begin
  inherited;

  ParentForm := GetParentForm(Self, true);
  if (ParentForm.WindowState = wsNormal) and (Align = alTop) then
    begin
      P := Msg.Pos;
      P := ScreenToClient(P);
      if P.Y < 5 then
        Msg.Result := HTTRANSPARENT;  //  Send event to parent
    end;
end;

end.
