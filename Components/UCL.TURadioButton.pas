unit UCL.TURadioButton;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages,
  VCL.Controls, VCL.Graphics;

type
  TURadioButton = class(TGraphicControl, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FIsChecked: Boolean;
      FGroup: string;
      FCustomActiveColor: TColor;
      
      FText: string;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetText(const Value: string);
      procedure SetIsChecked(const Value: Boolean);

      procedure WMLButtonUp(var Msg: TMessage); message WM_LBUTTONUP;

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property IsChecked: Boolean read FIsChecked write SetIsChecked default false;
      property Group: string read FGroup write FGroup;
      property CustomActiveColor: TColor read FCustomActiveColor write FCustomActiveColor;

      property Text: string read FText write SetText;

      {$REGION 'Common properties'}
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
      {$ENDREGION}
  end;

implementation

{ THEME }

procedure TURadioButton.SetThemeManager(const Value: TUThemeManager);
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

procedure TURadioButton.UpdateTheme;
begin
  Paint;
end;

{ SETTERS }

procedure TURadioButton.SetIsChecked(const Value: Boolean);
begin
  if Value <> FIsChecked then
    begin
      FIsChecked := Value;
      UpdateTheme;
    end;
end;

procedure TURadioButton.SetText(const Value: string);
begin
  if Value <> FText then
    begin
      FText := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TURadioButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FIsChecked := false;
  FCustomActiveColor := $D77800;
  FText := 'URadioButton';

  Height := 24;
  Width := 200;
  ParentColor := true;

  Font.Name := 'Segoe UI';
  Font.Size := 10;

  //UpdateTheme;
  //  Dont UpdateTheme if it call Paint method
end;

{ CUSTOM METHODS }

procedure TURadioButton.Paint;
var
  TextH: Integer;
  IconH: Integer;
begin
  inherited;

  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;  //  Paint empty background
  Canvas.FillRect(TRect.Create(0, 0, Width, Height));
  Canvas.Brush.Style := bsClear;

  //  Paint text
  Canvas.Font := Font;
  if ThemeManager = nil then
    Canvas.Font.Color := $000000
  else if ThemeManager.Theme = utLight then
    Canvas.Font.Color := $000000
  else
    Canvas.Font.Color := $FFFFFF;
  TextH := Canvas.TextHeight(Text);
  Canvas.TextOut(30, (Height - TextH) div 2, Text);

  //  Paint radio
  Canvas.Font.Name := 'Segoe MDL2 Assets';
  Canvas.Font.Size := 15;
  if IsChecked = false then
    begin
      //  Paint circle border (black in light, white in dark)
        if ThemeManager = nil then
          Canvas.Font.Color := $000000
        else if ThemeManager.Theme = utLight then
          Canvas.Font.Color := $000000
        else
          Canvas.Font.Color := $FFFFFF;
        IconH := Canvas.TextHeight('');
        Canvas.TextOut(0, (Height - IconH) div 2, '');
    end
  else
    begin
      //  Paint circle border (active color)
      if ThemeManager = nil then
        Canvas.Font.Color := CustomActiveColor
      else
        Canvas.Font.Color := ThemeManager.ActiveColor;
      IconH := Canvas.TextHeight('');
      Canvas.TextOut(0, (Height - IconH) div 2, '');

      //  Paint small circle inside (black in light, white in dark)
      if ThemeManager = nil then
        Canvas.Font.Color := $000000
      else if ThemeManager.Theme = utLight then
        Canvas.Font.Color := $000000
      else 
        Canvas.Font.Color := $FFFFFF;
      IconH := Canvas.TextHeight('');
      Canvas.TextOut(0, (Height - IconH) div 2, '');
    end;
end;

{ MESSAGES }

procedure TURadioButton.WMLButtonUp(var Msg: TMessage);
var 
  i: Integer;
begin
  //  Only unchecked can change
  if IsChecked = false then
    begin
      IsChecked := true;  //  Check it

      //  Uncheck other TURadioButton with the same parent and group name
      for i := 0 to Parent.ControlCount - 1 do
        if Parent.Controls[i] is TURadioButton then
          if 
            ((Parent.Controls[i] as TURadioButton).Group = Group)
            and (Parent.Controls[i] <> Self)
          then
            (Parent.Controls[i] as TURadioButton).IsChecked := false;  
    end;

  inherited;
end;

end.
