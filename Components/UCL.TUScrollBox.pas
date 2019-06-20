unit UCL.TUScrollBox;

interface

uses
  FlatSB,
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation,
  System.Classes, System.SysUtils, System.TypInfo,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Forms, VCL.Dialogs;

type
  TUScrollBox = class(TScrollBox, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FIsScrolling: Boolean;
      FScrollLength: Integer;
      FScrollTime: Integer;
      FScrollOrientation: TUOrientation;
      FShowScrollBar: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_MouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
      procedure WM_Paint(var Msg: TWMPaint); message WM_PAINT;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; reintroduce;
      procedure AfterContrusction;

      procedure UpdateTheme;
      procedure BeginUpdate;
      procedure EndUpdate;
      procedure HideScrollBar;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property IsScrolling: Boolean read FIsScrolling;
      property ScrollLength: Integer read FScrollLength write FScrollLength default 320;
      property ScrollTime: Integer read FScrollTime write FScrollTime default 300;
      property ScrollOrientation: TUOrientation read FScrollOrientation write FScrollOrientation default oVertical;
      property ShowScrollBar: Boolean read FShowScrollBar write FShowScrollBar default false;
  end;

implementation

{ THEME }

procedure TUScrollBox.SetThemeManager(const Value: TUThemeManager);
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

procedure TUScrollBox.UpdateTheme;
begin
  if ThemeManager = nil then
    Color := $00E6E6E6
  else if ThemeManager.Theme = utLight then
    Color := $00E6E6E6
  else
    Color := $001F1F1F;
end;

{ MAIN CLASS }

procedure TUScrollBox.AfterContrusction;
begin
  InitializeFlatSB(Handle);
end;

constructor TUScrollBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  DoubleBuffered := true;
  BorderStyle := bsNone;

  FIsScrolling := false;

  FScrollLength := 320;
  FScrollTime := 300;
  FScrollOrientation := oVertical;

  UpdateTheme;
end;

destructor TUScrollBox.Destroy;
begin
  UninitializeFlatSB(Handle);

  inherited Destroy;
end;

{ MESSAGES }

procedure TUScrollBox.WM_MouseWheel(var Msg: TWMMouseWheel);
var
  Ani: TIntAni;
  Start, Stop: Integer;
  aScrollbar: TControlScrollBar;
begin
  inherited;

  if FIsScrolling = true then
    exit
  else
    FIsScrolling := true;

  BeginUpdate;

  if ScrollOrientation = oVertical then
    aScrollbar := VertScrollBar
  else
    aScrollbar := HorzScrollBar;

  Start := aScrollbar.Position;
  Stop := aScrollbar.Position - ScrollLength * Msg.WheelDelta div Abs(Msg.WheelDelta);
  //  If ScrollLength > Out of range, reduce it to fit
  if Stop < 0 then
    Stop := 0
  else if Stop > aScrollbar.Range then
    Stop := aScrollbar.Range;

  Ani := TIntAni.Create(akOut, afkQuartic, Start, Stop,
    procedure (Value: Integer)
    begin
      aScrollbar.Position := Value;
    end, true);

  //  On scroll done
  Ani.OnDone :=
    procedure
    begin
      FIsScrolling := false;
      if ShowScrollBar = false then
        HideScrollBar;
      EndUpdate;
    end;
  Ani.Step := 20;

  Ani.Duration := ScrollTime;

  if csDesigning in ComponentState = false then
    EnableAlign;  //  Neccesary
  Ani.Start;
end;

procedure TUScrollBox.WM_Paint(var Msg: TWMPaint);
begin
  //  Hide scrollbar after construction
  inherited;
  if ShowScrollBar = false then
    HideScrollBar;
end;

procedure TUScrollBox.BeginUpdate;
begin

end;

procedure TUScrollBox.EndUpdate;
begin

end;

procedure TUScrollBox.HideScrollBar;
begin
  if csDesigning in ComponentState = false then
    FlatSB_ShowScrollBar(Handle, SB_BOTH, false);
end;

end.
