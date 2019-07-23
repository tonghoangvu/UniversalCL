unit UCL.TUContextMenu;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation, UCL.TUSymbolButton, UCL.TUForm,
  System.Classes, System.SysUtils,
  Winapi.Windows,
  VCL.Controls, VCL.Menus, VCL.ImgList, VCL.Forms, VCL.Graphics;

type
  TIndexNotifyEvent = procedure (Sender: TObject; Index: Integer) of object;

  TUContextMenuItem = class(TCollectionItem)
    private
      FText: string;
      FDetail: string;
      FSymbolChar: string;

      FShowDetail: Boolean;
      FShowIcon: Boolean;

      FTextOffset: Integer;

      FImageKind: TUImageKind;
      FImageIndex: Integer;
    public
      constructor Create(aOwner: TCollection); override;

    published
      property Text: string read FText write FText;
      property Detail: string read FDetail write FDetail;
      property SymbolChar: string read FSymbolChar write FSymbolChar;

      property ShowDetail: Boolean read FShowDetail write FShowDetail default true;
      property ShowIcon: Boolean read FShowIcon write FShowIcon default false;

      property TextOffset: Integer read FTextOffset write FTextOffset default 40;

      property ImageKind: TUImageKind read FImageKind write FImageKind default ikFontIcon;
      property ImageIndex: Integer read FImageIndex write FImageIndex default -1;
  end;

  TUContextMenuItems = class(TOwnedCollection)
    private
      function GetItem(Index: Integer): TUContextMenuItem;
      procedure SetItem(Index: Integer; const Value: TUContextMenuItem);

    public
      constructor Create(aOwner: TPersistent);
      property Items[Index: Integer]: TUContextMenuItem read GetItem write SetItem; default;
  end;

  TUContextMenu = class(TPopupMenu, IUThemeControl)
    private
      FItems: TUContextMenuItems;
      FThemeManager: TUThemeManager;

      FCustomBackColor: TColor;
      FCustomBorderColor: TColor;
      FBackColor: TColor;
      FBorderColor: TColor;

      FPopupWidth: Integer;
      FPopupHeight: Integer;
      FItemHeight: Integer;
      FItemWidth: Integer;

      FAutoSize: Boolean;
      FOrientation: TUOrientation;

      //  Events
      FOnItemClick: TIndexNotifyEvent;

      procedure SetThemeManager(const Value: TUThemeManager);

      //  Custom events
      procedure PopupForm_OnDeactive(Sender: TObject);
      procedure Item_OnClick(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

      procedure Popup(X, Y: Integer); override;
      procedure PopupAtPoint(P: TPoint);
      procedure PopupAtMouse;

    published
      property Items: TUContextMenuItems read FItems write FItems;
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property CustomBackColor: TColor read FCustomBackColor write FCustomBackColor default $E6E6E6;
      property CustomBorderColor: TColor read FCustomBorderColor write FCustomBorderColor default $C6C6C6;

      property PopupWidth: Integer read FPopupWidth write FPopupWidth default 180;
      property PopupHeight: Integer read FPopupHeight write FPopupHeight default 45;
      property ItemHeight: Integer read FItemHeight write FItemHeight default 32;
      property ItemWidth: Integer read FItemWidth write FItemWidth default 100;

      property AutoSize: Boolean read FAutoSize write FAutoSize default true;
      property Orientation: TUOrientation read FOrientation write FOrientation default oVertical;

      //  Events
      property OnItemClick: TIndexNotifyEvent read FOnItemClick write FOnItemClick;
  end;

implementation

{$REGION 'TUContextMenu'}

{ THEME }

procedure TUContextMenu.SetThemeManager(const Value: TUThemeManager);
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

procedure TUContextMenu.UpdateTheme;
begin
  if ThemeManager = nil then
    begin
      FBackColor := CustomBackColor;
      FBorderColor := CustomBorderColor;
    end
  else if ThemeManager.Theme = utLight then
    begin
      FBackColor := $E6E6E6;
      FBorderColor := $C6C6C6;
    end
  else
    begin
      FBackColor := $1F1F1F;
      FBorderColor := $141414;
    end;
end;

{ MAIN CLASS }

constructor TUContextMenu.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FItems := TUContextMenuItems.Create(Self);

  FCustomBackColor := $E6E6E6;
  FCustomBorderColor := $C6C6C6;
  FBackColor := $E6E6E6;
  FBorderColor := $C6C6C6;

  FPopupWidth := 180;
  FPopupHeight := 45;
  FItemHeight := 32;
  FItemWidth := 100;

  FAutoSize := true;
  FOrientation := oVertical;
end;

destructor TUContextMenu.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

procedure TUContextMenu.Popup(X, Y: Integer);
var
  aForm: TForm;
  Ani: TIntAni;
  StopValue, i: Integer;
begin
  DoPopup(Self);

  //  Create popup form
  Application.CreateForm(TForm, aForm);
  aForm.BorderStyle := bsNone;
  aForm.FormStyle := fsStayOnTop;
  aForm.Visible := true;
  aForm.Padding.SetBounds(1, 1, 1, 1);
  aForm.Color := FBackColor;
  aForm.Canvas.Pen.Color := FBorderColor;
  aForm.Left := X;
  aForm.Top := Y;

  //  Events
  aForm.OnDeactivate := PopupForm_OnDeactive;

  //  Popup animation
  if Orientation = oVertical then
    begin
      aForm.Width := PopupWidth;
      aForm.Height := 0;

      if AutoSize = false then
        StopValue := PopupHeight
      else
        StopValue := 2 + Items.Count * ItemHeight;

      Ani := TIntAni.Create(akOut, afkQuartic, 0, StopValue,
        procedure (Value: Integer) begin aForm.Height := Value end,
        true);
    end
  else
    begin
      aForm.Height := PopupHeight;
      aForm.Width := 0;

      if AutoSize = false then
        StopValue := PopupWidth
      else
        StopValue := 2 + Items.Count * ItemWidth;

      Ani := TIntAni.Create(akOut, afkQuartic, 0, StopValue,
        procedure (Value: Integer) begin aForm.Width := Value end,
        true);
    end;

  //  Paint border
  Ani.OnDone := procedure
    begin
      aForm.Canvas.Rectangle(0, 0, aForm.Width, aForm.Height);
    end;

  Ani.Step := 20;
  Ani.Duration := 200;

  //  Add TUSymbolButton as items
  var Item: TUSymbolButton;
  for i := 0 to Items.Count - 1 do
    begin
      Item := TUSymbolButton.Create(aForm);
      Item.Parent := aForm;

      Item.Height := ItemHeight;
      Item.Width := ItemWidth;
      if Orientation = oVertical then
        begin
          Item.Top := i * ItemHeight + 1;
          Item.Align := alTop;
        end
      else
        begin
          Item.Left := i * ItemWidth + 1;
          Item.Align := alLeft;
        end;

      Item.ThemeManager := ThemeManager;
      Item.Tag := i;
      Item.Text := Items[i].Text;
      Item.Detail := Items[i].Detail;
      Item.SymbolChar := Items[i].SymbolChar;
      Item.ShowDetail := Items[i].ShowDetail;
      Item.ShowIcon := Items[i].ShowIcon;
      Item.ImageKind := Items[i].ImageKind;
      Item.ImageIndex := Items[i].ImageIndex;
      Item.Images := Self.Images;
      Item.TextOffset := Items[i].TextOffset;

      Item.OnClick := Item_OnClick;

      Item.Visible := true;
    end;

  Ani.Start;
end;

procedure TUContextMenu.PopupAtPoint(P: TPoint);
begin
  Popup(P.X, P.Y);
end;

procedure TUContextMenu.PopupAtMouse;
begin
  Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

{ POPUP FORM CUSTOM EVENTS }

procedure TUContextMenu.PopupForm_OnDeactive(Sender: TObject);
var
  aForm: TForm;
  Ani: TIntAni;
begin
  if (Sender is TForm = false) or (Sender = nil) then exit;

  aForm := Sender as TForm;

  if Orientation = oVertical then
    Ani := TIntAni.Create(akOut, afkQuartic, aForm.Height, 0,
    procedure (Value: Integer)
    begin
      aForm.Height := Value;
    end, true)
  else
    Ani := TIntAni.Create(akOut, afkQuartic, aForm.Width, 0,
    procedure (Value: Integer)
    begin
      aForm.Width := Value;
    end, true);

  Ani.Step := 20;
  Ani.Duration := 120;
  Ani.OnDone := procedure begin aForm.Close end;
  Ani.Start;
end;

procedure TUContextMenu.Item_OnClick(Sender: TObject);
begin
  if (Sender is TUSymbolButton = false) or (Sender = nil) then exit;
  if Assigned(FOnItemClick) then
    FOnItemClick(Self, (Sender as TUSymbolButton).Tag);
end;

{$ENDREGION}

{$REGION 'TUContextMenuItem'}

{ MAIN CLASS }

constructor TUContextMenuItem.Create(aOwner: TCollection);
begin
  inherited Create(aOwner);

  FText := 'Text';
  FDetail := 'Detail';
  FSymbolChar := '';

  FShowDetail := true;
  FShowIcon := false;

  TextOffset := 40;

  FImageKind := ikFontIcon;
  FImageIndex := -1;
end;

{$ENDREGION}

{$REGION 'TUContextMenuItems'}

{ GETTERS & SETTERS }

function TUContextMenuItems.GetItem(Index: Integer): TUContextMenuItem;
begin
  Result := inherited GetItem(Index) as TUContextMenuItem;
end;

procedure TUContextMenuItems.SetItem(Index: Integer; const Value: TUContextMenuItem);
begin
  inherited SetItem(Index, Value);
end;

{ MAIN CLASS }

constructor TUContextMenuItems.Create(aOwner: TPersistent);
begin
  inherited Create(aOwner, TUContextMenuItem);
end;

{$ENDREGION}

end.
