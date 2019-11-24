unit UCL.TUPopupMenu;

interface

uses
  UCL.IntAnimation, UCL.IntAnimation.Helpers,
  UCL.Classes, UCL.Utils, UCL.Graphics, UCL.TUThemeManager, UCL.TUForm, UCL.TUSymbolButton,
  System.Classes, System.Types,
  Winapi.Windows,
  VCL.Forms, VCL.Controls, VCL.Menus, VCL.Graphics, VCL.Dialogs;

type
  TIndexNotifyEvent = procedure (Sender: TObject; Index: Integer) of object;

  TUPopupMenu = class(TPopupMenu, IUThemeComponent)
    private
      var BackColor: TColor;

      FThemeManager: TUThemeManager;
      FOnItemClick: TIndexNotifyEvent;

      FItemWidth: Integer;
      FItemHeight: Integer;
      FTopSpace: Integer;
      FImageKind: TUImageKind;
      FCloseAnimation: Boolean;

      procedure SetThemeManager(const Value: TUThemeManager);

      procedure PopupForm_OnDeactivate(Sender: TObject);
      procedure PopupItem_OnClick(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

      procedure Popup(X, Y: Integer); override;
      procedure PopupAtPoint(P: TPoint); overload;
      procedure PopupAtMouse; overload;

      procedure ExtractPackedContent(Input: string; out Icon, Text, Detail: string);

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property OnItemClick: TIndexNotifyEvent read FOnItemClick write FOnItemClick;

      property ItemWidth: Integer read FItemWidth write FItemWidth default 200;
      property ItemHeight: Integer read FItemHeight write FItemHeight default 32;
      property TopSpace: Integer read FTopSpace write FTopSpace default 5;
      property ImageKind: TUImageKind read FImageKind write FImageKind default ikFontIcon;
      property CloseAnimation: Boolean read FCloseAnimation write FCloseAnimation default false;
  end;

implementation

{ Other }

procedure TUPopupMenu.PopupForm_OnDeactivate(Sender: TObject);
var
  Form: TUForm;
  Ani: TIntAni;
begin
  if not ((Sender is TForm) and (Sender <> nil)) then exit;

  Form := (Sender as TUForm);

  if not CloseAnimation then
    begin
      Form.Free;
      exit;
    end;

  Ani := TIntAni.Create(true, akIn, afkQuartic, Form.ClientHeight, -Form.ClientHeight,
    procedure (Value: Integer)
    begin
      Form.Height := Value;
    end);

  Ani.OnDone :=
    procedure
    begin
      Form.Close;
    end;

  Ani.Step := 20;
  Ani.Duration := 120;
  Ani.Start;
end;

procedure TUPopupMenu.PopupItem_OnClick(Sender: TObject);
begin
  if Sender is TUSymbolButton then
    if Assigned(FOnItemClick) then
      FOnItemClick(Self, (Sender as TUSymbolButton).Tag);
end;

{ TUPopupMenu }

//  THEME

procedure TUPopupMenu.SetThemeManager(const Value: TUThemeManager);
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

procedure TUPopupMenu.UpdateTheme;
begin
  if ThemeManager = nil then
    BackColor := $E6E6E6
  else if ThemeManager.Theme = utLight then
    BackColor := $E6E6E6
  else
    BackColor := $1F1F1F;
end;

//  MAIN CLASS

constructor TUPopupMenu.Create(aOwner: TComponent);
begin
  inherited;

  BackColor := $E6E6E6;

  FItemWidth := 200;
  FItemHeight := 32;
  FTopSpace := 5;
  FImageKind := ikFontIcon;
  FCloseAnimation := false;
end;

//  UTILS

procedure TUPopupMenu.ExtractPackedContent(Input: string; out Icon, Text, Detail: string);
var
  SeparatorPos: Integer;
begin
  if Length(Input) = 0 then
    begin
      Icon := '';
      Text := '';
      Detail := '';
    end
  else
    begin
      Icon := Input[1];
      Input := Copy(Input, 2, Length(Input) - 1);
      SeparatorPos := Pos('|', Input);
      if SeparatorPos = 0 then
        begin
          Text := Input;
          Detail := '';
        end
      else
        begin
          Text := Copy(Input, 1, SeparatorPos - 1);
          Detail := Copy(Input, SeparatorPos + 1, Length(Input) - SeparatorPos);
        end;
    end;
end;

procedure TUPopupMenu.Popup(X, Y: Integer);
var
  Form: TUForm;
  i, ItemCount: Integer;
  MenuItem: TMenuItem;
  UItem: TUSymbolButton;
  Icon, Text, Detail: string;
  Ani: TIntAni;
begin
  //  Getting something
  ItemCount := Self.Items.Count;

  if ItemCount = 0 then exit;

  //  Create popup form
  Form := TUForm.CreateNew(Self);

  Form.OnDeactivate := PopupForm_OnDeactivate;

  Form.DoubleBuffered := true;
  Form.BorderStyle := bsToolWindow;
  Form.Position := poDefaultPosOnly;
  Form.Color := BackColor;
  Form.ClientWidth := ItemWidth;
  Form.ClientHeight := 0;

    //  Build items
  for i := ItemCount - 1 downto 0 do
    begin
      MenuItem := Self.Items[i];

      UItem := TUSymbolButton.Create(Form);
      UItem.Tag := i;
      UItem.Parent := Form;
      UItem.Enabled := MenuItem.Enabled;
      UItem.ThemeManager := Self.ThemeManager;
      UItem.OnClick := PopupItem_OnClick;

      if i = 0 then
        begin
          UItem.Margins.SetBounds(0, TopSpace, 0, 0);
          UItem.AlignWithMargins := true;
        end;

      UItem.Hint := MenuItem.Hint;
      UItem.Images := Self.Images;
      UItem.ImageIndex := MenuItem.ImageIndex;

      ExtractPackedContent(MenuItem.Caption, Icon, Text, Detail);
      UItem.SymbolChar := Icon;
      UItem.Text := Text;
      UItem.Detail := Detail;
      UItem.ImageKind := Self.ImageKind;

      UItem.Align := alTop;
      UItem.Width := ItemWidth;
      UItem.Height := ItemHeight;
      UItem.ShowHint := true;
    end;

  Form.Show;

  //  Position & size
  Form.Left := X;
  Form.Top := Y;

  //  Animation
  Ani := TIntAni.Create(true, akOut, afkQuartic, 0, 2 * TopSpace + ItemCount * ItemHeight,
    procedure (Value: Integer)
    begin
      Form.ClientHeight := Value;
    end);
  Ani.Duration := 120;
  Ani.Step := 20;
  Ani.Start;
end;

procedure TUPopupMenu.PopupAtPoint(P: TPoint);
begin
  Popup(P.X, P.Y);
end;

procedure TUPopupMenu.PopupAtMouse;
begin
  Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

end.
