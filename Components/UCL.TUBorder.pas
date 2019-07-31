unit UCL.TUBorder;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls;

type
  TUCustomBorder = class(TCustomPanel, IUThemeComponent)
    private
      var BorderColor: TColor;

      FThemeManager: TUThemeManager;
      FControlState: TUControlState;
      FCustomBorderColors: TControlStateColors;

      FBorderHitTest: Boolean;
      FBorderThickness: Integer;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetControlState(const Value: TUControlState);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    protected
      procedure ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ControlState: TUControlState read FControlState write SetControlState default csNone;
      property CustomBorderColors: TControlStateColors read FCustomBorderColors write FCustomBorderColors;

      property BorderHitTest: Boolean read FBorderHitTest write FBorderHitTest default true;
      property BorderThickness: Integer read FBorderThickness write FBorderThickness default 2;
  end;

  TUBorder = class(TUCustomBorder)
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

{ THEME }

procedure TUCustomBorder.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current ThemeManager
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.Connect(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomBorder.UpdateTheme;
var
  ThicknessPos: Integer;
begin
  //  Update BorderColor
  if BorderHitTest = true then
    if ThemeManager = nil then
      BorderColor := CustomBorderColors.GetStateColor(ControlState)
    else if ThemeManager.Theme = utLight then
      case ControlState of
        csNone: BorderColor := $FFFFFF;
        csHover: BorderColor := $E6E6E6;
        csPress: BorderColor := $CCCCCC;
      end
    else
      case ControlState of
        csNone: BorderColor := $000000;
        csHover: BorderColor := $191919;
        csPress: BorderColor := $333333;
      end;

  //  Paint border
  Canvas.Brush.Style := bsClear;
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
end;

{ SETTERS }

procedure TUCustomBorder.SetControlState(const Value: TUControlState);
begin
  if Value <> FControlState then
    begin
      FControlState := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUCustomBorder.Create(aOwner: TComponent);
begin
  inherited;

  //  Class var
  BorderColor := $FFFFFF;

  //  New props
  FCustomBorderColors := TControlStateColors.Create($FFFFFF, $E6E6E6, $CCCCCC, 0, 0);

  FControlState := csNone;
  FBorderHitTest := true;
  FBorderThickness := 2;

  //  Old props
  ShowCaption := false;
  ParentColor := true;
  Ctl3D := false;
  BevelOuter := bvNone;
  Padding.SetBounds(BorderThickness, BorderThickness, BorderThickness, BorderThickness);
end;

destructor TUCustomBorder.Destroy;
begin
  FCustomBorderColors.Free;

  inherited;
end;

{ CUSTOM METHODS }

procedure TUCustomBorder.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  BorderThickness := MulDiv(BorderThickness, M, D);
end;

{ MESSAGES }

procedure TUCustomBorder.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  ControlState := csPress;
  inherited;
end;

procedure TUCustomBorder.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  ControlState := csPress;
  inherited;
end;

procedure TUCustomBorder.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  ControlState := csHover;
  inherited;
end;

procedure TUCustomBorder.CM_MouseEnter(var Msg: TMessage);
begin
  ControlState := csHover;
  inherited;
end;

procedure TUCustomBorder.CM_MouseLeave(var Msg: TMessage);
begin
  ControlState := csNone;
  inherited;
end;

end.
