unit UCL.TUEdit;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.StdCtrls, VCL.ExtCtrls, VCL.Graphics, VCL.Forms;

const
  UM_SUBEDIT_SETFOCUS = WM_USER + 1;
  UM_SUBEDIT_KILLFOCUS = WM_USER + 2;

type
  TUSubEdit = class(TEdit)
    private
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
  end;

  TUCustomEdit = class(TCustomPanel, IUThemeComponent)
    const
      DefBorderColor: TDefColor = (
        ($999999, $666666, $D77800, $CCCCCC, $D77800),
        ($666666, $999999, $D77800, $CCCCCC, $D77800));

    private
      var BorderThickness: Integer;
      var BorderColor: TColor;
      var BackColor: TColor;
      var TextColor: TColor;

      FThemeManager: TUThemeManager;
      FControlState: TUControlState;
      FEdit: TUSubEdit;

      FHitTest: Boolean;
      FTransparent: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetControlState(const Value: TUControlState);
      procedure SetTransparent(const Value: Boolean);

      //  Messages
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;

      procedure UM_SubEditSetFocus(var Msg: TMessage); message UM_SUBEDIT_SETFOCUS;
      procedure UM_SubEditKillFocus(var Msg: TMessage); message UM_SUBEDIT_KILLFOCUS;

    protected
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
      procedure UpdateChange;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property Edit: TUSubEdit read FEdit write FEdit;
      property ControlState: TUControlState read FControlState write SetControlState default csNone;

      property HitTest: Boolean read FHitTest write FHitTest default true;
      property Transparent: Boolean read FTransparent write SetTransparent default false;
  end;

  TUEdit = class(TUCustomEdit)
    published
      //  Common properties
      property Align;
      property Anchors;
      property BevelEdges;
      property BevelInner;
      property BevelKind;
      property BevelOuter;
      property BevelWidth;
      property BiDiMode;
      property BorderWidth;
      property Constraints;
      property UseDockManager default True;
      property DockSite;
      property DoubleBuffered;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Padding;
      property ParentBiDiMode;
      property ParentDoubleBuffered;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property TabOrder;
      property TabStop;
      property Touch;
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

{ TUSubEdit }

//  MESSAGES

procedure TUSubEdit.WM_SetFocus(var Msg: TWMSetFocus);
begin
  PostMessage(Parent.Handle, UM_SUBEDIT_SETFOCUS, 0, 0);
  inherited;
end;

procedure TUSubEdit.WM_KillFocus(var Msg: TWMKillFocus);
begin
  PostMessage(Parent.Handle, UM_SUBEDIT_KILLFOCUS, 0, 0);
  inherited;
end;

{ TUCustomEdit }

//  THEME

procedure TUCustomEdit.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomEdit.UpdateTheme;
begin
  UpdateChange;
  Paint;
end;

procedure TUCustomEdit.UpdateChange;
begin
  //  Border & background color
  if ThemeManager = nil then
    begin
      BorderColor := DefBorderColor[utLight, ControlState];
      BackColor := $FFFFFF;
    end
  else
    begin
      case ControlState of
        csPress, csFocused:
          BorderColor := ThemeManager.AccentColor;
        else
          BorderColor := DefBorderColor[ThemeManager.Theme, ControlState];
      end;

      if (ThemeManager.Theme = utLight) or (ControlState in [csPress, csFocused]) then
        BackColor := $FFFFFF
      else
        BackColor := $000000;
    end;

  //  Transparent edit
  if Transparent and (ControlState = csNone) then
    begin
      ParentColor := true;
      BackColor := Color;
    end;

  //  Text color
  TextColor := GetTextColorFromBackground(BackColor);

  //  Disabled edit
  if ControlState = csDisabled then
    begin
      BackColor := $CCCCCC;
      BorderColor := $CCCCCC;
      TextColor := clGray;
    end;
end;

//  SETTERS

procedure TUCustomEdit.SetControlState(const Value: TUControlState);
begin
  if Value <> FControlState then
    begin
      FControlState := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomEdit.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUCustomEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  BorderThickness := 2;

  FControlState := csNone;
  FHitTest := true;
  FTransparent := false;

  Alignment := taLeftJustify;
  ShowCaption := false;
  Height := 30;
  BevelOuter := bvNone;
  Caption := '';
  Font.Name := 'Segoe UI';
  Font.Size := 10;

  FEdit := TUSubEdit.Create(Self);
  FEdit.Parent := Self;
  FEdit.Name := 'SubEdit';
  FEdit.Text := '';

  FEdit.Font := Self.Font;
  FEdit.BorderStyle := bsNone;
  FEdit.AutoSize := true;
  FEdit.ParentColor := true;

  Padding.Left := 5;
  Padding.Right := 5;
  Padding.Bottom := (Height - FEdit.Height) div 2 - 1;
  Padding.Top := (Height - FEdit.Height) - Padding.Bottom;

  FEdit.Align := alClient;
  FEdit.SetSubComponent(true);

  UpdateChange;
end;

//  CUSTOM METHODS

procedure TUCustomEdit.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  BorderThickness := MulDiv(BorderThickness, M, D);
end;

procedure TUCustomEdit.Paint;
var
  ThicknessPos: Integer;
begin
  inherited;

  //  Paint border
  if BorderThickness mod 2 = 0 then
    ThicknessPos := BorderThickness div 2 - 1
  else
    ThicknessPos := BorderThickness div 2;

  Canvas.Pen.Color := BorderColor;
  Canvas.Pen.Width := BorderThickness;
  Canvas.Rectangle(Rect(
    BorderThickness div 2,
    BorderThickness div 2,
    Width - ThicknessPos,
    Height - ThicknessPos));

  //  Fit subedit
  Padding.Left := 5;
  Padding.Right := 5;
  Padding.Bottom := (Height - FEdit.Height) div 2 - 1;
  Padding.Top := (Height - FEdit.Height) - Padding.Bottom;

  Color := BackColor;
  Canvas.Brush.Color := BackColor;

  FEdit.Color := BackColor;
  FEdit.Font.Color := TextColor;
end;

//  MESSAGES

procedure TUCustomEdit.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomEdit.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled and HitTest then
    begin
      FEdit.SetFocus;
      ControlState := csPress;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled and HitTest then
    begin
      if (Focused) or (FEdit.Focused) then
        ControlState := csFocused
      else
        ControlState := csNone;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_SetFocus(var Msg: TWMSetFocus);
begin
  if Enabled and HitTest then
    begin
      ControlState := csFocused;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_KillFocus(var Msg: TWMKillFocus);
begin
  if Enabled and HitTest then
    begin
      ControlState := csNone;
      inherited;
    end;
end;

procedure TUCustomEdit.UM_SubEditSetFocus(var Msg: TMessage);
begin
  if Enabled and HitTest then
    ControlState := csFocused;
end;

procedure TUCustomEdit.UM_SubEditKillFocus(var Msg: TMessage);
begin
  if Enabled and HitTest then
    ControlState := csNone;
end;

procedure TUCustomEdit.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      if (Focused) or (FEdit.Focused) then
        ControlState := csFocused
      else
        ControlState := csHover;
      inherited;
    end;
end;

procedure TUCustomEdit.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      if (Focused) or (FEdit.Focused) then
        ControlState := csFocused
      else
        ControlState := csNone;

      inherited;
    end;
end;

procedure TUCustomEdit.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if not Enabled then
    FControlState := csDisabled
  else
    FControlState := csNone;
  FEdit.Enabled := Enabled;
  UpdateTheme;
end;

end.
