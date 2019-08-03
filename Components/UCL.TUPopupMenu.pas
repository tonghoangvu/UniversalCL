unit UCL.TUPopupMenu;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation, UCL.IntAnimation.Helpers,
  UCL.TUSymbolButton, UCL.TUForm,
  System.Classes, System.SysUtils,
  Winapi.Windows,
  VCL.Controls, VCL.Menus, VCL.ImgList, VCL.Forms, VCL.Graphics;

type
  TIndexNotifyEvent = procedure (Sender: TObject; Index: Integer) of object;

  TUPopupMenu = class(TPopupMenu, IUThemeComponent)
    private
      var PPI: Integer;
      var BackColor, BorderColor: TColor;

      FThemeManager: TUThemeManager;
      FItemsData: TStrings;
      FImages: TCustomImageList;

      FSeparatorChar: Char;
      FOrientation: TUOrientation;
      FItemWidth: Integer;
      FItemHeight: Integer;

      FOnItemClick: TIndexNotifyEvent;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetItemsData(const Value: TStrings);

      //  Custom events
      procedure PopupForm_OnDeactive(Sender: TObject);
      procedure PopupItem_OnClick(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

      procedure Popup(X, Y: Integer); override;
      procedure PopupAtPoint(P: TPoint); overload;
      procedure PopupAtMouse; overload;


      function PackItem(const ImageIndex: Integer; const Text, Detail: string): string;
      procedure UnpackItem(const Str: string; out ImageIndex: Integer; out Text, Detail: string);

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ItemsData: TStrings read FItemsData write SetItemsData;
      property Images: TCustomImageList read FImages write FImages;

      property SeparatorChar: Char read FSeparatorChar write FSeparatorChar;
      property Orientation: TUOrientation read FOrientation write FOrientation default oVertical;
      property ItemWidth: Integer read FItemWidth write FItemWidth default 180;
      property ItemHeight: Integer read FItemHeight write FItemHeight default 32;

      property OnItemClick: TIndexNotifyEvent read FOnItemClick write FOnItemClick;
  end;

implementation

{ TUPopupMenu }

//  UTILS

function TUPopupMenu.PackItem(const ImageIndex: Integer; const Text,
  Detail: string): string;
begin
  Result :=
    ImageIndex.ToString + SeparatorChar +
    Text + SeparatorChar +
    Detail;
end;

procedure TUPopupMenu.UnpackItem(const Str: string;
  out ImageIndex: Integer; out Text, Detail: string);
var
  FirstPos, SecondPos: Integer;
begin
  FirstPos := Pos(SeparatorChar, Str);
  SecondPos := Pos(SeparatorChar, Str, FirstPos + 1);

  ImageIndex := StrToIntDef(Copy(Str, 1, FirstPos - 1), -1);
  Text := Copy(Str, FirstPos + 1, SecondPos - FirstPos - 1);
  Detail := Copy(Str, SecondPos + 1, Length(Str) - SecondPos);
end;

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
    begin
      BackColor := $E6E6E6;
      BorderColor := $C6C6C6;
    end
  else if ThemeManager.Theme = utLight then
    begin
      BackColor := $E6E6E6;
      BorderColor := $C6C6C6;
    end
  else
    begin
      BackColor := $1F1F1F;
      BorderColor := $141414;
    end;
end;

//  SETTERS

procedure TUPopupMenu.SetItemsData(const Value: TStrings);
begin
  if FItemsData <> nil then
    FItemsData.Assign(Value)
  else
    FItemsData := Value;
end;

//  MAIN CLASS

constructor TUPopupMenu.Create(aOwner: TComponent);
begin
  inherited;

  PPI := 96;
  BackColor := $E6E6E6;
  BorderColor := $C6C6C6;

  FSeparatorChar := '|';
  FOrientation := oVertical;
  FItemWidth := 180;
  FItemHeight := 32;

  FItemsData := TStringList.Create;
end;

destructor TUPopupMenu.Destroy;
begin
  FItemsData.Free;
  inherited;
end;

//  CUSTOM METHODS

procedure TUPopupMenu.Popup(X, Y: Integer);
var
  Form: TForm;
  BorderThickness, ThicknessPos: Integer;
  Item: TUSymbolButton;

  Ani: TIntAni;
  AniLength: Integer;
  TempImageIndex: Integer;
  TempText, TempDetail: string;
  i: Integer;
begin
  inherited;
  DoPopup(Self);

  if Owner is TUForm then
    PPI := (Owner as TUForm).PPI
  else
    PPI := 96;

  //  Init variables
  BorderThickness := 1;

  Application.CreateForm(TForm, Form);
  Form.Scaled := false; //  Scale manually
  Form.Visible := true;
  Form.BorderStyle := bsNone;

  Form.Left := X;
  Form.Top := Y;
  Form.Color := BackColor;
  Form.Padding.SetBounds(BorderThickness, BorderThickness, BorderThickness, BorderThickness);

  Form.OnDeactivate := PopupForm_OnDeactive;

  //  Animation appearance
  if Orientation = oVertical then
    begin
      Form.Width := Round(ItemWidth * PPI / 96);
      Form.Height := 0;
      AniLength := ItemsData.Count * Round(ItemHeight * PPI / 96) + 2 * BorderThickness;
      Ani := TIntAni.Create(true, akOut, afkQuartic, 0, +AniLength,
        procedure (V: Integer) begin Form.Height := V end);
    end
  else
    begin
      Form.Height := Round(ItemHeight * PPI / 96);
      Form.Width := 0;
      AniLength := ItemsData.Count * Round(ItemWidth * PPI / 96) + 2 * BorderThickness;
      Ani := TIntAni.Create(true, akOut, afkQuartic, 0, +AniLength,
        procedure (V: Integer) begin Form.Width := V end);
    end;

  Ani.OnDone := procedure
    begin
      if BorderThickness mod 2 = 0 then
        ThicknessPos := BorderThickness div 2 - 1
      else
        ThicknessPos := BorderThickness div 2;

      Form.Canvas.Pen.Color := BorderColor;
      Form.Canvas.Pen.Width := BorderThickness;
      Form.Canvas.Rectangle(Rect(
        BorderThickness div 2,
        BorderThickness div 2,
        Form.Width - ThicknessPos,
        Form.Height - ThicknessPos));
    end;

  //  Add ItemsData
  for i := 0 to ItemsData.Count - 1 do
    begin
      Item := TUSymbolButton.Create(Form);
      Item.Parent := Form;
      Item.Tag := i;
      Item.Visible := true;
      Item.ShowIcon := true;

      Item.ThemeManager := ThemeManager;
      Item.Images := Images;
      Item.OnClick := PopupItem_OnClick;

      UnpackItem(ItemsData[i], TempImageIndex, TempText, TempDetail);
      Item.ImageIndex := TempImageIndex;
      Item.Text := TempText;
      Item.Detail := TempDetail;

      Item.SymbolChar := ItemsData[i][1];
      if Images = nil then
        Item.ImageKind := ikFontIcon
      else
        Item.ImageKind := ikImage;
      if TempDetail = '' then
        Item.ShowDetail := false;

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
    end;

  if PPI <> 96 then
    Form.ScaleForPPI(PPI);

  //  Begin animation
  Ani.Duration := 200;
  Ani.Step := 20;
  Ani.Start;
end;

procedure TUPopupMenu.PopupAtMouse;
begin
  Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TUPopupMenu.PopupAtPoint(P: TPoint);
begin
  Popup(P.X, P.Y);
end;

procedure TUPopupMenu.PopupForm_OnDeactive(Sender: TObject);
var
  Form: TForm;
begin
  if not ((Sender is TForm) and (Sender <> nil)) then exit;

  Form := Sender as TForm;

  if Orientation = oVertical then
    Form.AnimationFromCurrent(apHeight, -Form.Height, 20, 120, akOut, afkQuartic,
    procedure begin Form.Close end)
  else
    Form.AnimationFromCurrent(apWidth, -Form.Width, 20, 120, akOut, afkQuartic,
    procedure begin Form.Close end);
end;

procedure TUPopupMenu.PopupItem_OnClick(Sender: TObject);
begin
  if Sender is TUSymbolButton then
    if Assigned(FOnItemClick) then
      FOnItemClick(Self, (Sender as TUSymbolButton).Tag);
end;

end.
