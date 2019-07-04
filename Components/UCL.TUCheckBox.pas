unit UCL.TUCheckBox;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.Types, System.Math,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Graphics;

type
  TUCheckBoxState = (cbsChecked, cbsUnchecked, cbsGrayed);

  TUCustomCheckBox = class(TCustomControl, IUThemeControl)
    private var
      ICON_LEFT: Integer;
      TEXT_LEFT: Integer;

    private
      FThemeManager: TUThemeManager;

      FHitTest: Boolean;
      FText: string;
      FAllowGrayed: Boolean;
      FState: TUCheckBoxState;
      FCustomActiveColor: TColor;

      FIconFont: TFont;

      //  Object setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Value setters
      procedure SetText(const Value: string);
      procedure SetAllowGrayed(const Value: Boolean);
      procedure SetState(const Value: TUCheckBoxState);

      //  Messages
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

    protected
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

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
        FThemeManager.DisconnectControl(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.ConnectControl(Self);

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

  Height := 30;
  Width := 200;
  ParentColor := true;

  Font.Name := 'Segoe UI';
  Font.Size := 10;

  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  FHitTest := true;
  FText := 'UCheckBox';
  FAllowGrayed := false;
  FState := cbsUnchecked;
  FCustomActiveColor := $D77800;  //  Default blue

  //UpdateTheme;
  //  Dont UpdateTheme if it call Paint method
end;

{ CUSTOM METHODS }

procedure TUCustomCheckBox.ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean);
begin
  inherited;

  ICON_LEFT := MulDiv(ICON_LEFT, M, D);
  TEXT_LEFT := MulDiv(TEXT_LEFT, M, D);

  //Font.Height := MulDiv(Font.Height, M, D);   //  Not neccesary
  IconFont.Height := MulDiv(IconFont.Height, M, D);
end;

procedure TUCustomCheckBox.Paint;
var
  TextH: Integer;
  IconH: Integer;
begin
  Resize;

  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;  //  Paint empty background
  Canvas.FillRect(TRect.Create(0, 0, Width, Height));
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
          Canvas.Font.Color := ThemeManager.ActiveColor;
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
          Canvas.Font.Color := ThemeManager.ActiveColor;
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

{ MESSAGES }

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
