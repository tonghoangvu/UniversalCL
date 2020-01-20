{$LEGACYIFEND ON}

unit UCL.TUTitleBar;

interface

uses
  Classes, Types, Windows, Messages, Controls, Graphics, Forms,
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics;

type
  TUCustomTitleBar = class(TGraphicControl, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;

      FTextPosition: Integer;
      FAlignment: TAlignment;
      FDragMovement: Boolean;
      FEnableSystemMenu: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Mesages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_RButtonUp(var Msg: TMessage); message WM_RBUTTONUP;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property TextPosition: Integer read FTextPosition write FTextPosition default 12;
      property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
      property DragMovement: Boolean read FDragMovement write FDragMovement default true;
      property EnableSystemMenu: Boolean read FEnableSystemMenu write FEnableSystemMenu default true;

      property Height default 32;
      property Width default 400;
  end;

  TUTitleBar = class(TUCustomTitleBar)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      property Caption;
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentBiDiMode;
      property ParentColor;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;
    {$IF CompilerVersion > 29}
      property StyleElements;
    {$IFEND}

      property OnCanResize;
      property OnClick;
      property OnConstrainedResize;
      property OnContextPopup;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      property OnGesture;
      property OnMouseActivate;
      property OnMouseDown;
      property OnMouseEnter;
      property OnMouseLeave;
      property OnMouseMove;
      property OnMouseUp;
      property OnResize;
      property OnStartDock;
      property OnStartDrag;
  end;

implementation

{ TUCustomTitleBar }

//  THEME

procedure TUCustomTitleBar.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomTitleBar.UpdateTheme;
var
  IsLightTheme: Boolean;
begin
  if ThemeManager = nil then
    IsLightTheme := true
  else
    IsLightTheme := ThemeManager.Theme = utLight;

  if IsLightTheme then
    Font.Color := $000000
  else
    Font.Color := $FFFFFF;
end;

procedure TUCustomTitleBar.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  MAIN CLASS

constructor TUCustomTitleBar.Create(aOwner: TComponent);
begin
  inherited;

  FTextPosition := 12;
  FAlignment := taLeftJustify;
  FDragMovement := true;
  FEnableSystemMenu := true;

  Height := 32;
  Width := 400;
end;

//  CUSTOM METHODS

procedure TUCustomTitleBar.Paint;
var
  TextRect: TRect;
begin
  inherited;

  //  Do not paint background
  Canvas.Brush.Style := bsClear;
  Canvas.Font := Font;

  //  Draw text
  TextRect := Rect(TextPosition, 0, Width, Height);
  DrawTextRect(Canvas, Alignment, taVerticalCenter, TextRect, Caption, true);
end;

procedure TUCustomTitleBar.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
var
  ParentForm: TCustomForm;
begin
  inherited;

  ParentForm := GetParentForm(Self, true);
  if ParentForm is TForm then
    if biMaximize in (ParentForm as TForm).BorderIcons then
      begin
        if ParentForm.WindowState = wsMaximized then
          ParentForm.WindowState := wsNormal
        else if ParentForm.WindowState = wsNormal then
          ParentForm.WindowState := wsMaximized;
      end;
end;

procedure TUCustomTitleBar.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  inherited;
  if DragMovement then
    begin
      ReleaseCapture;
      Parent.Perform(WM_SYSCOMMAND, $F012, 0);
    end;
end;

procedure TUCustomTitleBar.WM_RButtonUp(var Msg: TMessage);
const
  WM_SYSMENU = 787;
var
  P: TPoint;
begin
  inherited;
  if EnableSystemMenu then
    begin
      P.X := Msg.LParamLo;
      P.Y := Msg.LParamHi;
      P := ClientToScreen(P);
      Msg.LParamLo := P.X;
      Msg.LParamHi := P.Y;
      PostMessage(Parent.Handle, WM_SYSMENU, 0, Msg.LParam);
    end;
end;

procedure TUCustomTitleBar.WM_NCHitTest(var Msg: TWMNCHitTest);
var
  P: TPoint;
  ParentForm: TCustomForm;
begin
  inherited;

  ParentForm := GetParentForm(Self, true);
  if (ParentForm.WindowState = wsNormal) and (Align = alTop) then
    begin
      P := Point(Msg.Pos.x, Msg.Pos.y);
      P := ScreenToClient(P);
      if P.Y < 5 then
        Msg.Result := HTTRANSPARENT;  //  Send event to parent
    end;
end;

end.
