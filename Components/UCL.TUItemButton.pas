unit UCL.TUItemButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls, VCL.StdCtrls, VCL.ImgList;

type
  TUItemObjectKind = (iokNone, iokCheckBox, iokLeftIcon, iokText, iokDetail, iokRightIcon);

  TUCustomItemButton = class(TCustomControl, IUThemeControl)
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
      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure WM_LButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure CM_EnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;

    protected
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

      property ObjectSelected: TUItemObjectKind read FObjectSelected default iokNone;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ButtonState: TUControlState read FButtonState write SetButtonState default csNone;
      property HitTest: Boolean read FHitTest write FHitTest default true;

      property Images: TCustomImageList read FImages write FImages;
      property ImageLeftIndex: Integer read FImageLeftIndex write SetImageLeftIndex default -1;
      property ImageRightIndex: Integer read FImageRightIndex write SetImageRightIndex default -1;

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

{ THEME }

procedure TUCustomItemButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomItemButton.UpdateTheme;
begin
  Paint;
end;

{ SETTERS }

procedure TUCustomItemButton.SetButtonState(const Value: TUControlState);
begin
  if Value <> FButtonState then
    begin
      FButtonState := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetImageLeftIndex(const Value: Integer);
begin
  if Value <> FImageLeftIndex then
    begin
      FImageLeftIndex := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetImageRightIndex(const Value: Integer);
begin
  if Value <> FImageRightIndex then
    begin
      FImageRightIndex := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetObjectVisible(const Index: Integer; const Value: Boolean);
begin
  case Index of
    0:
      if Value <> FShowCheckBox then
        begin
          FShowCheckBox := Value;
          UpdateTheme;
        end;
    1:
      if Value <> FShowLeftIcon then
        begin
          FShowLeftIcon := Value;
          UpdateTheme;
        end;
    2:
      if Value <> FShowText then
        begin
          FShowText := Value;
          UpdateTheme;
        end;
    3:
      if Value <> FShowDetail then
        begin
          FShowDetail := Value;
          UpdateTheme;
        end;
    4:
      if Value <> FShowRightIcon then
        begin
          FShowRightIcon := Value;
          UpdateTheme;
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
          UpdateTheme;
        end;
    1:
      if Value <> FLeftIconWidth then
        begin
          FLeftIconWidth := Value;
          UpdateTheme;
        end;
    2:
      if Value <> FRightIconWidth then
        begin
          FRightIconWidth := Value;
          UpdateTheme;
        end;
  end;
end;

procedure TUCustomItemButton.SetIsChecked(const Value: Boolean);
begin
  if Value <> FIsChecked then
    begin
      FIsChecked := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetLeftIcon(const Value: string);
begin
  if Value <> FLeftIcon then
    begin
      FLeftIcon := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetDetail(const Value: string);
begin
  if Value <> FDetail then
    begin
      FDetail := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetRightIcon(Const Value: string);
begin
  if Value <> FRightIcon then
    begin
      FRightIcon := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetAlignSpace(const Value: Integer);
begin
  if Value <> FAlignSpace then
    begin
      FAlignSpace := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetCustomActiveColor(const Value: TColor);
begin
  if Value <> FCustomActiveColor then
    begin
      FCustomActiveColor := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetTransparent(const Value: Boolean);
begin
  if Value <> FTransparent then
    begin
      FTransparent := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetLeftIconKind(const Value: TUImageKind);
begin
  if Value <> FLeftIconKind then
    begin
      FLeftIconKind := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetRightIconKind(const Value: TUImageKind);
begin
  if Value <> FRightIconKind then
    begin
      FRightIconKind := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomItemButton.SetIsToggled(const Value: Boolean);
begin
  if Value <> FIsToggled then
    begin
      FIsToggled := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

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

  //UpdateTheme;
end;

destructor TUCustomItemButton.Destroy;
begin
  FIconFont.Free;
  FDetailFont.Free;
  inherited Destroy;
end;

{ CUSTOM METHODS }

procedure TUCustomItemButton.ChangeScale(M: Integer; D: Integer; isDpiChange: Boolean);
begin
  inherited;

  //Font.Height := MulDiv(Font.Height, M, D);   // Not neccesary
  IconFont.Height := MulDiv(IconFont.Height, M, D);
  DetailFont.Height := MulDiv(DetailFont.Height, M, D);

  CheckBoxWidth := MulDiv(CheckBoxWidth, M, D);
  LeftIconWidth := MulDiv(LeftIconWidth, M, D);
  RightIconWidth := MulDiv(RightIconWidth, M, D);
  AlignSpace := MulDiv(AlignSpace, M, D);
end;

procedure TUCustomItemButton.Paint;
var
  aTheme: TUTheme;
  LPos, RPos: Integer;
  ObjectH, ObjectW: Integer;
  ImgW, ImgH, ImgX, ImgY: Integer;

  BackColor, TextColor, DetailColor: TColor;
begin
  inherited;

  LPos := 0;
  RPos := Width;

  if ThemeManager = nil then
    aTheme := utLight
  else
    aTheme := ThemeManager.Theme;

  //  Transparent enabled
  if (ButtonState = csNone) and (Transparent = true) then
    begin
      ParentColor := true;
      BackColor := Color;
      TextColor := GetTextColorFromBackground(Color);
      DetailColor := DefDetailColor[aTheme, ButtonState];
    end

  //  Highlight enabled
  else if
    (ThemeManager <> nil)
    and ((IsToggleButton = true) and (IsToggled = true))
    and (ButtonState in [csNone, csHover, csFocused])
  then
    begin
      BackColor := ThemeManager.ActiveColor;
      TextColor := GetTextColorFromBackground(BackColor);
      DetailColor := clSilver;
    end

  //  Default colors
  else
    begin
      BackColor := DefBackColor[aTheme, ButtonState];
      TextColor := DefTextColor[aTheme, ButtonState];
      DetailColor := DefDetailColor[aTheme, ButtonState];
    end;

  //  Paint background
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  Canvas.Font := IconFont;
  //  Paint checkbox
  if ShowCheckBox = true then
    begin
      if IsChecked = true then
        begin
          //  Paint only check icon
          if ThemeManager = nil then
            Canvas.Font.Color := CustomActiveColor
          else
            Canvas.Font.Color := ThemeManager.ActiveColor;

          ObjectH := Canvas.TextHeight('');
          ObjectW := Canvas.TextWidth('');
          Canvas.TextOut(LPos + (CheckBoxWidth - ObjectW) div 2, (Height - ObjectH) div 2, '');
        end
      else
        begin
          //  Paint a empty box
          if aTheme = utLight then
            Canvas.Font.Color := $000000
          else
            Canvas.Font.Color := $FFFFFF;

          ObjectH := Canvas.TextHeight('');
          ObjectW := Canvas.TextWidth('');
          Canvas.TextOut(LPos + (CheckBoxWidth - ObjectW) div 2, (Height - ObjectH) div 2, '');
        end;

      inc(LPos, CheckBoxWidth);
    end;

  Canvas.Font.Color := TextColor;

  inc(LPos, AlignSpace);
  //  Paint left icon
  if ShowLeftIcon = true then
    if LeftIconKind = ikFontIcon then
      begin
        ObjectH := Canvas.TextHeight(LeftIcon);
        ObjectW := Canvas.TextWidth(LeftIcon);
        Canvas.TextOut(LPos + (LeftIconWidth - ObjectW) div 2, (Height - ObjectH) div 2, LeftIcon);

        inc(LPos, LeftIconWidth);
      end
    else if (Images <> nil) and (ImageLeftIndex >= 0) then
      begin
        ImgW := Images.Width;
        ImgH := Images.Height;
        ImgX := LPos + (LeftIconWidth - ImgW) div 2;
        ImgY := (Height - ImgH) div 2;

        Images.Draw(Canvas, ImgX, ImgY, ImageLeftIndex, Enabled);
        inc(LPos, LeftIconWidth);
      end;

  dec(RPos, AlignSpace);
  //  Paint right icon
  if ShowRightIcon = true then
    if RightIconKind = ikFontIcon then
      begin
        ObjectH := Canvas.TextHeight(RightIcon);
        ObjectW := Canvas.TextWidth(RightIcon);
        Canvas.TextOut(RPos - RightIconWidth + (RightIconWidth - ObjectW) div 2, (Height - ObjectH) div 2, RightIcon);

        dec(RPos, RightIconWidth);
      end
    else if (Images <> nil) and (ImageRightIndex >= 0) then
      begin
        ImgW := Images.Width;
        ImgH := Images.Height;
        ImgX := RPos - RightIconWidth + (RightIconWidth - ImgW) div 2;
        ImgY := (Height - ImgH) div 2;

        Images.Draw(Canvas, ImgX, ImgY, ImageRightIndex, Enabled);
        dec(RPos, RightIconWidth);
      end;

  Canvas.Font := Self.Font; //  Default font = text font

  // Paint text
  if ShowText = true then
    begin
      Canvas.Font.Color := TextColor;

      ObjectH := Canvas.TextHeight(Text);
      Canvas.TextOut(LPos + AlignSpace, (Height - ObjectH) div 2, Text);
    end;

  //  Paint detail
  if ShowDetail = true then
    begin
      Canvas.Font := DetailFont;
      Canvas.Font.Color := DetailColor;

      ObjectH := Canvas.TextHeight(Detail);
      ObjectW := Canvas.TextWidth(Detail);
      Canvas.TextOut(RPos - ObjectW - AlignSpace, (Height - ObjectH) div 2, Detail);
    end;
end;

{ MESSAGES }

procedure TUCustomItemButton.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

procedure TUCustomItemButton.WM_LButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomItemButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csPress;
      inherited;
    end;
end;

procedure TUCustomItemButton.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      if Msg.XPos < CheckBoxWidth then
        FObjectSelected := iokCheckBox
      else if Msg.XPos < CheckBoxWidth + LeftIconWidth then
        FObjectSelected := iokLeftIcon
      else if Msg.XPos > Width - RightIconWidth then
        FObjectSelected := iokRightIcon
      else if Msg.XPos > Width - RightIconWidth - Canvas.TextWidth(Detail) - AlignSpace then
        FObjectSelected := iokDetail
      else
        FObjectSelected := iokText;

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
      if (IsToggleButton = true) and (FObjectSelected <> iokCheckBox) then
        FIsToggled := not FIsToggled;

      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomItemButton.CM_MouseEnter(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csHover;
      inherited;
    end;
end;

procedure TUCustomItemButton.CM_MouseLeave(var Msg: TMessage);
begin
  if (Enabled = true) and (HitTest = true) then
    begin
      ButtonState := csNone;
      inherited;
    end;
end;

procedure TUCustomItemButton.CM_EnabledChanged(var Msg: TMessage);
begin
  inherited;
  if Enabled = false then
    FButtonState := csDisabled
  else
    FButtonState := csNone;
  UpdateTheme;
end;

end.
