unit UCL.TUQuickButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages,
  VCL.Controls, VCL.Graphics;

type
  TUCustomQuickButton = class(TCustomControl, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;
      FLightColor: TColor;
      FDarkColor: TColor;
      FFontIcon: string;
      FPressBrightnessDelta: Integer;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetFontIcon(const Value: string);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
      procedure Paint; override;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property LightColor: TColor read FLightColor write FLightColor default $E6E6E6;
      property DarkColor: TColor read FDarkColor write FDarkColor default $191919;
      property PressBrightnessDelta: Integer read FPressBrightnessDelta write FPressBrightnessDelta default 25;
      property FontIcon: string read FFontIcon write SetFontIcon;
  end;

  TUQuickButton = class(TUCustomQuickButton)
    published
      //  Common properties
      property Align;
      property Anchors;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property TabOrder;
      property TabStop;
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

{ TUCustomQuickButton }

//  THEME

procedure TUCustomQuickButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomQuickButton.UpdateTheme;
begin
  Paint;
end;

//  SETTERS

procedure TUCustomQuickButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      Paint;
    end;
end;

procedure TUCustomQuickButton.SetFontIcon(const Value: string);
begin
  if Value <> FFontIcon then
    begin
      FFontIcon := Value;
      Paint;
    end;
end;

//  MAIN CLASS

constructor TUCustomQuickButton.Create(aOwner: TComponent);
begin
  inherited;

  FButtonState := csNone;
  FLightColor := $E6E6E6;
  FDarkColor := $191919;
  FPressBrightnessDelta := 25;
  FFontIcon := '';

  Font.Name := 'Segoe MDL2 Assets';
  Font.Size := 11;
  Height := 32;
  Width := 45;
end;

// CUSTOM METHODS

procedure TUCustomQuickButton.Paint;
var
  BackColor, TextColor: TColor;
  TextW, TextH, TextX, TextY: Integer;
begin
  //  Get background color
  case ButtonState of
    csNone:
      begin
        ParentColor := true;
        BackColor := Color;
      end;

    csHover:
      if ThemeManager = nil then
        BackColor := LightColor
      else if ThemeManager.Theme = utLight then
        BackColor := LightColor
      else
        BackColor := DarkColor;

    csPress:
      if ThemeManager = nil then
        BackColor := BrightenColor(LightColor, PressBrightnessDelta)
      else if ThemeManager.Theme = utLight then
        BackColor := BrightenColor(LightColor, PressBrightnessDelta)
      else
        BackColor := BrightenColor(DarkColor, -PressBrightnessDelta);

    csDisabled:
      BackColor := $666666;

    csFocused:
      if ThemeManager = nil then
        BackColor := LightColor
      else if ThemeManager.Theme = utLight then
        BackColor := LightColor
      else
        BackColor := DarkColor;

    else
      BackColor := $D77800;
  end;

  //  Overwrite background
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  //  Get text color
  TextColor := GetTextColorFromBackground(BackColor);

  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;

  //  Paint text
  TextW := Canvas.TextWidth(FontIcon);
  TextH := Canvas.TextHeight(FontIcon);
  TextX := (Width - TextW) div 2;
  TextY := (Height - TextH) div 2;
  Canvas.TextOut(TextX, TextY, FontIcon);
end;

//  MESSAGES

procedure TUCustomQuickButton.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomQuickButton.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if Enabled then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomQuickButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomQuickButton.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomQuickButton.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomQuickButton.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

end.
