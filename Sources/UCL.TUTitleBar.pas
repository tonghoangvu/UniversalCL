unit UCL.TUTitleBar;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics,
  Winapi.Windows, Winapi.Messages,
  System.Classes,
  VCL.Controls, VCL.Graphics, VCL.Forms;

type
  TUCustomTitleBar = class(TGraphicControl)
    private
      FTextPosition: Integer;
      FAlignment: TAlignment;
      FDragMovement: Boolean;
      FEnableSystemMenu: Boolean;

      //  Mesages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_RButtonUp(var Msg: TMessage); message WM_RBUTTONUP;
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;

    published
      property TextPosition: Integer read FTextPosition write FTextPosition default 12;
      property  Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
      property DragMovement: Boolean read FDragMovement write FDragMovement default true;
      property EnableSystemMenu: Boolean read FEnableSystemMenu write FEnableSystemMenu default true;
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
      property StyleElements;

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

//  MAIN CLASS

constructor TUCustomTitleBar.Create(aOwner: TComponent);
begin
  inherited;

  FTextPosition := 12;
  FAlignment := taLeftJustify;
  FDragMovement := true;
  FEnableSystemMenu := true;

  Font.Name := 'Segoe UI';
  Font.Size := 9;
  Height := 32;
  Width := 400;
end;

//  CUSTOM METHODS

procedure TUCustomTitleBar.Paint;
var
  TextRect: TRect;
begin
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
      P := Msg.Pos;
      P := ScreenToClient(P);
      if P.Y < 5 then
        Msg.Result := HTTRANSPARENT;  //  Send event to parent
    end;
end;

end.
