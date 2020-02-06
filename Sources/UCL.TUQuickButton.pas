{$LEGACYIFEND ON}

unit UCL.TUQuickButton;

interface

uses
  Classes, Types, Messages, Controls, Graphics, Forms,
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics;

type
  TUQuickButtonStyle = (sbsNone, sbsQuit, sbsMax, sbsMin, sbsSysButton, sbsHighlight);

  TUCustomQuickButton = class(TGraphicControl, IUThemeComponent)
    private
      var BackColor: TColor;
      var TextColor: TColor;

      FThemeManager: TUThemeManager;
      FButtonState: TUControlState;
      FButtonStyle: TUQuickButtonStyle;
      FLightColor: TColor;
      FDarkColor: TColor;
      FCustomAccentColor: TColor;
      FPressBrightnessDelta: Integer;
      FTransparent: Boolean;

      //  Internal
      procedure UpdateColors;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetButtonStyle(const Value: TUQuickButtonStyle);
      procedure SetTransparent(const Value: Boolean);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property ButtonStyle: TUQuickButtonStyle read FButtonStyle write SetButtonStyle default sbsNone;

      property LightColor: TColor read FLightColor write FLightColor default $E6E6E6;
      property DarkColor: TColor read FDarkColor write FDarkColor default $191919;
      property CustomAccentColor: TColor read FCustomAccentColor write FCustomAccentColor default $D77800;
      property PressBrightnessDelta: Integer read FPressBrightnessDelta write FPressBrightnessDelta default 25;
      property Transparent: Boolean read FTransparent write SetTransparent default false;

      property Height default 32;
      property Width default 45;
  end;

  TUQuickButton = class(TUCustomQuickButton)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      property Caption;
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentBiDiMode;
      property ParentColor;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;
    {$IF CompilerVersion > 29}
      property StyleElements;
    {$IFEND}

      property OnCanResize;
      property OnClick;
      property OnConstrainedResize;
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
      property OnResize;
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
        begin
          Value.Connect(Self);
          Value.FreeNotification(Self);
        end;

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomQuickButton.UpdateTheme;
begin
  UpdateColors;
  Repaint;
end;

procedure TUCustomQuickButton.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  INTERNAL

procedure TUCustomQuickButton.UpdateColors;
begin
  case ButtonState of
    csNone:
      if not Transparent then
        begin
          ParentColor := true;
          BackColor := Color;
        end
      else
        begin
          TextColor := Font.Color;
          exit;
        end;

    csHover:
      if ThemeManager = nil then
        BackColor := CustomAccentColor
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
  end;

  TextColor := GetTextColorFromBackground(BackColor);
end;

//  SETTERS

procedure TUCustomQuickButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomQuickButton.SetButtonStyle(const Value: TUQuickButtonStyle);
begin
  if Value <> FButtonStyle then
    begin
      FButtonStyle := Value;

      case FButtonStyle of
        sbsNone:
          begin
            FLightColor := $CFCFCF;
            FDarkColor := $3C3C3C;
          end;

        sbsQuit:
          begin
            FLightColor := $002311E8;
            FDarkColor := $002311E8;
            FPressBrightnessDelta := 32;
            Caption := ''; //  Close icon
          end;

        sbsSysButton, sbsMax, sbsMin:
          begin
            FLightColor := $CFCFCF;
            FDarkColor := $3C3C3C;
            FPressBrightnessDelta := -32;
            case FButtonStyle of
              sbsMax:
                Caption := '';
              sbsMin:
                Caption := '';
//              sbsSysButton:
//                Caption := '';
            end;
          end;

        sbsHighlight:
          begin
            if ThemeManager = nil then
              FLightColor := FCustomAccentColor
            else
              FLightColor := ThemeManager.AccentColor;
            FDarkColor := FLightColor;
            FPressBrightnessDelta := 25;
            Caption := '';
          end;
      end;

      UpdateTheme;
    end;
end;

procedure TUCustomQuickButton.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      UpdateColors;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUCustomQuickButton.Create(aOwner: TComponent);
begin
  inherited;

  //  New props
  FButtonState := csNone;
  FLightColor := $E6E6E6;
  FDarkColor := $191919;
  FCustomAccentColor := $D77800;
  FPressBrightnessDelta := 25;
  FTransparent := false;

  //  Old props
  Caption := ''; //  Back icon
  Font.Name := 'Segoe MDL2 Assets';
  Font.Size := 10;
  Height := 32;
  Width := 45;

  UpdateColors;
end;

//  CUSTOM METHODS

procedure TUCustomQuickButton.Paint;
var
  TextRect: TRect;
begin
  inherited;

  if (not Transparent) or (ButtonState <> csNone) then //  Paint background
    begin
      Canvas.Brush.Style := bsSolid;
      Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BackColor, 255);
      Canvas.FillRect(Rect(0, 0, Width, Height));
    end;

  //  Draw text
  Canvas.Brush.Style := bsClear;
  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;

  TextRect := Rect(0, 0, Width, Height);
  DrawTextRect(Canvas, taCenter, taVerticalCenter, TextRect, Caption, true);
end;

//  MESSAGES

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
var
  ParentForm: TCustomForm;
begin
  if Enabled then
    begin
      ButtonState := csHover;

      case ButtonStyle of
        sbsQuit:
          GetParentForm(Self, true).Close;
        sbsMax:
          begin
            ParentForm := GetParentForm(Self, true);
            if ParentForm.WindowState = wsMaximized then
              ParentForm.WindowState := wsNormal
            else
              ParentForm.WindowState := wsMaximized;
          end;
        sbsMin:
          GetParentForm(Self, true).WindowState := wsMinimized;
      end;

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
