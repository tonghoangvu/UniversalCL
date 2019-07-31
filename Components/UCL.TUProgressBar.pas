unit UCL.TUProgressBar;

interface

uses
  UCL.Classes,
  UCL.SystemSettings, UCL.TUThemeManager,
  System.SysUtils, System.Classes, System.Types,
  Winapi.Messages,
  VCL.Controls, VCL.ExtCtrls, VCL.Graphics,
  UCL.IntAnimation;

type
  TUCustomProgressBar = class(TCustomControl, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;

      FValue: Integer;

      FOrientation: TUOrientation;
      FCustomForeColor: TColor;
      FCustomBackColor: TColor;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetValue(const Value: Integer);
      procedure SetOrientation(const Value: TUOrientation);

      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;

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
  end;

  TUProgressBar = class(TUCustomProgressBar)
    published
      // Common properties
      property Align;
      property AlignWithMargins;
      property Anchors;
      property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
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

{ THEME }

procedure TUCustomProgressBar.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current ThemeManager
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.Connect(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomProgressBar.UpdateTheme;
begin
  Paint;
end;

{ SETTERS }

procedure TUCustomProgressBar.SetValue(const Value: Integer);
begin
  if FValue <> Value then
    begin
      FValue := Value;
      UpdateTheme;  //  Repaint when change value
    end;
end;

procedure TUCustomProgressBar.SetOrientation(const Value: TUOrientation);
begin
  if FOrientation <> Value then
    begin
      FOrientation := Value;
      UpdateTheme;  //  Repaint when change orientation
    end;
end;

{ MAIN CLASS }

constructor TUCustomProgressBar.Create(aOnwer: TComponent);
begin
  inherited Create(aOnwer);

  //  Default properties value
  FCustomForeColor := $25B006;
  FCustomBackColor := $E6E6E6;
  FValue := 0;
end;

procedure TUCustomProgressBar.GoToValue(Value: Integer);
var
  Ani: TIntAni;
begin
  //  If disabled, UI not change, but can not go to value
  if Enabled = false then
    exit;

  Ani := TIntAni.Create(true, akOut, afkQuartic, FValue, Value - FValue,
    procedure (Value: Integer)
    begin
      Self.Value := Value;
    end);
  Ani.Step := 25;
  Ani.Duration := 250;
  Ani.Start;
end;

{ CUSTOM METHODS }

procedure TUCustomProgressBar.Paint;
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
      BackColor := $CCCCCC;
      ForeColor := ThemeManager.AccentColor;
    end
  else
    begin
      BackColor := $333333;
      ForeColor := ThemeManager.AccentColor;
    end;

  //  PERFORMANCE UPGRADE: Calculate rectangle for paint faster
  if Orientation = oHorizontal then
    begin
      FillRect := Rect(0, 0, Round(Value / 100 * Width), Height);
      BackRect := Rect(FillRect.Right, 0, Width, Height);
    end
  else
    begin
      BackRect := Rect(0, 0, Width, Round(Value / 100 * Height));
      FillRect := Rect(0, BackRect.Bottom, Width, Height);
    end;

  //  Paint background (not full, only unfilled area)
  Canvas.Brush.Color := BackColor;
  Canvas.FillRect(BackRect);

  //  Paint foreround
  Canvas.Brush.Color := ForeColor;
  Canvas.FillRect(FillRect);
end;

{ MESSAGES }

procedure TUCustomProgressBar.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

end.
