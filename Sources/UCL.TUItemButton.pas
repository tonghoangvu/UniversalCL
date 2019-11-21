unit UCL.TUItemButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics,
  System.Classes, System.Types,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.Graphics, VCL.ImgList;

type
  TUItemObjectKind = (iokNone, iokCheckBox, iokLeftIcon, iokText, iokDetail, iokRightIcon);

  TUCustomItemButton = class(TCustomControl, IUThemeComponent)
    const
      ICON_CHECKED = '';
      ICON_UNCHECKED = '';

      DefBackColor: TDefColor = (
        ($00E6E6E6, $00CFCFCF, $00B8B8B8, $00CCCCCC, $00CFCFCF),
        ($001F1F1F, $00353535, $004C4C4C, $00333333, $00353535));
      DefTextColor: TDefColor = (
        ($00000000, $00000000, $00000000, $00666666, $00000000),
        ($00FFFFFF, $00FFFFFF, $00FFFFFF, $00666666, $00FFFFFF));

    private
      var BackColor, TextColor, DetailColor, ActiveColor: TColor;
      var CheckBoxRect, LeftIconRect, RightIconRect, DetailRect, TextRect: TRect;

      FThemeManager: TUThemeManager;

      FObjectSelected: TUItemObjectKind;
      FButtonState: TUControlState;
      FHitTest: Boolean;
      FLeftIconKind: TUImageKind;
      FRightIconKind: TUImageKind;

      FImages: TCustomImageList;
      FImageLeftIndex: Integer;
      FImageRightIndex: Integer;

      FIconFont: TFont;
      FDetailFont: TFont;

      FShowCheckBox: Boolean;
      FShowLeftIcon: Boolean;
      FShowText: Boolean;
      FShowDetail: Boolean;
      FShowRightIcon: Boolean;

      FIsChecked: Boolean;
      FLeftIcon: string;
      FText: string;
      FDetail: string;
      FRightIcon: string;

      FAlignSpace: Integer;

      FCheckBoxWidth: Integer;
      FLeftIconWidth: Integer;
      FRightIconWidth: Integer;

      FCustomActiveColor: TColor;
      FTransparent: Boolean;
      FIsToggleButton: Boolean;
      FIsToggled: Boolean;

      //  Internal
      procedure UpdateColors;
      procedure UpdateRects;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetButtonState(const Value: TUControlState);
      procedure SetImageLeftIndex(const Value: Integer);
      procedure SetImageRightIndex(const Value: Integer);

      procedure SetObjectVisible(const Index: Integer; const Value: Boolean);
      procedure SetObjectWidth(const Index: Integer; const Value: Integer);

      procedure SetIsChecked(const Value: Boolean);
      procedure SetLeftIcon(const Value: string);
      procedure SetText(const Value: string);
      procedure SetDetail(const Value: string);
      procedure SetRightIcon(Const Value: string);

      procedure SetAlignSpace(const Value: Integer);
      procedure SetCustomActiveColor(const Value: TColor);
      procedure SetTransparent(const Value: Boolean);
      procedure SetLeftIconKind(const Value: TUImageKind);
      procedure SetRightIconKind(const Value: TUImageKind);
      procedure SetIsToggled(const Value: Boolean);

      //  Messages
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;

    protected
      procedure Paint; override;
      procedure Resize; override;
      procedure CreateWindowHandle(const Params: TCreateParams); override;
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

      property ObjectSelected: TUItemObjectKind read FObjectSelected default iokNone;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property HitTest: Boolean read FHitTest write FHitTest default true;

      //  Image
      property Images: TCustomImageList read FImages write FImages;
      property ImageLeftIndex: Integer read FImageLeftIndex write SetImageLeftIndex default -1;
      property ImageRightIndex: Integer read FImageRightIndex write SetImageRightIndex default -1;

      //  Font
      property IconFont: TFont read FIconFont write FIconFont;
      property DetailFont: TFont read FDetailFont write FDetailFont;

      //  Object visible
      property ShowCheckBox: Boolean index 0 read FShowCheckBox write SetObjectVisible default false;
      property ShowLeftIcon: Boolean index 1 read FShowLeftIcon write SetObjectVisible default true;
      property ShowText: Boolean index 2 read FShowText write SetObjectVisible default true;
      property ShowDetail: Boolean index 3 read FShowDetail write SetObjectVisible default true;
      property ShowRightIcon: Boolean index 4 read FShowRightIcon write SetObjectVisible default false;

      //  Objects property
      property IsChecked: Boolean read FIsChecked write SetIsChecked default false;
      property LeftIcon: string read FLeftIcon write SetLeftIcon;
      property Text: string read FText write SetText;
      property Detail: string read FDetail write SetDetail;
      property RightIcon: string read FRightIcon write SetRightIcon;

      //  Objects size
      property CheckBoxWidth: Integer index 0 read FCheckBoxWidth write SetObjectWidth default 40;
      property LeftIconWidth: Integer index 1 read FLeftIconWidth write SetObjectWidth default 40;
      property RightIconWidth: Integer index 2 read FRightIconWidth write SetObjectWidth default 40;

      //  Additional
      property AlignSpace: Integer read FAlignSpace write SetAlignSpace default 5;
      property CustomActiveColor: TColor read FCustomActiveColor write SetCustomActiveColor;
      property Transparent: Boolean read FTransparent write SetTransparent default false;
      property LeftIconKind: TUImageKind read FLeftIconKind write SetLeftIconKind default ikFontIcon;
      property RightIconKind: TUImageKind read FRightIconKind write SetRightIconKind default ikFontIcon;
      property IsToggleButton: Boolean read FIsToggleButton write FIsToggleButton default false;
      property IsToggled: Boolean read FIsToggled write SetIsToggled default false;
  end;

  TUItemButton = class(TUCustomItemButton)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      //property Caption;
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
      property StyleElements;

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

{ TUCustomItemButton }

//  THEME

procedure TUCustomItemButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomItemButton.UpdateTheme;
begin
  UpdateColors;
  UpdateRects;
  Repaint;
end;

//  INTERNAL

procedure TUCustomItemButton.UpdateColors;
var
  TempTheme: TUTheme;
begin
  if ThemeManager = nil then
    TempTheme := utLight
  else
    TempTheme := ThemeManager.Theme;

  //  Transparent enabled
  if (ButtonState = csNone) and (Transparent) then
    begin
      ParentColor := true;
      BackColor := Color;
      TextColor := GetTextColorFromBackground(Color);
      DetailColor := $808080;
    end

  //  Highlight enabled
  else if
    (ThemeManager <> nil)
    and ((IsToggleButton) and (IsToggled))
    and (ButtonState in [csNone, csHover, csFocused])
  then
    begin
      BackColor := ThemeManager.AccentColor;
      TextColor := GetTextColorFromBackground(BackColor);
      DetailColor := clSilver;
    end

  //  Default colors
  else
    begin
      BackColor := DefBackColor[TempTheme, ButtonState];
      TextColor := DefTextColor[TempTheme, ButtonState];
      DetailColor := $808080;
    end;

  //  Active color
  if ThemeManager = nil then
    ActiveColor := CustomActiveColor
  else
    ActiveColor := ThemeManager.AccentColor;
end;

procedure TUCustomItemButton.UpdateRects;
var
  LPos, RPos: Integer;
  TempWidth: Integer;
begin
  if not HandleAllocated then exit;

  LPos := 0;
  RPos := Width;

  if ShowCheckBox then
    CheckBoxRect := Rect(0, 0, CheckBoxWidth, Height)
  else
    CheckBoxRect := TRect.Empty;
  inc(LPos, CheckBoxRect.Width);

  if ShowLeftIcon then
    LeftIconRect := Rect(LPos, 0, LPos + LeftIconWidth, Height)
  else
    LeftIconRect := TRect.Empty;
  inc(LPos, LeftIconRect.Width);

  if ShowRightIcon then
    RightIconRect := Rect(RPos - RightIconWidth, 0, RPos, Height)
  else
    RightIconRect := TRect.Empty;
  dec(RPos, RightIconRect.Width);

  if ShowDetail then
    begin
      Canvas.Font := DetailFont;
      TempWidth := Canvas.TextWidth(Detail);
      DetailRect := Rect(RPos - AlignSpace - TempWidth, 0, RPos, Height);
    end
  else
    DetailRect := TRect.Empty;
  dec(RPos, DetailRect.Width);

  if ShowText then
    TextRect := Rect(LPos + AlignSpace, 0, RPos - AlignSpace, Height)
  else
    TextRect := TRect.Empty;
end;

//  SETTERS

procedure TUCustomItemButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetImageLeftIndex(const Value: Integer);
begin
  if Value <> FImageLeftIndex then
    begin
      FImageLeftIndex := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetImageRightIndex(const Value: Integer);
begin
  if Value <> FImageRightIndex then
    begin
      FImageRightIndex := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetObjectVisible(const Index: Integer; const Value: Boolean);
begin
  case Index of
    0:
      if Value <> FShowCheckBox then
        begin
          FShowCheckBox := Value;
          UpdateRects;
          Repaint;
        end;
    1:
      if Value <> FShowLeftIcon then
        begin
          FShowLeftIcon := Value;
          UpdateRects;
          Repaint;
        end;
    2:
      if Value <> FShowText then
        begin
          FShowText := Value;
          UpdateRects;
          Repaint;
        end;
    3:
      if Value <> FShowDetail then
        begin
          FShowDetail := Value;
          UpdateRects;
          Repaint;
        end;
    4:
      if Value <> FShowRightIcon then
        begin
          FShowRightIcon := Value;
          UpdateRects;
          Repaint;
        end;
  end;
end;

procedure TUCustomItemButton.SetObjectWidth(const Index: Integer; const Value: Integer);
begin
  case Index of
    0:
      if Value <> FCheckBoxWidth then
        begin
          FCheckBoxWidth := Value;
          UpdateRects;
          Repaint;
        end;
    1:
      if Value <> FLeftIconWidth then
        begin
          FLeftIconWidth := Value;
          UpdateRects;
          Repaint;
        end;
    2:
      if Value <> FRightIconWidth then
        begin
          FRightIconWidth := Value;
          UpdateRects;
          Repaint;
        end;
  end;
end;

procedure TUCustomItemButton.SetIsChecked(const Value: Boolean);
begin
  if Value <> FIsChecked then
    begin
      FIsChecked := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetLeftIcon(const Value: string);
begin
  if Value <> FLeftIcon then
    begin
      FLeftIcon := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetDetail(const Value: string);
begin
  if Value <> FDetail then
    begin
      FDetail := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetRightIcon(Const Value: string);
begin
  if Value <> FRightIcon then
    begin
      FRightIcon := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetAlignSpace(const Value: Integer);
begin
  if Value <> FAlignSpace then
    begin
      FAlignSpace := Value;
      UpdateRects;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetCustomActiveColor(const Value: TColor);
begin
  if Value <> FCustomActiveColor then
    begin
      FCustomActiveColor := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetLeftIconKind(const Value: TUImageKind);
begin
  if Value <> FLeftIconKind then
    begin
      FLeftIconKind := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetRightIconKind(const Value: TUImageKind);
begin
  if Value <> FRightIconKind then
    begin
      FRightIconKind := Value;
      Repaint;
    end;
end;

procedure TUCustomItemButton.SetIsToggled(const Value: Boolean);
begin
  if Value <> FIsToggled then
    begin
      FIsToggled := Value;
      UpdateColors;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUCustomItemButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FObjectSelected := iokNone;
  FButtonState := csNone;
  FHitTest := true;
  FImageLeftIndex := -1;
  FImageRightIndex := -1;

  //  Init text font
  Font.Name := 'Segoe UI';
  Font.Size := 10;
  Height := 40;
  Width := 250;

  //  Init icon font
  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  //  Init detail font
  FDetailFont := TFont.Create;
  FDetailFont.Name := 'Segoe UI';
  FDetailFont.Size := 10;

  FShowCheckBox := false;
  FShowLeftIcon := true;
  FShowText := true;
  FShowDetail := true;
  FShowRightIcon := false;

  FIsChecked := false;
  FLeftIcon := '';
  FText := 'Text';
  FDetail := 'Detail';
  FRightIcon := '';

  FCheckBoxWidth := 40;
  FLeftIconWidth := 40;
  FRightIconWidth := 40;

  FAlignSpace := 5;
  FCustomActiveColor := $D77800;
  FTransparent := false;
  FLeftIconKind := ikFontIcon;
  FRightIconKind := ikFontIcon;
  FIsToggleButton := false;
  FIsToggled := false;

  //  Common properties
  TabStop := true;
end;

destructor TUCustomItemButton.Destroy;
begin
  FIconFont.Free;
  FDetailFont.Free;
  inherited;
end;

//  CUSTOM METHODS

procedure TUCustomItemButton.Paint;
var
  ImgX, ImgY: Integer;
begin
  inherited;

  //  Paint background
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(BackColor, 255);
  Canvas.FillRect(Rect(0, 0, Width, Height));

  Canvas.Font := IconFont;

  //  Paint checkbox
  if ShowCheckBox then
    if IsChecked then
      begin
        Canvas.Font.Color := ActiveColor;
        DrawTextRect(Canvas, taCenter, taVerticalCenter, CheckBoxRect, ICON_CHECKED, false);
      end
    else
      begin
        Canvas.Font.Color := TextColor;
        DrawTextRect(Canvas, taCenter, taVerticalCenter, CheckBoxRect, ICON_UNCHECKED, false);
      end;

  Canvas.Font.Color := TextColor;

  //  Paint left icon
  if ShowLeftIcon then
    if LeftIconKind = ikFontIcon then
      DrawTextRect(Canvas, taCenter, taVerticalCenter, LeftIconRect, LeftIcon, false)
    else if Images <> nil then
      begin
        GetCenterPos(Images.Width, Images.Height, LeftIconRect, ImgX, ImgY);
        Images.Draw(Canvas, ImgX, ImgY, ImageLeftIndex, Enabled);
      end;

  //  Paint right icon
  if ShowRightIcon then
    if RightIconKind = ikFontIcon then
      DrawTextRect(Canvas, taCenter, taVerticalCenter, RightIconRect, RightIcon, false)
    else if Images <> nil then
      begin
        GetCenterPos(Images.Width, Images.Height, RightIconRect, ImgX, ImgY);
        Images.Draw(Canvas, ImgX, ImgY, ImageRightIndex, Enabled);
      end;

  //  Paint detail
  if ShowDetail then
    begin
      Canvas.Font := DetailFont;
      Canvas.Font.Color := DetailColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, DetailRect, Detail, false);
    end;

  //  Paint text
  if ShowText then
    begin
      Canvas.Font := Font;
      Canvas.Font.Color := TextColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, TextRect, Text, false);
    end;
end;

procedure TUCustomItemButton.Resize;
begin
  inherited;
  UpdateRects;
end;

procedure TUCustomItemButton.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited;
  UpdateColors;
end;

procedure TUCustomItemButton.ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean);
begin
  inherited;

  IconFont.Height := MulDiv(IconFont.Height, M, D);
  DetailFont.Height := MulDiv(DetailFont.Height, M, D);

  CheckBoxWidth := MulDiv(CheckBoxWidth, M, D);
  LeftIconWidth := MulDiv(LeftIconWidth, M, D);
  RightIconWidth := MulDiv(RightIconWidth, M, D);
  AlignSpace := MulDiv(AlignSpace, M, D);
end;

//  MESSAGES

procedure TUCustomItemButton.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomItemButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomItemButton.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if Enabled and HitTest then
    begin
//      if Msg.XPos < CheckBoxWidth then
//        FObjectSelected := iokCheckBox
//      else if Msg.XPos < CheckBoxWidth + LeftIconWidth then
//        FObjectSelected := iokLeftIcon
//      else if Msg.XPos > Width - RightIconWidth then
//        FObjectSelected := iokRightIcon
//      else if Msg.XPos > Width - RightIconWidth - Canvas.TextWidth(Detail) - AlignSpace then
//        FObjectSelected := iokDetail
//      else
//        FObjectSelected := iokText;

      if PointInRect(Msg.Pos, CheckBoxRect) then
        FObjectSelected := iokCheckBox
      else if PointInRect(Msg.Pos, LeftIconRect) then
        FObjectSelected := iokLeftIcon
      else if PointInRect(Msg.Pos, RightIconRect) then
        FObjectSelected := iokRightIcon
      else if PointInRect(Msg.Pos, DetailRect) then
        FObjectSelected := iokDetail
      else if PointInRect(Msg.Pos, TextRect) then
        FObjectSelected := iokText
      else
        FObjectSelected := iokNone;

      case FObjectSelected of
        iokNone: ;
        iokCheckBox: 
          IsChecked := not IsChecked;
        iokLeftIcon: ;
        iokText: ;
        iokDetail: ;
        iokRightIcon: ;
      end;

      //  Switch toggle state
      if (IsToggleButton) and (FObjectSelected <> iokCheckBox) then
        FIsToggled := not FIsToggled;

      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomItemButton.CM_MouseEnter(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomItemButton.CM_MouseLeave(var Msg: TMessage);
begin
  if Enabled and HitTest then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUCustomItemButton.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if not Enabled then
    FButtonState := csDisabled
  else
    FButtonState := csNone;
  UpdateTheme;
end;

end.
