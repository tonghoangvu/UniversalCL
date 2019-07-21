unit UCL.TUScrollBox;

interface

uses
  FlatSB,
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation,
  System.Classes, System.SysUtils, System.TypInfo,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Forms, VCL.ExtCtrls, VCL.Graphics;

type
  TUScrollBarStyle = (sbsMini, sbsFull, sbsNo);

  TUScrollBox = class(TScrollBox, IUThemeControl)
    private
      //  Temp variables
      var ScrollCount: Integer;
      var WheelDelta: SmallInt;

      //  Object fields
      FThemeManager: TUThemeManager;
      FTimer: TTimer;
      FCanvas: TCanvas;

      //  Read-only
      FIsScrolling: Boolean;

      FScrollBarStyle: TUScrollBarStyle;
      FScrollOrientation: TUOrientation;
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
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Loaded; override;

      procedure UpdateTheme;
      procedure ShowOldScrollBar;
      procedure HideOldScrollBar;
      procedure ShowMiniScrollbar;
      procedure HideMiniScrollbar;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property IsScrolling: Boolean read FIsScrolling;

      property ScrollBarStyle: TUScrollBarStyle read FScrollBarStyle write FScrollBarStyle default sbsMini;
      property ScrollOrientation: TUOrientation read FScrollOrientation write FScrollOrientation default oVertical;
      property WaitEventTime: Integer read FWaitEventTime write FWaitEventTime default 50;

      property MaxScrollCount: Integer read FMaxScrollCount write FMaxScrollCount default 5;
      property LengthPerStep: Integer read FLengthPerStep write FLengthPerStep default 90;
      property TimePerStep: Integer read FTimePerStep write FTimePerStep default 120;
  end;

implementation

procedure TUScrollBox.ShowOldScrollBar;
begin
  if csDesigning in ComponentState = false then
    FlatSB_ShowScrollBar(Handle, SB_BOTH, true);  
end;

procedure TUScrollBox.HideOldScrollBar;
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
  FTimer.Enabled := false;  //  Disabled timer
  FIsScrolling := true;

  //  Get scrollbar
  if ScrollOrientation = oVertical then
    aScrollBar := VertScrollBar
  else
    aScrollBar := HorzScrollBar;

  Start := aScrollBar.Position;
  Stop := aScrollBar.Position - LengthPerStep * ScrollCount * (WheelDelta div Abs(WheelDelta));

  //  Scroll out of range
  if Stop < 0 then
    Stop := 0 //  Top
  else if Stop > aScrollBar.Range - Height then
    Stop := aScrollBar.Range - Height;  //  Bottom

  //  Reduce ScrollCount when scroll out of range
  Length := Abs(Stop - Start);
  ScrollCount := Round(Length / LengthPerStep);

  //  Limit ScrollCount
  if ScrollCount > MaxScrollCount then
    ScrollCount := MaxScrollCount;

  Ani := TIntAni.Create(akOut, afkQuartic, Start, Stop, nil, true);

  if ScrollBarStyle = sbsMini then
    Ani.OnSync := procedure (Value: Integer)
      begin
        aScrollBar.Position := Value;
        HideMiniScrollbar;
        ShowMiniScrollbar;
      end
  else
    Ani.OnSync := procedure (Value: Integer)
      begin
        aScrollBar.Position := Value;
      end;

  Ani.OnDone :=
    procedure
    begin
      ScrollCount := 0;
      FIsScrolling := false;
      if ScrollBarStyle <> sbsFull then
        HideOldScrollBar;
      EnableAlign;
    end;

  Ani.Step := 23;
  Ani.Duration := Round(TimePerStep * Sqrt(ScrollCount));

  if csDesigning in ComponentState = false then
    DisableAlign;
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
  BorderStyle := bsNone;
  DoubleBuffered := true;

  //  Temp variables
  FIsScrolling := false;
  ScrollCount := 0;

  FScrollBarStyle := sbsMini;
  FScrollOrientation := oVertical;
  FWaitEventTime := 50;

  FMaxScrollCount := 5;
  FLengthPerStep := 90;
  FTimePerStep := 120;

  //  Catch event timer
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.Interval := FWaitEventTime;
  FTimer.OnTimer := DoTimer;

  FCanvas := TCanvas.Create;

  UpdateTheme;
end;

destructor TUScrollBox.Destroy;
begin
  FTimer.Free;
  FCanvas.Free;

  inherited Destroy;
end;

procedure TUScrollBox.Loaded;
begin
  FCanvas.Handle := GetDC(Handle);
end;

procedure TUScrollBox.ShowMiniScrollbar;
const
  MINI_SCROLLBAR_THICKNESS = 2;
  MINI_SCROLLBAR_COLOR = $7A7A7A;
var
  R: TRect;
  ScrollBar: TControlScrollBar;
  ControlSize: Integer;
  ThumbSize, ThumbPos: Integer;
begin
  if ScrollOrientation = oVertical then
    begin
      Scrollbar := VertScrollBar;
      ControlSize := Height;
    end
  else
    begin
      Scrollbar := HorzScrollBar;
      ControlSize := Width;
    end;
  
  if ScrollBar.Range = 0 then exit;
  
  ThumbSize := Round(ControlSize * ControlSize / Scrollbar.Range);
  ThumbPos := Round(ControlSize * ScrollBar.Position / ScrollBar.Range);

  FCanvas.Brush.Color := MINI_SCROLLBAR_COLOR;

  if ScrollOrientation = oVertical then
    begin
      R.Left := Width - 5;
      R.Right := R.Left + MINI_SCROLLBAR_THICKNESS;
      R.Top := ThumbPos;
      R.Bottom := R.Top + ThumbSize;
    end
  else 
    begin
      R.Top := Height - 5;
      R.Bottom := R.Top + MINI_SCROLLBAR_THICKNESS;
      R.Left := ThumbPos;
      R.Right := R.Left + ThumbSize;
    end;

  FCanvas.FillRect(R);
end;

procedure TUScrollBox.HideMiniScrollbar;
begin
  FCanvas.Brush.Color := Color;
  if ScrollOrientation = oVertical then
    FCanvas.FillRect(Rect(Width - 5, 0, Width, Height))
  else 
    FCanvas.FillRect(Rect(0, Height - 5, Width, Height));
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
  if ScrollBarStyle <> sbsFull then
    HideOldScrollBar;
end;

procedure TUScrollBox.WM_Size(var Msg: TWMSize);
begin
  inherited;
  if ScrollBarStyle <> sbsFull then
    HideOldScrollBar;
end;

procedure TUScrollBox.CM_MouseEnter(var Msg: TMessage);
begin
  if ScrollBarStyle = sbsMini then
    ShowMiniScrollbar;
  inherited;
end;

procedure TUScrollBox.CM_MouseLeave(var Msg: TMessage);
begin
  if ScrollBarStyle = sbsMini then
    HideMiniScrollbar;
  inherited;
end;

end.
