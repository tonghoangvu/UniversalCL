{$LEGACYIFEND ON}

unit UCL.TUEdit;

interface

uses
  Classes, Windows, Messages, Controls, StdCtrls, ExtCtrls, Graphics, Forms,
  UCL.Classes, UCL.TUThemeManager, UCL.Utils;

const
  UM_SUBEDIT_SETFOCUS = WM_USER + 1;
  UM_SUBEDIT_KILLFOCUS = WM_USER + 2;

type
  TUSubEdit = class(TCustomEdit)
    private
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;

    published
      property Align default alClient;
      property BorderStyle default bsNone;
      property AutoSize default true;
      property ParentColor default true;
      property ParentFont default true;
      property Height default 20;

      property Alignment;
      property CharCase;
      property Enabled;
      property Font stored false;
      property MaxLength;
      property NumbersOnly;
      property PasswordChar;
      property PopupMenu;
      property ReadOnly;
      property Text;
      property TextHint;
      property OnChange;
      property OnClick;
      property OnContextPopup;
      property OnDblClick;
      property OnEnter;
      property OnExit;
      property OnKeyDown;
      property OnKeyPress;
      property OnKeyUp;
  end;

  TUEdit = class(TPanel, IUThemeComponent)
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

      //  Internal
      procedure UpdateColors;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetControlState(const Value: TUControlState);
      procedure SetTransparent(const Value: Boolean);

      //  Messages
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
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;
      procedure CreateWindowHandle(const Params: TCreateParams); override;
      procedure ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND}); override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property Edit: TUSubEdit read FEdit write FEdit;
      property ControlState: TUControlState read FControlState write SetControlState default csNone;

      property HitTest: Boolean read FHitTest write FHitTest default true;
      property Transparent: Boolean read FTransparent write SetTransparent default false;

      property Padding stored false;
      property Alignment default taLeftJustify;
      property ShowCaption default false;
      property BevelOuter default bvNone;
      property Height default 29;
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

procedure TUEdit.SetThemeManager(const Value: TUThemeManager);
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

procedure TUEdit.UpdateTheme;
begin
  UpdateColors;
  Repaint;
end;

procedure TUEdit.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  INTERNAL

procedure TUEdit.UpdateColors;
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

procedure TUEdit.SetControlState(const Value: TUControlState);
begin
  if Value <> FControlState then
    begin
      FControlState := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUEdit.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  Internal
  BorderThickness := 2;

  //  Fields
  FControlState := csNone;
  FHitTest := true;
  FTransparent := false;

  //  Common properties
  Alignment := taLeftJustify;
  ShowCaption := false;
  Height := 29;
  BevelOuter := bvNone;
  Caption := '';
  Padding.SetBounds(5, 5, 4, 4);

  //  Sub edit
  FEdit := TUSubEdit.Create(Self);
  FEdit.Parent := Self;
  FEdit.ParentFont := true;
  FEdit.BorderStyle := bsNone;
  FEdit.AutoSize := true;
  FEdit.ParentColor := true;
  FEdit.Height := 20;
  FEdit.Align := alClient;
  FEdit.SetSubComponent(true);
end;

//  CUSTOM METHODS

procedure TUEdit.Paint;
var
  Space: Integer;
begin
  inherited;

  //  Paint border
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BorderColor, 255);
  Canvas.FillRect(Rect(0, 0, Width, Height));

  //  Paint background
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BackColor, 255);
  Canvas.FillRect(Rect(BorderThickness, BorderThickness, Width - BorderThickness, Height - BorderThickness));

  //  Fit subedit
  Space := (Height - FEdit.Height) div 2;
  Padding.Top := Space + 1;
  Padding.Left := Space + 1;
  Padding.Bottom := Space;
  Padding.Right := Space;

  //  Subedit color
  FEdit.Color := BackColor;
  FEdit.Font.Color := TextColor;
end;

procedure TUEdit.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited;
  UpdateColors;
end;

procedure TUEdit.ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND});
begin
  inherited;
  BorderThickness := MulDiv(BorderThickness, M, D);
end;

//  MESSAGES

procedure TUEdit.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled and HitTest then
    begin
      FEdit.SetFocus;
      ControlState := csPress;
      inherited;
    end;
end;

procedure TUEdit.WM_LButtonUp(var Msg: TWMLButtonUp);
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

procedure TUEdit.WM_SetFocus(var Msg: TWMSetFocus);
begin
  if Enabled and HitTest then
    begin
      ControlState := csFocused;
      inherited;
    end;
end;

procedure TUEdit.WM_KillFocus(var Msg: TWMKillFocus);
begin
  if Enabled and HitTest then
    begin
      ControlState := csNone;
      inherited;
    end;
end;

procedure TUEdit.UM_SubEditSetFocus(var Msg: TMessage);
begin
  if Enabled and HitTest then
    ControlState := csFocused;
end;

procedure TUEdit.UM_SubEditKillFocus(var Msg: TMessage);
begin
  if Enabled and HitTest then
    ControlState := csNone;
end;

procedure TUEdit.CM_MouseEnter(var Msg: TMessage);
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

procedure TUEdit.CM_MouseLeave(var Msg: TMessage);
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

procedure TUEdit.CM_EnabledChanged(var Msg: TMessage);
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
