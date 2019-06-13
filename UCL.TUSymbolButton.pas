unit UCL.TUSymbolButton;

interface

uses
  UCL.Classes, UCL.SystemSettings, UCL.TUThemeManager,
  Winapi.Messages,
  System.Classes, System.Types,
  VCL.Controls, VCL.Graphics;

type
  TUSymbolButton = class(TGraphicControl, IUThemeControl)
    const
      DefBackColor: TDefColor = (
        ($00E6E6E6, $00CFCFCF, $00B8B8B8, $00CCCCCC, $00CFCFCF),
        ($001F1F1F, $00353535, $004C4C4C, $00333333, $00353535));
      DefTextColor: TDefColor = (
        ($00000000, $00000000, $00000000, $00666666, $00000000),
        ($00FFFFFF, $00FFFFFF, $00FFFFFF, $00666666, $00FFFFFF));
      DefDetailColor: TDefColor = (
        ($00808080, $00808080, $00808080, $00808080, $00808080),
        ($00808080, $00808080, $00808080, $00808080, $00808080));

    private
      FThemeManager: TUThemeManager;

      FSymbolFont: TFont;
      FTextFont: TFont;
      FDetailFont: TFont;

      FButtonState: TUButtonState;
      FEnabled: Boolean;
      FOrientation: TUOrientation;
      FSymbolChar: string;
      FText: string;
      FTextOffset: Integer;
      FDetail: string;
      FDetailRightOffset: Integer;
      FShowDetail: Boolean;

      //  Object setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetSymbolFont(const Value: TFont);
      procedure SetTextFont(const Value: TFont);
      procedure SetDetailFont(const Value: TFont);

      //  Value setters
      procedure SetButtonState(const Value: TUButtonState);
      procedure SetEnabled(const Value: Boolean); reintroduce;
      procedure SetOrientation(const Value: TUOrientation);
      procedure SetSymbolChar(const Value: string);
      procedure SetText(const Value: string);
      procedure SetTextOffset(const Value: Integer);
      procedure SetDetail(const Value: string);
      procedure SetDetailRightOffset(const Value: Integer);
      procedure SetShowDetail(const Value: Boolean);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TMessage); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TMessage); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TMessage); message WM_LBUTTONUP;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; reintroduce;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property SymbolFont: TFont read FSymbolFont write SetSymbolFont;
      property TextFont: TFont read FTextFont write SetTextFont;
      property DetailFont: TFont read FDetailFont write SetDetailFont;

      property ButtonState: TUButtonState read FButtonState write SetButtonState default bsNone;
      property Enabled: Boolean read FEnabled write SetEnabled default true;
      property Orientation: TUOrientation read FOrientation write SetOrientation default oHorizontal;
      property SymbolChar: string read FSymbolChar write SetSymbolChar;
      property Text: string read FText write SetText;
      property TextOffset: Integer read FTextOffset write SetTextOffset default 40;
      property Detail: string read FDetail write SetDetail;
      property DetailRightOffset: Integer read FDetailRightOffset write SetDetailRightOffset default 10;
      property ShowDetail: Boolean read FShowDetail write SetShowDetail default true;

      {$REGION 'Common properties'}
      property Align;
      property Anchors;
      //property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      //property Font;
      //property ParentColor;
      //property ParentFont;
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
      {$ENDREGION}
  end;

implementation

{ THEME }

procedure TUSymbolButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUSymbolButton.UpdateTheme;
begin
  Paint;
end;

{ OBJECT SETTERS }

procedure TUSymbolButton.SetSymbolFont(const Value: TFont);
begin
  if Value <> FSymbolFont then
    begin
      FSymbolFont := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetTextFont(const Value: TFont);
begin
  if Value <> FTextFont then
    begin
      FTextFont := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetDetailFont(const Value: TFont);
begin
  if Value <> FDetailFont then
    begin
      FDetailFont := Value;
      UpdateTheme;
    end;
end;

{ VALUE SETTERS }

procedure TUSymbolButton.SetButtonState(const Value: TUButtonState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      FEnabled := Value;
      if Value = false then
        FButtonState := bsDisabled
      else
        FButtonState := bsNone;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetOrientation(const Value: TUOrientation);
begin
  if Value <> FOrientation then
    begin
      FOrientation := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetSymbolChar(const Value: string);
begin
  if Value <> FSymbolChar then
    begin
      FSymbolChar := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetTextOffset(const Value: Integer);
begin
  if Value <> FTextOffset then
    begin
      FTextOffset := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetDetail(const Value: string);
begin
  if Value <> FDetail then
    begin
      FDetail := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetDetailRightOffset(const Value: Integer);
begin
  if Value <> FDetailRightOffset then
    begin
      FDetailRightOffset := Value;
      UpdateTheme;
    end;
end;

procedure TUSymbolButton.SetShowDetail(const Value: Boolean);
begin
  if Value <> FShowDetail then
    begin
      FShowDetail := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUSymbolButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FSymbolFont := TFont.Create;
  FSymbolFont.Name := 'Segoe MDL2 Assets';
  FSymbolFont.Size := 12;

  FTextFont := TFont.Create;
  FTextFont.Name := 'Segoe UI';
  FTextFont.Size := 10;

  FDetailFont := TFont.Create;
  FDetailFont.Name := 'Segoe UI';
  FDetailFont.Size := 10;

  FButtonState := bsNone;
  FEnabled := true;
  FOrientation := oHorizontal;
  FSymbolChar := '';
  FText := 'Some text';
  FTextOffset := 40;
  FDetail := 'Detail';
  FDetailRightOffset := 10;
  FShowDetail := true;

  Width := 250;
  Height := 40;

  //UpdateTheme;
end;

destructor TUSymbolButton.Destroy;
begin
  FSymbolFont.Free;
  FTextFont.Free;
  FDetailFont.Free;
  inherited Destroy;
end;

{ CUSTOM METHODS }

procedure TUSymbolButton.Paint;
var
  aTheme: TUTheme;
  IconX, IconY, IconW, IconH: Integer;
  TextX, TextY, TextW, TextH: Integer;
  DetailX, DetailY, DetailW, DetailH: Integer;
begin
  inherited;

  if ThemeManager = nil then
    aTheme := utLight
  else
    aTheme := ThemeManager.Theme;

  //  Paint background
  Canvas.Brush.Color := DefBackColor[aTheme, ButtonState];
  Canvas.FillRect(TRect.Create(0, 0, Width, Height));

  //  Paint icon
  Canvas.Font := SymbolFont;
  Canvas.Font.Color := DefTextColor[aTheme, ButtonState];
  IconW := Canvas.TextWidth(SymbolChar);
  IconH := Canvas.TextHeight(SymbolChar);
  if Orientation = oHorizontal then
    begin
      IconX := (TextOffset - IconW) div 2;
      IconY := (Height - IconH) div 2;
    end
  else
    begin
      IconX := (Width - IconW) div 2;
      IconY := (TextOffset - IconH) div 2;
    end;
  Canvas.TextOut(IconX, IconY, SymbolChar);

  //  Paint text
  Canvas.Font := TextFont;
  Canvas.Font.Color := DefTextColor[aTheme, ButtonState];
  TextW := Canvas.TextWidth(Text);
  TextH := Canvas.TextHeight(Text);
  if Orientation = oHorizontal then
    begin
      TextX := TextOffset;
      TextY := (Height - TextH) div 2;
    end
  else
    begin
      TextX := (Width - TextW) div 2;
      TextY := TextOffset;
    end;
  Canvas.TextOut(TextX, TextY, Text);

  //  Paint detail
  if ShowDetail = false then
    exit;

  Canvas.Font := DetailFont;
  Canvas.Font.Color := DefDetailColor[aTheme, ButtonState];
  DetailW := Canvas.TextWidth(Detail);
  DetailH := Canvas.TextHeight(Detail);
  if Orientation = oHorizontal then
    begin
      DetailX := Width - DetailRightOffset - DetailW;
      DetailY := (Height - DetailH) div 2;
    end
  else
    begin
      DetailX := (Width - DetailW) div 2;
      DetailY := Height - DetailRightOffset - DetailH;
    end;
  Canvas.TextOut(DetailX, DetailY, Detail);
end;

{ MESSAGES }

procedure TUSymbolButton.WM_LButtonDblClk(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsPress;
      inherited;
    end;
end;

procedure TUSymbolButton.WM_LButtonDown(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsPress;
      inherited;
    end;
end;

procedure TUSymbolButton.WM_LButtonUp(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsHover;
      inherited;
    end;
end;

procedure TUSymbolButton.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsHover;
      inherited;
    end;
end;

procedure TUSymbolButton.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsNone;
      inherited;
    end;
end;

end.
