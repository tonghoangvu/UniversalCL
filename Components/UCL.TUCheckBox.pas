unit UCL.TUCheckBox;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.Types, System.Math,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Graphics;

type
  TUCheckBoxState = (cbsChecked, cbsUnchecked, cbsGrayed);

  TUCustomCheckBox = class(TCustomControl, IUThemeComponent)
    private var
      ICON_LEFT: Integer;
      TEXT_LEFT: Integer;

    private
      FThemeManager: TUThemeManager;

      FAutoSize: Boolean;
      FHitTest: Boolean;
      FText: string;
      FAllowGrayed: Boolean;
      FState: TUCheckBoxState;
      FCustomActiveColor: TColor;

      FIconFont: TFont;

      //  Object setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Value setters
      procedure SetAutoSize(const Value: Boolean); reintroduce;
      procedure SetText(const Value: string);
      procedure SetAllowGrayed(const Value: Boolean);
      procedure SetState(const Value: TUCheckBoxState);

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

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property AutoSize: Boolean read FAutoSize write SetAutoSize default true;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property Text: string read FText write SetText;
      property AllowGrayed: Boolean read FAllowGrayed write SetAllowGrayed default false;
      property State: TUCheckBoxState read FState write SetState default cbsUnchecked;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;

      property IconFont: TFont read FIconFont write FIconFont;
  end;

  TUCheckBox = class(TUCustomCheckBox)
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
      property ParentColor;
      property ParentFont;
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

{ THEME }

procedure TUCustomCheckBox.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomCheckBox.UpdateTheme;
begin
  Paint;
end;

{ VALUE SETTERS }

procedure TUCustomCheckBox.SetState(const Value: TUCheckBoxState);
begin
  if Value <> FState then
    if (AllowGrayed = false) and (Value = cbsGrayed) then
    else
      begin
        FState := Value;
        UpdateTheme;
      end;
end;

procedure TUCustomCheckBox.SetAllowGrayed(const Value: Boolean);
begin
  if Value <> FAllowGrayed then
    begin
      FAllowGrayed := Value;
      if (FAllowGrayed = false) and (FState = cbsGrayed) then
        FState := cbsUnchecked;
      UpdateTheme;
    end;
end;

procedure TUCustomCheckBox.SetAutoSize(const Value: Boolean);
begin
  if Value <> FAutoSize then
    begin
      FAutoSize := Value;
      Resize;
    end;
end;

procedure TUCustomCheckBox.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUCustomCheckBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  ICON_LEFT := 5;
  TEXT_LEFT := 35;

  ParentColor := true;

  Font.Name := 'Segoe UI';
  Font.Size := 10;

  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  FAutoSize := true;
  FHitTest := true;
  FText := 'UCheckBox';
  FAllowGrayed := false;
  FState := cbsUnchecked;
  FCustomActiveColor := $D77800;  //  Default blue
end;

destructor TUCustomCheckBox.Destroy;
begin
  FIconFont.Free;
  inherited Destroy;
end;

{ CUSTOM METHODS }

procedure TUCustomCheckBox.ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean);
begin
  inherited;

  ICON_LEFT := MulDiv(ICON_LEFT, M, D);
  TEXT_LEFT := MulDiv(TEXT_LEFT, M, D);
  IconFont.Height := MulDiv(IconFont.Height, M, D);

  Resize;
end;

procedure TUCustomCheckBox.Paint;
var
  TextH: Integer;
  IconH: Integer;
begin
  inherited;

  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;  //  Paint empty background
  Canvas.FillRect(Rect(0, 0, Width, Height));
  Canvas.Brush.Style := bsClear;

  //  Paint text
  Canvas.Font := Self.Font;
  if ThemeManager = nil then
    Canvas.Font.Color := $000000
  else if ThemeManager.Theme = utLight then
    Canvas.Font.Color := $000000
  else
    Canvas.Font.Color := $FFFFFF;

  TextH := Canvas.TextHeight(Text);
  Canvas.TextOut(TEXT_LEFT, (Height - TextH) div 2, Text);

  //  Paint check
  Canvas.Font := IconFont;
  case State of
    cbsChecked:
      begin
        //  Paint only check icon
        if ThemeManager = nil then
          Canvas.Font.Color := CustomActiveColor
        else
          Canvas.Font.Color := ThemeManager.AccentColor;
        IconH := Canvas.TextHeight('');

        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');
      end;

    cbsUnchecked:
      begin
        //  Paint a empty box
        if ThemeManager = nil then
          Canvas.Font.Color := $000000
        else if ThemeManager.Theme = utLight then
          Canvas.Font.Color := $000000
        else
          Canvas.Font.Color := $FFFFFF;
        IconH := Canvas.TextHeight('');

        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');
      end;

    cbsGrayed:
      begin
        //  Paint border
        if ThemeManager = nil then
          Canvas.Font.Color := CustomActiveColor
        else
          Canvas.Font.Color := ThemeManager.AccentColor;
        IconH := Canvas.TextHeight('');
        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');

        //  Paint small box
        IconH := Canvas.TextHeight('');
        if ThemeManager = nil then
          Canvas.Font.Color := $000000
        else if ThemeManager.Theme = utLight then
          Canvas.Font.Color := $000000
        else
          Canvas.Font.Color := $FFFFFF;
        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, '');
      end;
  end;

end;

procedure TUCustomCheckBox.Resize;
begin
  if AutoSize = true then
    begin
      Canvas.Font := IconFont;
      Height := 2 * ICON_LEFT + Canvas.TextHeight('');
      Canvas.Font := Font;
      Width := TEXT_LEFT + Canvas.TextWidth(Text) + ICON_LEFT;
    end
  else
    inherited;
end;

{ MESSAGES }

procedure TUCustomCheckBox.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomCheckBox.WM_LButtonDown(var Msg: TWMMouse);
begin
  SetFocus;
  inherited;
end;

procedure TUCustomCheckBox.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      //  Unchecked > Checked > Grayed > ...
      case State of
        cbsChecked:
          if AllowGrayed = true then
            State := cbsGrayed
          else
            State := cbsUnchecked;
        cbsUnchecked:
          State := cbsChecked;
        cbsGrayed:
          State := cbsUnchecked;
      end;

      inherited;
    end;
end;

end.
