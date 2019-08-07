unit UCL.TURadioButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Graphics;

type
  TUCustomRadioButton = class(TCustomControl, IUThemeComponent)
    private
      var ICON_LEFT: Integer;
      var TEXT_LEFT: Integer;
      var ActiveColor: TColor;
      var TextColor: TColor;

      FThemeManager: TUThemeManager;
      FIconFont: TFont;

      FAutoSize: Boolean;
      FHitTest: Boolean;
      FIsChecked: Boolean;
      FGroup: string;
      FCustomActiveColor: TColor;
      FText: string;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAutoSize(const Value: Boolean); reintroduce;
      procedure SetText(const Value: string);
      procedure SetIsChecked(const Value: Boolean);

      //  Messages
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

    protected
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
      procedure Paint; override;
      procedure Resize; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;
      procedure UpdateChange;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property IconFont: TFont read FIconFont write FIconFont;

      property AutoSize: Boolean read FAutoSize write SetAutoSize default true;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property IsChecked: Boolean read FIsChecked write SetIsChecked default false;
      property Group: string read FGroup write FGroup;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;
      property Text: string read FText write SetText;
  end;

  TURadioButton = class(TUCustomRadioButton)
    published
      //  Common properties
      property Align;
      property Anchors;
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentFont;
      property ParentColor;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;

      //  Common events
      property OnClick;
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
      property OnStartDock;
      property OnStartDrag;
  end;

implementation

{ TUCustomRadioButton }

//  THEME

procedure TUCustomRadioButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomRadioButton.UpdateTheme;
begin
  UpdateChange;
  Paint;
end;

procedure TUCustomRadioButton.UpdateChange;
begin
  //  Active & text color
  if ThemeManager = nil then
    begin
      ActiveColor := CustomActiveColor;
      TextColor := $000000;
    end
  else if ThemeManager.Theme = utLight then
    begin
      ActiveColor := ThemeManager.AccentColor;
      TextColor := $000000;
    end
  else
    begin
      ActiveColor := ThemeManager.AccentColor;
      TextColor := $FFFFFF;
    end;
end;

//  SETTERS

procedure TUCustomRadioButton.SetAutoSize(const Value: Boolean);
begin
  if Value <> FAutoSize then
    begin
      FAutoSize := Value;
      Resize;
    end;
end;

procedure TUCustomRadioButton.SetIsChecked(const Value: Boolean);
begin
  if Value <> FIsChecked then
    begin
      FIsChecked := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomRadioButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUCustomRadioButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  Constants
  ICON_LEFT := 5;
  TEXT_LEFT := 35;

  //  New props
  FAutoSize := true;
  FHitTest := true;
  FIsChecked := false;
  FCustomActiveColor := $D77800;
  FText := 'URadioButton';

  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  ParentColor := true;
  Font.Name := 'Segoe UI';
  Font.Size := 10;

  UpdateChange;
end;

destructor TUCustomRadioButton.Destroy;
begin
  FIconFont.Free;
  inherited Destroy;
end;

//  CUSTOM METHODS

procedure TUCustomRadioButton.ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean);
begin
  inherited;

  ICON_LEFT := MulDiv(ICON_LEFT, M, D);
  TEXT_LEFT := MulDiv(TEXT_LEFT, M, D);
  IconFont.Height := MulDiv(IconFont.Height, M, D);

  Resize;
end;

procedure TUCustomRadioButton.Resize;
begin
  if AutoSize then
    begin
      Canvas.Font := IconFont;
      Height := 2 * ICON_LEFT + Canvas.TextHeight('');
      Canvas.Font := Font;
      Width := TEXT_LEFT + Canvas.TextWidth(Text) + ICON_LEFT;
    end
  else
    inherited;
end;

procedure TUCustomRadioButton.Paint;
var
  TextH: Integer;
  IconH: Integer;
begin
  inherited;

  //  Paint background
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  Canvas.Brush.Style := bsClear;

  //  Paint text
  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;

  TextH := Canvas.TextHeight(Text);
  Canvas.TextOut(TEXT_LEFT, (Height - TextH) div 2, Text);

  //  Paint radio
  Canvas.Font := IconFont;
  if not IsChecked then
    begin
      //  Paint circle border
      Canvas.Font.Color := TextColor;
      IconH := Canvas.TextHeight('');
      Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');
    end
  else
    begin
      //  Paint circle border (colored)
      Canvas.Font.Color := ActiveColor;
      IconH := Canvas.TextHeight('');
      Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');

      //  Paint small circle inside
      Canvas.Font.Color := TextColor;
      IconH := Canvas.TextHeight('');
      Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');
    end;
end;

//  MESSAGES

procedure TUCustomRadioButton.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomRadioButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  SetFocus;
  inherited;
end;

procedure TUCustomRadioButton.WM_LButtonUp(var Msg: TWMLButtonUp);
var 
  i: Integer;
begin
  //  Only unchecked can change
  if Enabled and HitTest then
    begin
      if not IsChecked then
        begin
          IsChecked := true;  //  Check it

          //  Uncheck other TUCustomRadioButton with the same parent and group name
          for i := 0 to Parent.ControlCount - 1 do
            if Parent.Controls[i] is TUCustomRadioButton then
              if
                ((Parent.Controls[i] as TUCustomRadioButton).Group = Group)
                and (Parent.Controls[i] <> Self)
              then
                (Parent.Controls[i] as TUCustomRadioButton).IsChecked := false;
        end;

      inherited;
    end;
end;

end.
