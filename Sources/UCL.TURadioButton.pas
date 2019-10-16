unit UCL.TURadioButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Graphics;

type
  TUCustomRadioButton = class(TCustomControl, IUThemeComponent)
    const
      ICON_CIRCLE_BORDER = '';
      ICON_CIRCLE_INSIDE = '';

    private
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
      FTextPosition: Integer;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAutoSize(const Value: Boolean); reintroduce;
      procedure SetIsChecked(const Value: Boolean);
      procedure SetText(const Value: string);
      procedure SetTextPosition(const Value: Integer);

      //  Messages
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
      property IsChecked: Boolean read FIsChecked write SetIsChecked default false;
      property Group: string read FGroup write FGroup;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;
      property Text: string read FText write SetText;
      property TextPosition: Integer read FTextPosition write SetTextPosition default 30;
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
  Repaint;
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

  //  Disabled
  if not Enabled then
    begin
      ActiveColor := $808080;
      TextColor := $808080;
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

procedure TUCustomRadioButton.SetTextPosition(const Value: Integer);
begin
  if Value <> FTextPosition then
    begin
      FTextPosition := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUCustomRadioButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New props
  FAutoSize := true;
  FHitTest := true;
  FIsChecked := false;
  FCustomActiveColor := $D77800;
  FText := 'URadioButton';
  FTextPosition := 30;

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

  FTextPosition := MulDiv(FTextPosition, M, D);
  IconFont.Height := MulDiv(IconFont.Height, M, D);

  Resize;
end;

procedure TUCustomRadioButton.Paint;
var
  TextH: Integer;
  IconH: Integer;
begin
  inherited;

  //  Paint background
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
  Canvas.FillRect(Rect(0, 0, Width, Height));
  Canvas.Brush.Style := bsClear;

  //  Paint text
  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;
  TextH := Canvas.TextHeight(Text);
  Canvas.Brush.Style := bsClear;
  Canvas.TextOut(TextPosition, (Height - TextH) div 2, Text);

  //  Paint radio
  Canvas.Font := IconFont;
  if not IsChecked then
    begin
      //  Paint circle border
      Canvas.Font.Color := TextColor;
      IconH := Canvas.TextHeight(ICON_CIRCLE_BORDER);
      Canvas.TextOut(0, (Height - IconH) div 2, ICON_CIRCLE_BORDER);
    end
  else
    begin
      //  Paint circle border (colored)
      Canvas.Font.Color := ActiveColor;
      IconH := Canvas.TextHeight(ICON_CIRCLE_BORDER);
      Canvas.TextOut(0, (Height - IconH) div 2, ICON_CIRCLE_BORDER);

      //  Paint small circle inside
      Canvas.Font.Color := TextColor;
      IconH := Canvas.TextHeight(ICON_CIRCLE_INSIDE);
      Canvas.TextOut(0, (Height - IconH) div 2, ICON_CIRCLE_INSIDE);
    end;
end;

procedure TUCustomRadioButton.Resize;
var
  Space: Integer;
begin
  if AutoSize and (Align = alNone) then
    begin
      Space := 5;
      Canvas.Font := IconFont;
      Height := 2 * Space + Canvas.TextHeight(ICON_CIRCLE_BORDER);
      Canvas.Font := Font;
      Width := TextPosition + Canvas.TextWidth(Text) + (Height - Canvas.TextHeight(Text)) div 2;
    end
  else
    inherited;
end;

//  MESSAGES

procedure TUCustomRadioButton.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  inherited;
  if Enabled and HitTest then
    SetFocus;
end;

procedure TUCustomRadioButton.WM_LButtonUp(var Msg: TWMLButtonUp);
var 
  i: Integer;
begin
  inherited;

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
    end;
end;

procedure TUCustomRadioButton.CM_EnabledChanged(var Msg: TMessage);
begin
  UpdateTheme;
end;

end.
