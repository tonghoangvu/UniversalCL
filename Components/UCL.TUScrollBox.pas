unit UCL.TUScrollBox;

interface

uses
  FlatSB,
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation,
  System.Classes, System.SysUtils, System.TypInfo,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Forms, VCL.ExtCtrls;

type
  TUScrollBox = class(TScrollBox, IUThemeControl)
    private
      //  Temp variables
      var ScrollCount: Integer;
      var WheelDelta: SmallInt;

      //  Object fields
      FThemeManager: TUThemeManager;
      FTimer: TTimer;

      //  Read-only
      FIsScrolling: Boolean;

      FScrollOrientation: TUOrientation;
      FShowScrollBar: Boolean;
      FWaitEventTime: Integer;

      FMaxScrollCount: Integer;
      FLengthPerStep: Integer;
      FTimePerStep: Integer;

      procedure DoTimer(Sender: TObject);

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_MouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
      procedure WM_Paint(var Msg: TWMPaint); message WM_PAINT;
      procedure WM_Size(var Msg: TWMSize); message WM_SIZE;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; reintroduce;
      procedure AfterContrusction;

      procedure UpdateTheme;
      procedure HideScrollBar;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property IsScrolling: Boolean read FIsScrolling;

      property ScrollOrientation: TUOrientation read FScrollOrientation write FScrollOrientation default oVertical;
      property ShowScrollBar: Boolean read FShowScrollBar write FShowScrollBar default false;
      property WaitEventTime: Integer read FWaitEventTime write FWaitEventTime default 50;

      property MaxScrollCount: Integer read FMaxScrollCount write FMaxScrollCount default 5;
      property LengthPerStep: Integer read FLengthPerStep write FLengthPerStep default 90;
      property TimePerStep: Integer read FTimePerStep write FTimePerStep default 120;
  end;

implementation

procedure TUScrollBox.HideScrollBar;
begin
  if csDesigning in ComponentState = false then
    FlatSB_ShowScrollBar(Handle, SB_BOTH, false);
end;

procedure TUScrollBox.DoTimer(Sender: TObject);
var
  Ani: TIntAni;
  aScrollBar: TControlScrollBar;
  Start, Stop: Integer;
  Length: Integer;
begin
  //  Begin scroll
  FTimer.Enabled := false;
  FIsScrolling := true;

  if ScrollCount > MaxScrollCount then
    ScrollCount := MaxScrollCount;

  //  Get scrollbar
  if ScrollOrientation = oVertical then
    aScrollBar := VertScrollBar
  else
    aScrollBar := HorzScrollBar;

  Start := aScrollBar.Position;
  Stop := aScrollBar.Position - LengthPerStep * ScrollCount * (WheelDelta div Abs(WheelDelta));

  //  Scroll out of range
  if Stop < 0 then
    Stop := 0
  else if Stop > aScrollBar.Range then
    Stop := aScrollBar.Range;

  //  Reduce ScrollCount when scroll out of range
  Length := Abs(Stop - Start);
  ScrollCount := Round(Length / LengthPerStep);

  Ani := TIntAni.Create(akOut, afkQuartic, Start, Stop,
    procedure (Value: Integer)
    begin
      aScrollBar.Position := Value;
    end, true);

  Ani.OnDone :=
    procedure
    begin
      ScrollCount := 0;
      FIsScrolling := false;
      if ShowScrollBar = false then
        HideScrollBar;
    end;

  Ani.Step := 23;
  Ani.Duration := Round(TimePerStep * Sqrt(ScrollCount));

  if csDesigning in ComponentState = false then
    EnableAlign;
  Ani.Start;
end;

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

constructor TUScrollBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  Common properties
  DoubleBuffered := true;
  BorderStyle := bsNone;

  //  Temp variables
  FIsScrolling := false;
  ScrollCount := 0;

  FScrollOrientation := oVertical;
  FShowScrollBar := false;
  FWaitEventTime := 50;

  FMaxScrollCount := 5;
  FLengthPerStep := 90;
  FTimePerStep := 120;

  //  Catch event timer
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.Interval := FWaitEventTime;
  FTimer.OnTimer := DoTimer;

  UpdateTheme;
end;

destructor TUScrollBox.Destroy;
begin
  UninitializeFlatSB(Handle);

  FTimer.Free;

  inherited Destroy;
end;

procedure TUScrollBox.AfterContrusction;
begin
  InitializeFlatSB(Handle);
end;

{ MESSAGES }

procedure TUScrollBox.WM_MouseWheel(var Msg: TWMMouseWheel);
begin
  inherited;

  WheelDelta := Msg.WheelDelta;

  if ScrollCount = 0 then
    //  Begin get scroll event
    begin
      FIsScrolling := true;
      ScrollCount := 1;

      FTimer.Interval := WaitEventTime;
      FTimer.Enabled := true;
    end
  else
    //  Continue get scroll event count
    ScrollCount := ScrollCount + 1;
end;

procedure TUScrollBox.WM_Paint(var Msg: TWMPaint);
begin
  //  Hide scrollbar after construction
  inherited;
  if ShowScrollBar = false then
    HideScrollBar;
end;

procedure TUScrollBox.WM_Size(var Msg: TWMSize);
begin
  inherited;
  if ShowScrollBar = false then
    HideScrollBar;
end;

end.
