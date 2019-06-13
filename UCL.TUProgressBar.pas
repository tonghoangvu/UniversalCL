unit UCL.TUProgressBar;

interface

uses
  UCL.Classes,
  UCL.SystemSettings, UCL.TUThemeManager,
  System.SysUtils, System.Classes, System.Types,
  VCL.Controls, VCL.ExtCtrls, VCL.Graphics,
  UCL.IntAnimation;

type
  TUProgressBar = class(TGraphicControl, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FValue: Integer;

      FOrientation: TUOrientation;
      FCustomForeColor: TColor;
      FCustomBackColor: TColor;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetValue(const Value: Integer);
      procedure SetOrientation(const Value: TUOrientation);

    protected
      procedure Paint; override;

    public
      constructor Create(aOnwer: TComponent); override;
      procedure UpdateTheme;
      procedure GoToValue(Value: Integer);

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property Value: Integer read FValue write SetValue;

      property Orientation: TUOrientation read FOrientation write SetOrientation;
      property CustomForeColor: TColor read FCustomForeColor write FCustomForeColor;
      property CustomBackColor: TColor read FCustomBackColor write FCustomBackColor;

      {$REGION 'Common properties'}
      property Align;
      property AlignWithMargins;
      property Anchors;
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
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

procedure TUProgressBar.SetThemeManager(const Value: TUThemeManager);
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

procedure TUProgressBar.UpdateTheme;
begin
  Paint;
end;

{ SETTERS }

procedure TUProgressBar.SetValue(const Value: Integer);
begin
  if FValue <> Value then
    begin
      FValue := Value;
      UpdateTheme;  //  Repaint when change value
    end;
end;

procedure TUProgressBar.SetOrientation(const Value: TUOrientation);
begin
  if FOrientation <> Value then
    begin
      FOrientation := Value;
      UpdateTheme;  //  Repaint when change orientation
    end;
end;

{ MAIN CLASS }

constructor TUProgressBar.Create(aOnwer: TComponent);
begin
  inherited Create(aOnwer);

  //  Default properties value
  FCustomForeColor := $0025B006;
  FCustomBackColor := $00E6E6E6;
  FValue := 0;
end;

procedure TUProgressBar.GoToValue(Value: Integer);
var
  Ani: TIntAni;
begin
  //  If disabled, UI not change, but can not go to value
  if Enabled = false then
    exit;

  Ani := TIntAni.Create(akOut, afkQuartic, FValue, Value,
    procedure (Value: Integer)
    begin
      Self.Value := Value;
    end, true);
  Ani.Start;
end;

{ CUSTOM METHODS }

procedure TUProgressBar.Paint;
var
  BackColor, ForeColor: TColor;
  BackRect, FillRect: TRect;
begin
  inherited;

  //  Getting BACK and FORE color
  if ThemeManager = nil then
    begin
      BackColor := FCustomBackColor;
      ForeColor := FCustomForeColor;
    end
  else if ThemeManager.Theme = utLight then
    begin
      BackColor := $00CCCCCC;
      ForeColor := ThemeManager.ActiveColor;
    end
  else
    begin
      BackColor := $00333333;
      ForeColor := ThemeManager.ActiveColor;
    end;

  //  PERFORMANCE UPGRADE: Calculate rectangle for paint faster
  if Orientation = oHorizontal then
    begin
      FillRect := TRect.Create(0, 0, Round(Value / 100 * Width), Height);
      BackRect := TRect.Create(FillRect.Right, 0, Width, Height);
    end
  else
    begin
      FillRect := TRect.Create(0, 0, Width, Round(Value / 100 * Height));
      BackRect := TRect.Create(0, FillRect.Bottom, Width, Height);
    end;

  //  Paint background (not full, only unfilled area)
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(BackRect);

  //  Paint foreround
  Canvas.Brush.Color := ForeColor;
  Canvas.FillRect(FillRect);
end;

end.
