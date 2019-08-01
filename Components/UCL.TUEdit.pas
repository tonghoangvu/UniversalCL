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

  TUCustomEdit = class(TCustomPanel, IUThemeComponent)
    const
      DefBorderColor: TDefColor = (
        ($999999, $666666, $D77800, $CCCCCC, $D77800),
        ($666666, $999999, $D77800, $CCCCCC, $D77800));

    private
      var BorderThickness: Integer;

      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;

      FEdit: TUSubEdit;
      FHitTest: Boolean;
      FTransparent: Boolean;

      FText: string;
      FTextHint: string;
      FMaxLength: Integer;
      FNumbersOnly: Boolean;
      FPasswordChar: Char;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
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
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
      procedure WM_SetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
      procedure WM_Size(var Msg: TWMSize); message WM_SIZE;

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

      property Edit: TUSubEdit read FEdit write FEdit;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
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
      property Anchors;
      property AutoSize;
      property BevelEdges;
      property BevelInner;
      property BevelKind;
      property BevelOuter;
      property BevelWidth;
      property BiDiMode;
      property BorderWidth;
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
      property Font;
      property Padding;
      property ParentBiDiMode;
      property ParentBackground;
      property ParentCtl3D;
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
  Paint;
end;

//  SETTERS

procedure TUCustomEdit.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
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

//  GETTERS

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

//  MAIN CLASS

constructor TUCustomEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  BorderThickness := 2;

  FButtonState := csNone;
  FHitTest := true;
  FTransparent := true;

  Height := 30;
  BevelOuter := bvNone;
  Caption := '';
  Font.Name := 'Segoe UI';
  Font.Size := 10;

  FEdit := TUSubEdit.Create(Self);
  FEdit.Parent := Self;

  FText := FEdit.Text;
  FTextHint := FEdit.TextHint;
  FMaxLength := FEdit.MaxLength;
  FNumbersOnly := FEdit.NumbersOnly;
  FPasswordChar := FEdit.PasswordChar;

  FEdit.Font := Self.Font;
  FEdit.BorderStyle := bsNone;
  FEdit.AutoSize := true;

  Padding.Left := 5;
  Padding.Right := 5;
  Padding.Bottom := (Height - FEdit.Height) div 2 - 1;
  Padding.Top := (Height - FEdit.Height) - Padding.Bottom;

  FEdit.Align := alClient;
  FEdit.SetSubComponent(true);
  FEdit.OnChange := Self.OnChange;
end;

//  CUSTOM METHODS

procedure TUCustomEdit.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  BorderThickness := MulDiv(BorderThickness, M, D);
end;

procedure TUCustomEdit.Paint;
var
  BorderColor, BackColor, TextColor: TColor;
  ThicknessPos: Integer;
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
          BorderColor := ThemeManager.AccentColor;
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
  if (ButtonState = csNone) and (Transparent) then
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

  Self.Color := BackColor;

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
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled and HitTest then
    begin
      if (Focused) or (FEdit.Focused) then
        ButtonState := csFocused
      else
        ButtonState := csNone;

      inherited;
    end;
end;

procedure TUCustomEdit.WM_SetFocus(var Msg: TWMSetFocus);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csFocused;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_KillFocus(var Msg: TWMKillFocus);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUCustomEdit.WM_Size(var Msg: TWMSize);
begin
  inherited;
  Canvas.Brush.Color := FEdit.Color;
  Canvas.FillRect(Rect(BorderThickness, BorderThickness, Width - BorderThickness, Height - BorderThickness));
end;

procedure TUCustomEdit.UM_SubEditSetFocus(var Msg: TMessage);
begin
  if Enabled and HitTest then
    ButtonState := csFocused;
end;

procedure TUCustomEdit.UM_SubEditKillFocus(var Msg: TMessage);
begin
  if Enabled and HitTest then
    ButtonState := csNone;
end;

procedure TUCustomEdit.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      if (Focused) or (FEdit.Focused) then
        ButtonState := csFocused
      else
        ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomEdit.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      if (Focused) or (FEdit.Focused) then
        ButtonState := csFocused
      else
        ButtonState := csNone;

      inherited;
    end;
end;

procedure TUCustomEdit.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if not Enabled then
    FButtonState := csDisabled
  else
    FButtonState := csNone;
  FEdit.Enabled := Enabled;
  UpdateTheme;
end;

end.
