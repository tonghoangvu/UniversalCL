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
  TUSubEdit = class(TCustomEdit)
    private
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
  end;

  TUCustomEdit = class(TCustomPanel, IUThemeControl)
    const
      DefBorderColor: TDefColor = (
        ($999999, $666666, $D77800, $CCCCCC, $D77800),
        ($666666, $999999, $D77800, $CCCCCC, $D77800));

    private
      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;

      FEdit: TUSubEdit;
      FEnabled: Boolean;
      FHitTest: Boolean;
      FTransparent: Boolean;

      FText: string;
      FTextHint: string;
      FMaxLength: Integer;
      FNumbersOnly: Boolean;
      FPasswordChar: Char;

      //  Events
      FOnChange: TNotifyEvent;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetEnabled(const Value: Boolean); reintroduce;
      procedure SetTransparent(const Value: Boolean);

      procedure SetText(const Value: string);
      procedure SetTextHint(const Value: string);
      procedure SetMaxLength(const Value: Integer);
      procedure SetNumbersOnly(const Value: Boolean);
      procedure SetPasswordChar(const Value: Char);
      procedure SetOnChange(const Value: TNotifyEvent);

      //  Getters
      function GetText: string;
      function GetTextHint: string;
      function GetMaxLength: Integer;
      function GetNumbersOnly: Boolean;
      function GetPasswordChar: Char;
      function GetOnChange: TNotifyEvent;

      //  Messages
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
      procedure UM_SubEditSetFocus(var Msg: TMessage); message UM_SUBEDIT_SETFOCUS;
      procedure UM_SubEditKillFocus(var Msg: TMessage); message UM_SUBEDIT_KILLFOCUS;

    protected
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

      property Edit: TUSubEdit read FEdit write FEdit;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property Enabled: Boolean read FEnabled write SetEnabled default true;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property Transparent: Boolean read FTransparent write SetTransparent default true;

      property Text: string read GetText write SetText;
      property TextHint: string read GetTextHint write SetTextHint;
      property MaxLength: Integer read GetMaxLength write SetMaxLength;
      property NumbersOnly: Boolean read GetNumbersOnly write SetNumbersOnly;
      property PasswordChar: Char read GetPasswordChar write SetPasswordChar;

      property OnChange: TNotifyEvent read GetOnChange write SetOnChange;
  end;

  TUEdit = class(TUCustomEdit)
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

{ TUSUBEDIT }

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

{ THEME }

procedure TUCustomEdit.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomEdit.UpdateTheme;
begin
  Paint;
end;

{ SETTERS }

procedure TUCustomEdit.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomEdit.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      if Value = false then
        FButtonState := csDisabled
      else
        FButtonState := csNone;
      FEnabled := Value;
      FEdit.Enabled := Value;
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

procedure TUCustomEdit.SetText(const Value: string);
begin
  if FEdit <> nil then
    FEdit.Text := Value;
end;

procedure TUCustomEdit.SetTextHint(const Value: string);
begin
  if FEdit <> nil then
    FEdit.TextHint := Value;
end;

procedure TUCustomEdit.SetMaxLength(const Value: Integer);
begin
  if FEdit <> nil then
    FEdit.MaxLength := Value;
end;

procedure TUCustomEdit.SetNumbersOnly(const Value: Boolean);
begin
  if FEdit <> nil then
    FEdit.NumbersOnly := Value;
end;

procedure TUCustomEdit.SetPasswordChar(const Value: Char);
begin
  if FEdit <> nil then
    FEdit.PasswordChar := Value;
end;

procedure TUCustomEdit.SetOnChange(const Value: TNotifyEvent);
begin
  if FEdit <> nil then
    FEdit.OnChange := Value;
end;

{ GETTERS }

function TUCustomEdit.GetText: string;
begin
  if FEdit <> nil then
    Result := FEdit.Text
  else
    Result := '';
end;

function TUCustomEdit.GetTextHint: string;
begin
  if FEdit <> nil then
    Result := FEdit.TextHint
  else
    Result := '';
end;

function TUCustomEdit.GetMaxLength: Integer;
begin
  if FEdit <> nil then
    Result := FEdit.MaxLength
  else
    Result := 0;
end;

function TUCustomEdit.GetNumbersOnly: Boolean;
begin
  if FEdit <> nil then
    Result := FEdit.NumbersOnly
  else
    Result := false;
end;

function TUCustomEdit.GetPasswordChar: Char;
begin
  if FEdit <> nil then
    Result := FEdit.PasswordChar
  else
    Result := #0;
end;

function TUCustomEdit.GetOnChange: TNotifyEvent;
begin
  if FEdit <> nil then
    Result := FEdit.OnChange
  else
    Result := nil;
end;

{ MAIN CLASS }

constructor TUCustomEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FButtonState := csNone;
  FEnabled := true;
  FHitTest := true;
  FTransparent := true;

  Height := 30;
  FullRepaint := false;
  BevelOuter := bvNone;
  Caption := '';
  ShowCaption := false;

  FEdit := TUSubEdit.Create(Self);
  FEdit.Parent := Self;

  Self.Font.Name := 'Segoe UI';
  Self.Font.Size := 10;

  FEdit.Font := Self.Font;
  FEdit.BorderStyle := bsNone;
  FEdit.AutoSize := true;

  Padding.Left := 5;
  Padding.Right := 5;
  Padding.Bottom := (Height - FEdit.Height) div 2 - 1;
  Padding.Top := (Height - FEdit.Height) - Padding.Bottom;

  FEdit.Align := alClient;
  FEdit.OnChange := Self.OnChange;

  //UpdateTheme;
end;

{ CUSTOM METHODS }

procedure TUCustomEdit.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
end;

procedure TUCustomEdit.Paint;
var
  BorderColor, BackColor, TextColor: TColor;
begin
  inherited;

  if ThemeManager = nil then
    begin
      BorderColor := DefBorderColor[utLight, ButtonState];
      BackColor := $FFFFFF;
      TextColor := $000000;
    end
  else
    begin
      case ButtonState of
        csPress, csFocused:
          BorderColor := ThemeManager.ActiveColor;
        else
          BorderColor := DefBorderColor[ThemeManager.Theme, ButtonState];
      end;

      if (ThemeManager.Theme = utLight) or (ButtonState in [csPress, csFocused]) then
        begin
          BackColor := $FFFFFF;
          TextColor := $000000;
        end
      else
        begin
          BackColor := $000000;
          TextColor := $FFFFFF;
        end;
    end;

  //  Transparent background (on csNone)
  if (ButtonState = csNone) and (Transparent = true) then
    begin
      ParentColor := true;
      BackColor := Color;
    end;

  //  Disabled edit
  if ButtonState = csDisabled then
    begin
      BackColor := $CCCCCC;
      BorderColor := $CCCCCC;
      TextColor := clGray;
    end;

  //  Fit subedit
  Padding.Left := 5;
  Padding.Right := 5;
  Padding.Bottom := (Height - FEdit.Height) div 2;
  Padding.Top := (Height - FEdit.Height) - Padding.Bottom;

  //  Paint border
  Canvas.Pen.Color := BorderColor;
  Canvas.Pen.Width := 2;
  Canvas.Rectangle(1, 1, Width, Height);

  Color := BackColor;
  FEdit.Color := BackColor;
  FEdit.Font.Color := TextColor;
end;

{ MESSAGES }

procedure TUCustomEdit.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      FEdit.SetFocus;
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      if (Focused = true) or (FEdit.Focused = true) then
        ButtonState := csFocused
      else
        ButtonState := csNone;

      inherited;
    end;
end;

procedure TUCustomEdit.CM_MouseEnter(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      if (Focused = true) or (FEdit.Focused = true) then
        ButtonState := csFocused
      else
        ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomEdit.CM_MouseLeave(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      if (Focused = true) or (FEdit.Focused = true) then
        ButtonState := csFocused
      else
        ButtonState := csNone;

      inherited;
    end;
end;

procedure TUCustomEdit.WM_SetFocus(var Msg: TWMSetFocus);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csFocused;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_KillFocus(var Msg: TWMKillFocus);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUCustomEdit.UM_SubEditSetFocus(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    ButtonState := csFocused;
  //inherited;  //  Cancel this message
end;

procedure TUCustomEdit.UM_SubEditKillFocus(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    ButtonState := csNone;
  //inherited;  //  Cancel this message
end;

end.
