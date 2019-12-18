unit UCL.TUScrollBox;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation, UCL.Utils,
  System.Classes, System.TypInfo,
  Winapi.Windows, Winapi.Messages, Winapi.FlatSB,
  VCL.Controls, VCL.Forms, VCL.ExtCtrls, VCL.Graphics;

type
  TUScrollBarStyle = (sbsMini, sbsFull, sbsNo);

  TUScrollBox = class(TScrollBox, IUThemeComponent)
    private
      var MINI_SCROLLBAR_THICKNESS: Byte;
      var MINI_SCROLLBAR_MARGIN: Byte;
      var MINI_SCROLLBAR_COLOR: TColor;
      var ScrollCount: Integer;
      var WheelDelta: SmallInt;
      var MiniSBRect: TRect;

      FThemeManager: TUThemeManager;
      FTimer: TTimer;
      FCanvas: TCanvas;

      FIsScrolling: Boolean;
      FScrollBarStyle: TUScrollBarStyle;
      FScrollOrientation: TUOrientation;
      FWaitEventTime: Cardinal;
      FMaxScrollCount: Integer;
      FLengthPerStep: Cardinal;
      FTimePerStep: Cardinal;

      procedure DoTimer(Sender: TObject);

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_Size(var Msg: TWMSize); message WM_SIZE;
      procedure WM_MouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Loaded; override;

      procedure UpdateTheme;

      procedure PaintMiniSB;
      procedure ClearMiniSB;
      procedure SetOldSBVisible(IsVisible: Boolean);

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property IsScrolling: Boolean read FIsScrolling;
      property ScrollBarStyle: TUScrollBarStyle read FScrollBarStyle write FScrollBarStyle default sbsMini;
      property ScrollOrientation: TUOrientation read FScrollOrientation write FScrollOrientation default oVertical;
      property WaitEventTime: Cardinal read FWaitEventTime write FWaitEventTime default 50;
      property MaxScrollCount: Integer read FMaxScrollCount write FMaxScrollCount default 5;
      property LengthPerStep: Cardinal read FLengthPerStep write FLengthPerStep default 90;
      property TimePerStep: Cardinal read FTimePerStep write FTimePerStep default 120;
  end;

implementation

{ TUScrollBox }

//  UTILS

procedure TUScrollBox.DoTimer(Sender: TObject);
var
  SB: TControlScrollBar;
  Start, Stop, Length: Integer;
  ControlSize: Integer;
  Ani: TIntAni;
begin
  FTimer.Enabled := false;  //  Stop getting scroll event

  if ScrollOrientation = oVertical then
    begin
      SB := VertScrollBar;
      ControlSize := Height;
    end
  else
    begin
      SB := HorzScrollBar;
      ControlSize := Width;
    end;

  //  Limit scrolL count
  if ScrollCount > MaxScrollCount then
    ScrollCount := MaxScrollCount;

  Length := - LengthPerStep * ScrollCount * (WheelDelta div Abs(WheelDelta));
  Start := SB.Position;
  Stop := Start + Length;

  //  Keep Stop in range
  if Stop < 0 then
    Stop := 0
  else if Stop > SB.Range - ControlSize then
    Stop := SB.Range - ControlSize;

  //  Recalc ani length
  Length := Abs(Stop - Start);
  ScrollCount := Round(Length / LengthPerStep); //  No limit needed, because Length2 always <= Length1
  if ScrollCount = 0 then
    ScrollCount := 1;

  if not (csDesigning in ComponentState) then
    DisableAlign;

  Ani := TIntAni.Create(true, akOut, afkQuartic, Start, Stop - Start, nil);
  if ScrollBarStyle = sbsMini then
    Ani.OnSync := procedure (V: Integer)
      begin
        ClearMiniSB;
        SB.Position := V;
        PaintMiniSB;
      end
  else
    Ani.OnSync := procedure (V: Integer)
      begin
        SB.Position := V;
      end;

  Ani.OnDone := procedure
    begin
      ScrollCount := 0;
      FIsScrolling := false;
      if ScrollBarStyle <> sbsFull then
        SetOldSBVisible(false);
      if not (csDesigning in ComponentState) then
        EnableAlign;
    end;

  Ani.Duration := Round(TimePerStep * Sqrt(ScrollCount));
  Ani.Step := Ani.Duration div 12;
  Ani.Start;
end;

procedure TUScrollBox.PaintMiniSB;
var
  SB: TControlScrollBar;
  ControlSize: Integer;
  ThumbSize, ThumbPos: Integer;
begin
  //  Get orientation values
  if ScrollOrientation = oVertical then
    begin
      SB := VertScrollBar;
      ControlSize := Height;
    end
  else
    begin
      SB := HorzScrollBar;
      ControlSize := Width;
    end;

  //  Check scrollable
  if (SB.Range = 0) or (SB.Range < ControlSize) then exit;

  //  Calc mini scroll bar size
  ThumbSize := Round(ControlSize * ControlSize / SB.Range);
  ThumbPos := Round(ControlSize * SB.Position / SB.Range);

  //  Calc mini scroll bar rect
  if ScrollOrientation = oVertical then
    begin
      MiniSBRect.Left := Width - MINI_SCROLLBAR_MARGIN - MINI_SCROLLBAR_THICKNESS ;
      MiniSBRect.Right := Width - MINI_SCROLLBAR_MARGIN;
      MiniSBRect.Top := ThumbPos;
      MiniSBRect.Bottom := ThumbPos + ThumbSize;
    end
  else
    begin
      MiniSBRect.Top := Height - MINI_SCROLLBAR_MARGIN - MINI_SCROLLBAR_THICKNESS ;
      MiniSBRect.Bottom := Height - MINI_SCROLLBAR_MARGIN;
      MiniSBRect.Left := ThumbPos;
      MiniSBRect.Right := ThumbPos + ThumbSize;
    end;

  //  Paint mini scroll bar
  FCanvas.Brush.Handle := CreateSolidBrushWithAlpha(MINI_SCROLLBAR_COLOR, 255);
  FCanvas.FillRect(MiniSBRect);
end;

procedure TUScrollBox.ClearMiniSB;
begin
  FCanvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
  FCanvas.FillRect(MiniSBRect);
end;

procedure TUScrollBox.SetOldSBVisible(IsVisible: Boolean);
begin
  if not (csDesigning in ComponentState) then
    FlatSB_ShowScrollBar(Handle, SB_BOTH, IsVisible);
end;

//  THEME

procedure TUScrollBox.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      if Value <> nil then
        begin
          Value.Connect(Self);
          Value.FreeNotification(Self);
        end;

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUScrollBox.UpdateTheme;
begin
  //  Background color
  if ThemeManager = nil then
    Color := $E6E6E6
  else if ThemeManager.Theme = utLight then
    Color := $E6E6E6
  else
    Color := $1F1F1F;
end;

procedure TUScrollBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  MAIN CLASS

constructor TUScrollBox.Create(aOwner: TComponent);
begin
  inherited;

  MINI_SCROLLBAR_THICKNESS := 2;
  MINI_SCROLLBAR_MARGIN := 3;
  MINI_SCROLLBAR_COLOR := $7A7A7A;
  ScrollCount := 0;
  WheelDelta := 0;

  FIsScrolling := false;
  FScrollOrientation := oVertical;
  FScrollBarStyle :=sbsMini;
  FWaitEventTime := 50;
  FMaxScrollCount := 6;
  FLengthPerStep := 90;
  FTimePerStep := 120;

  BorderStyle := bsNone;
  DoubleBuffered := true;

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
  inherited;
end;

procedure TUScrollBox.Loaded;
begin
  inherited;
  FCanvas.Handle := GetDC(Handle);
end;

//  CUSTOM METHODS

procedure TUScrollBox.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  MINI_SCROLLBAR_THICKNESS := MulDiv(MINI_SCROLLBAR_THICKNESS, M, D);
  MINI_SCROLLBAR_MARGIN := MulDiv(MINI_SCROLLBAR_MARGIN, M, D);
  LengthPerStep := MulDiv(LengthPerStep, M, D);
end;

//  MESSAGES

procedure TUScrollBox.WM_Size(var Msg: TWMSize);
begin
  inherited;
  if ScrollBarStyle <> sbsFull then
    SetOldSBVisible(false);
end;

procedure TUScrollBox.WM_MouseWheel(var Msg: TWMMouseWheel);
begin
  inherited;

  if not PtInRect(GetClientRect, ScreenToClient(Mouse.CursorPos)) then
    exit;

  WheelDelta := Msg.WheelDelta;
  if ScrollCount = 0 then
    //  Begin getting scroll
    begin
      ScrollCount := 1;
      FIsScrolling := true;

      FTimer.Interval := WaitEventTime;
      FTimer.Enabled := true;
    end
  else
    //  Continue getting scroll messages
    Inc(ScrollCount);
end;

procedure TUScrollBox.CM_MouseEnter(var Msg: TMessage);
begin
  inherited;
  if ScrollBarStyle = sbsMini then
    PaintMiniSB;
end;

procedure TUScrollBox.CM_MouseLeave(var Msg: TMessage);
begin
  if ScrollBarStyle = sbsMini then
    ClearMiniSB;
end;

end.
