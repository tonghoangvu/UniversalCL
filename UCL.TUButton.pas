unit UCL.TUButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  Winapi.Messages,
  System.Classes, System.Types,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls;

type
  TUButton = class(TCustomPanel, IUThemeControl)
    const
      DefBackColor: TDefColor = (
        ($00CCCCCC, $00CCCCCC, $00999999, $00CCCCCC, $00CCCCCC),
        ($00333333, $00333333, $00666666, $00333333, $00333333));
      DefBorderColor: TDefColor = (
        ($00CCCCCC, $007A7A7A, $00999999, $00CCCCCC, $007A7A7A),
        ($00333333, $00858585, $00666666, $00333333, $00858585));
      DefTextColor: TDefColor = (
        ($00000000, $00000000, $00000000, $00666666, $00000000),
        ($00FFFFFF, $00FFFFFF, $00FFFFFF, $00666666, $00FFFFFF));

    private
      //  Theme
      FThemeManager: TUThemeManager;
      FCustomBorderColors: TControlStateColors;
      FCustomBackColors: TControlStateColors;
      FCustomTextColors: TControlStateColors;

      //  Fields
      FButtonState: TUButtonState;
      FEnabled: Boolean;
      FText: string;
      FAllowFocus: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUButtonState);
      procedure SetEnabled(const Value: Boolean); reintroduce;
      procedure SetText(const Value: string);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TMessage); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TMessage); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TMessage); message WM_LBUTTONUP;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure WM_SetFocus(var Msg: TMessage); message WM_SETFOCUS;
      procedure WM_KillFocus(var Msg: TMessage); message WM_KILLFOCUS;

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; reintroduce;
      procedure UpdateTheme;  //  IThemeControl

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property CustomBorderColors: TControlStateColors read FCustomBorderColors write FCustomBorderColors;
      property CustomBackColors: TControlStateColors read FCustomBackColors write FCustomBackColors;
      property CustomTextColors: TControlStateColors read FCustomTextColors write FCustomTextColors;

      property ButtonState: TUButtonState read FButtonState write SetButtonState default bsNone;
      property Enabled: Boolean read FEnabled write SetEnabled default true;
      property Text: string read FText write SetText;
      property AllowFocus: Boolean read FAllowFocus write FAllowFocus default false;

      {$REGION 'Common properties'}
      property Align;
      property Anchors;
      //property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Font;
      property ParentColor;
      //property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property TabOrder;
      property TabStop;
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

procedure TUButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUButton.UpdateTheme;
begin
  Paint;
end;

{ GETTERS & SETTER }

procedure TUButton.SetButtonState(const Value: TUButtonState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUButton.SetEnabled(const Value: Boolean);
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

procedure TUButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCustomBorderColors := TControlStateColors.Create($F2F2F2, $E6E6E6, $CCCCCC, $F2F2F2, $F2F2F2);
  FCustomBackColors := TControlStateColors.Create($F2F2F2, $E6E6E6, $CCCCCC, $F2F2F2, $F2F2F2);
  FCustomTextColors := TControlStateColors.Create(clBlack, clBlack, clBlack, clGray, clBlack);

  FButtonState := bsNone;
  FEnabled := true;
  FText := 'Button';
  FAllowFocus := false;

  Height := 30;
  Width := 135;

  Font.Name := 'Segoe UI';
  Font.Size := 10;

  //UpdateTheme;
end;

destructor TUButton.Destroy;
begin
  FCustomBorderColors.Free;
  FCustomBackColors.Free;
  FCustomTextColors.Free;

  inherited Destroy;
end;

{ CUSTOM METHODS }

procedure TUButton.Paint;
var
  TextX, TextY, TextW, TextH: Integer;
  BorderColor, BackColor, TextColor: TColor;
begin
  inherited;

  if ThemeManager = nil then
    begin
      BorderColor := CustomBorderColors.GetStateColor(ButtonState);
      BackColor := CustomBackColors.GetStateColor(ButtonState);
      TextColor := CustomTextColors.GetStateColor(ButtonState);
    end
  else
    begin
      BorderColor := DefBorderColor[ThemeManager.Theme, ButtonState];
      BackColor := DefBackColor[ThemeManager.Theme, ButtonState];
      TextColor := DefTextColor[ThemeManager.Theme, ButtonState];
    end;

  //  Paint background
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(TRect.Create(0, 0, Width, Height));

  //  Paint border
  Canvas.Pen.Color := BorderColor;
  Canvas.Pen.Width := 2;
  Canvas.Rectangle(1, 1, Width, Height);

  //  Paint text
  Font.Color := TextColor;
  Canvas.Font := Font;
  TextH := Canvas.TextHeight(Text);
  TextW := Canvas.TextWidth(Text);
  TextX := (Width - TextW) div 2;
  TextY := (Height - TextH) div 2;
  Canvas.TextOut(TextX, TextY, Text);
end;

{ MESSAGES }

procedure TUButton.WM_LButtonDblClk(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsPress;
      inherited;
    end;
end;

procedure TUButton.WM_LButtonDown(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      if AllowFocus = true then
        SetFocus;
      ButtonState := bsPress;
      inherited;
    end;
end;

procedure TUButton.WM_LButtonUp(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsHover;
      inherited;
    end;
end;

procedure TUButton.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsHover;
      inherited;
    end;
end;

procedure TUButton.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      if AllowFocus = false then
        ButtonState := bsNone
      else if Focused = false then
        ButtonState := bsNone
      else
        ButtonState := bsFocused;

      inherited;
    end;
end;

procedure TUButton.WM_SetFocus(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsFocused;
      inherited;
    end;
end;

procedure TUButton.WM_KillFocus(var Msg: TMessage);
begin
  if Enabled = true then
    begin
      ButtonState := bsNone;
      inherited;
    end;
end;

end.
