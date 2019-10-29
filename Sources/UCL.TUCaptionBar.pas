unit UCL.TUCaptionBar;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  Winapi.Windows, Winapi.Messages,
  System.Classes,
  VCL.Controls, VCL.ExtCtrls, VCL.Forms, VCL.Graphics;

type
  TUCaptionBar = class(TPanel, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;

      FDragMovement: Boolean;
      FSystemMenuEnabled: Boolean;
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
      property CustomColor: TColor read FCustomColor write FCustomColor default $D77800;
  end;

implementation

{ TUCustomCaptionBar }

//  THEME

procedure TUCaptionBar.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCaptionBar.UpdateTheme;
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

constructor TUCaptionBar.Create(aOwner: TComponent);
begin
  inherited;
  FDragMovement := true;
  FSystemMenuEnabled := true;
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

procedure TUCaptionBar.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
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

procedure TUCaptionBar.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  inherited;
  if DragMovement then
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
      PostMessage(Parent.Handle, WM_SYSMENU, 0, Msg.LParam);
    end;
end;

procedure TUCaptionBar.WM_NCHitTest(var Msg: TWMNCHitTest);
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
