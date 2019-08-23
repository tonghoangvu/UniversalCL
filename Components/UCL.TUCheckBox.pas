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
    const
      ICON_CHECKED = '';
      ICON_UNCHECKED = '';
      ICON_GRAYED = '';

    private
      var ICON_LEFT: Integer;
      var TEXT_LEFT: Integer;
      var ActiveColor: TColor;
      var TextColor: TColor;

      FThemeManager: TUThemeManager;
      FIconFont: TFont;

      FAutoSize: Boolean;
      FHitTest: Boolean;
      FText: string;
      FAllowGrayed: Boolean;
      FState: TUCheckBoxState;
      FCustomActiveColor: TColor;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAutoSize(const Value: Boolean); reintroduce;
      procedure SetText(const Value: string);
      procedure SetAllowGrayed(const Value: Boolean);
      procedure SetState(const Value: TUCheckBoxState);

      //  Messages
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;

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
      property Text: string read FText write SetText;
      property AllowGrayed: Boolean read FAllowGrayed write SetAllowGrayed default false;
      property State: TUCheckBoxState read FState write SetState default cbsUnchecked;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;
  end;

  TUCheckBox = class(TUCustomCheckBox)
    published
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

{ TUCustomCheckBox }

//  THEME

procedure TUCustomCheckBox.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomCheckBox.UpdateTheme;
begin
  UpdateChange;
  Paint;
end;

procedure TUCustomCheckBox.UpdateChange;
begin
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

  //  Disabled
  if not Enabled then
    begin
      ActiveColor := $808080;
      TextColor := $808080;
    end;
end;

//  SETTERS

procedure TUCustomCheckBox.SetState(const Value: TUCheckBoxState);
begin
  if Value <> FState then
    if (not AllowGrayed) and (Value = cbsGrayed) then
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
      if (not FAllowGrayed) and (FState = cbsGrayed) then
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

//  MAIN CLASS

constructor TUCustomCheckBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  ICON_LEFT := 5;
  TEXT_LEFT := 35;

  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  FAutoSize := true;
  FHitTest := true;
  FText := 'CheckBox';
  FAllowGrayed := false;
  FState := cbsUnchecked;
  FCustomActiveColor := $D77800;  //  Default blue

  ParentColor := true;
  Font.Name := 'Segoe UI';
  Font.Size := 10;

  UpdateChange;
end;

destructor TUCustomCheckBox.Destroy;
begin
  FIconFont.Free;
  inherited Destroy;
end;

//  CUSTOM METHODS

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

  //  Paint check icon
  Canvas.Font := IconFont;
  case State of
    cbsChecked:
      begin
        Canvas.Font.Color := ActiveColor;
        IconH := Canvas.TextHeight(ICON_CHECKED);
        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, ICON_CHECKED);
      end;

    cbsUnchecked:
      begin
        Canvas.Font.Color := TextColor;
        IconH := Canvas.TextHeight(ICON_UNCHECKED);
        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, ICON_UNCHECKED);
      end;

    cbsGrayed:
      begin
        //  Paint outside box
        Canvas.Font.Color := ActiveColor;
        IconH := Canvas.TextHeight(ICON_UNCHECKED);
        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, ICON_UNCHECKED);

        //  Paint inside small square
        Canvas.Font.Color := TextColor;
        IconH := Canvas.TextHeight(ICON_GRAYED);
        Canvas.TextOut(ICON_LEFT, (Height - IconH) div 2, ICON_GRAYED);
      end;
  end;
end;

procedure TUCustomCheckBox.Resize;
begin
  if AutoSize then
    begin
      Canvas.Font := IconFont;
      Height := 2 * ICON_LEFT + Canvas.TextHeight(ICON_UNCHECKED);
      Canvas.Font := Font;
      Width := TEXT_LEFT + Canvas.TextWidth(Text) + ICON_LEFT;
    end
  else
    inherited;
end;

//  MESSAGES

procedure TUCustomCheckBox.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomCheckBox.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  inherited;
  if Enabled and HitTest then
    SetFocus;
end;

procedure TUCustomCheckBox.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  inherited;
  if Enabled and HitTest then
    //  Unchecked > Checked > Grayed > ...
    case State of
      cbsChecked:
        if AllowGrayed then
          State := cbsGrayed
        else
          State := cbsUnchecked;
      cbsUnchecked:
        State := cbsChecked;
      cbsGrayed:
        State := cbsUnchecked;
    end;
end;

procedure TUCustomCheckBox.CM_EnabledChanged(var Msg: TMessage);
begin
  UpdateTheme;
end;

end.
