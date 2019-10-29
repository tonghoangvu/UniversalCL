unit UCL.TURadioButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.Graphics,
  System.Classes,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Graphics;

type
  TUCustomRadioButton = class(TGraphicControl, IUThemeComponent)
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
      FTextOnGlass: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAutoSize(const Value: Boolean); reintroduce;
      procedure SetIsChecked(const Value: Boolean);
      procedure SetTextOnGlass(const Value: Boolean);

      //  Messages
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

      property AutoSize: Boolean read FAutoSize write SetAutoSize default false;
      property HitTest: Boolean read FHitTest write FHitTest default true;
      property IsChecked: Boolean read FIsChecked write SetIsChecked default false;
      property Group: string read FGroup write FGroup;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;
      property TextOnGlass: Boolean read FTextOnGlass write SetTextOnGlass default false;
  end;

  TURadioButton = class(TUCustomRadioButton)
    published
      //  Common properties
      property Align;
      property Anchors;
      property Color;
      property Caption;
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


procedure TUCustomRadioButton.SetTextOnGlass(const Value: Boolean);
begin
  if Value <> FTextOnGlass then
    begin
      FTextOnGlass := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUCustomRadioButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New props
  FAutoSize := false;
  FHitTest := true;
  FIsChecked := false;
  FCustomActiveColor := $D77800;
  FTextOnGlass := false;

  FIconFont := TFont.Create;
  FIconFont.Name := 'Segoe MDL2 Assets';
  FIconFont.Size := 15;

  ParentColor := true;
  Font.Name := 'Segoe UI';
  Font.Size := 10;

  Height := 30;
  Width := 180;

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

  IconFont.Height := MulDiv(IconFont.Height, M, D);

  Resize;
end;

procedure TUCustomRadioButton.Paint;
var
  IconRect, TextRect: TRect;
begin
  inherited;

  //  Paint background
  if not TextOnGlass then
    begin
      Canvas.Brush.Style := bsSolid;
      Canvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
      Canvas.FillRect(GetClientRect);
    end;

  //  Calc rects
  IconRect := Rect(0, 0, Height, Height);
  TextRect := Rect(Height, 0, Width, Height);

  //  Paint text
  Canvas.Brush.Style := bsClear;
  Canvas.Font := Font;
  Canvas.Font.Color := TextColor;
  DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, TextRect, Caption, TextOnGlass);

  //  Paint icon
  Canvas.Font := IconFont;
  if not IsChecked then
    begin
      Canvas.Font.Color := TextColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, IconRect, ICON_CIRCLE_BORDER, TextOnGlass);
    end
  else
    begin
      Canvas.Font.Color := ActiveColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, IconRect, ICON_CIRCLE_BORDER, TextOnGlass);

      Canvas.Font.Color := TextColor;
      DrawTextRect(Canvas, taLeftJustify, taVerticalCenter, IconRect, ICON_CIRCLE_INSIDE, TextOnGlass);
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
      Width := Height + Canvas.TextWidth(Text) + (Height - Canvas.TextHeight(Text)) div 2;
    end
  else
    inherited;
end;

//  MESSAGES

procedure TUCustomRadioButton.WM_LButtonUp(var Msg: TWMLButtonUp);
var 
  i: Integer;
begin
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

  inherited;
end;

procedure TUCustomRadioButton.CM_EnabledChanged(var Msg: TMessage);
begin
  UpdateTheme;
end;

end.
