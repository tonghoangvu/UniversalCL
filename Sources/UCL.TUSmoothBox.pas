unit UCL.TUSmoothBox;

interface

uses
  UCL.IntAnimation,
  UCL.Classes, UCL.Utils, UCL.TUThemeManager,
  Classes, Types,
  Windows, Messages, FlatSB,
  Controls, StdCtrls, Forms, Dialogs, ExtCtrls, Graphics;

type
  TUScrollBarStyle = (sbsMini, sbsFull, sbsNo);

  TUMiniScrollBar = class(TPanel)
    private
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    public
      constructor Create(aOwner: TComponent); override;

    published
      property Visible default false;
  end;

  TUSmoothBox = class(TScrollBox, IUThemeComponent)
    private
      var MiniSB: TUMiniScrollBar;
      var MINI_SB_THICKNESS: Byte;
      var MINI_SB_MARGIN: Byte;
      var MINI_SB_COLOR: TColor;
      var MouseLeave: Boolean;
  
      FThemeManager: TUThemeManager;

      FScrollCount: Integer;
      FScrollOrientation: TUOrientation;      
      FScrollBarStyle: TUScrollBarStyle;
      FTimePerStep: Integer;
      FLengthPerStep: Integer;
      FMaxScrollCount: Integer;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_Size(var Msg: TWMSize); message WM_SIZE;
      procedure CM_MouseWheel(var Msg: TCMMouseWheel); message CM_MOUSEWHEEL;
      procedure CM_MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CM_MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND}); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

      procedure SetOldSBVisible(IsVisible: Boolean);
      procedure UpdateMiniSB;
      procedure SetMiniSBVisible(IsVisible: Boolean);

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property ScrollCount: Integer read FScrollCount;
      property ScrollOrientation: TUOrientation read FScrollOrientation write FScrollOrientation default oVertical;
      property ScrollBarStyle: TUScrollBarStyle read FScrollBarStyle write FScrollBarStyle default sbsMini;
      property TimePerStep: Integer read FTimePerStep write FTimePerStep default 120;
      property LengthPerStep: Integer read FLengthPerStep write FLengthPerStep default 6;
      property MaxScrollCount: Integer read FMaxScrollCount write FMaxScrollCount default 5;
  end;

implementation

uses
  SysUtils;

{ TUSmoothBox }

//  THEME

procedure TUSmoothBox.SetThemeManager(const Value: TUThemeManager);
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

procedure TUSmoothBox.UpdateTheme;
begin
  //  Background color
  if ThemeManager = nil then
    Color := $E6E6E6
  else if ThemeManager.Theme = utLight then
    Color := $E6E6E6
  else
    Color := $1F1F1F;
end;

procedure TUSmoothBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  MAIN CLASS

constructor TUSmoothBox.Create(aOwner: TComponent);
begin
  inherited;

  MouseLeave := true;
  
  BorderStyle := bsNone;
  VertScrollBar.Tracking := true;
  HorzScrollBar.Tracking := true;
  
  FScrollCount := 0;
  FScrollOrientation := oVertical;
  FScrollBarStyle := sbsMini;
  FTimePerStep := 120;
  FLengthPerStep := 6;
  FMaxScrollCount := 5;
  
  MINI_SB_THICKNESS := 2;
  MINI_SB_MARGIN := 3;
  MINI_SB_COLOR := $7A7A7A;

  MiniSB := TUMiniScrollBar.Create(Self);
  MiniSB.Color := MINI_SB_COLOR;
  MiniSB.Parent := Self;
  MiniSB.SetSubComponent(true);
  MiniSB.Visible := false;
  MiniSB.Width := 0;
end;

destructor TUSmoothBox.Destroy;
begin
  MiniSB.Free;
  inherited;
end;

//  CUSTOM METHODS

procedure TUSmoothBox.ChangeScale(M, D: Integer{$IF CompilerVersion > 29}; isDpiChange: Boolean{$IFEND});
begin
  inherited;
  MINI_SB_THICKNESS := MulDiv(MINI_SB_THICKNESS, M, D);
  MINI_SB_MARGIN := MulDiv(MINI_SB_MARGIN, M, D);
  FLengthPerStep := MulDiv(FLengthPerStep, M, D);
end;

//  UTILS

procedure TUSmoothBox.SetOldSBVisible(IsVisible: Boolean);
begin
  if not (csDesigning in ComponentState) then
    FlatSB_ShowScrollBar(Handle, SB_BOTH, IsVisible);
end;

procedure TUSmoothBox.UpdateMiniSB;
var
  SB: TControlScrollBar;
  ControlSize: Integer;
  ThumbPos, ThumbSize: Integer;
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

  if (SB.Range = 0) or (SB.Range < ControlSize) then
    begin
      MiniSB.Visible := false;
      exit;
    end;

  ThumbSize := Round(ControlSize * ControlSize / SB.Range);
  ThumbPos := Round(ControlSize * SB.Position / SB.Range);

  if ScrollOrientation = oVertical then
    MiniSB.SetBounds(Width - MINI_SB_MARGIN - MINI_SB_THICKNESS, ThumbPos, MINI_SB_THICKNESS, ThumbSize)
  else 
    MiniSB.SetBounds(ThumbPos, Height - MINI_SB_MARGIN - MINI_SB_THICKNESS, ThumbSize, MINI_SB_THICKNESS);
end;

procedure TUSmoothBox.SetMiniSBVisible(IsVisible: Boolean);
begin
  MiniSB.Visible := IsVisible;
  if IsVisible then
    begin
      UpdateMiniSB;
      MiniSB.BringToFront;
    end;
end;

//  MESSAGES

procedure TUSmoothBox.WM_Size(var Msg: TWMSize);
begin
  inherited;
  if ScrollBarStyle <> sbsFull then
    SetOldSBVisible(false);
end;

procedure TUSmoothBox.CM_MouseEnter(var Msg: TMessage);
begin
  if Win32MajorVersion <> 10 then
    SetFocus;

  if
    (MouseLeave) and
    (PtInRect(GetClientRect, ScreenToClient(Mouse.CursorPos)))
  then
    begin
      if ScrollBarStyle <> sbsFull then
        SetOldSBVisible(false);
      if ScrollBarStyle = sbsMini then
        SetMiniSBVisible(true);
    end;

  inherited;
end;

procedure TUSmoothBox.CM_MouseLeave(var Msg: TMessage);
begin
  if ScrollBarStyle = sbsMini then
    if not PtInRect(GetClientRect, ScreenToClient(Mouse.CursorPos)) then
      begin
        MouseLeave := true;
        SetMiniSBVisible(false);
      end;

  inherited;
end;

procedure TUSmoothBox.CM_MouseWheel(var Msg: TCMMouseWheel);
var
  SB: TControlScrollBar;
  Ani: TIntAni;
  Sign: Integer;
begin
  inherited;

  if not PtInRect(GetClientRect, ScreenToClient(Mouse.CursorPos)) then
    exit;

  if ScrollOrientation = oVertical then
    SB := VertScrollBar
  else 
    SB := HorzScrollBar;
  
  //  Scroll by touchpad
  if Abs(Msg.WheelDelta) < 100 then
    begin
      DisableAlign;
      SB.Position := SB.Position - Msg.WheelDelta;
      if ScrollBarStyle = sbsMini then
        UpdateMiniSB;
      EnableAlign;
    end

  //  Scroll by mouse
  else
    begin
      if FScrollCount = MaxScrollCount then exit;

      if FScrollCount = 0 then
        DisableAlign;

      inc(FScrollCount);
      Sign := Msg.WheelDelta div Abs(Msg.WheelDelta);

      Ani := TIntAni.Create(true, akOut, afkQuartic, 1, +LengthPerStep, nil);
      if ScrollBarStyle = sbsMini then
        Ani.OnSync :=
          procedure (V: Integer)
          begin
            SB.Position := SB.Position - V * Sign;
            UpdateMiniSB;
          end
      else
        Ani.OnSync :=
          procedure (V: Integer)
          begin
            SB.Position := SB.Position - V * Sign;
          end;

      Ani.OnDone :=
        procedure
        begin
          if ScrollBarStyle <> sbsFull then
            SetOldSBVisible(false);
          dec(FScrollCount);
          if FScrollCount = 0 then
            EnableAlign;
        end;

      Ani.Step := LengthPerStep;
      Ani.Duration := TimePerStep;
      Ani.Start;
    end;
end;

{ TUMiniScrollBar }

constructor TUMiniScrollBar.Create(aOwner: TComponent);
begin
  inherited;

{$IF CompilerVersion > 29}
  StyleElements :=[];
{$IFEND}
  BevelOuter := bvNone;
  FullRepaint := false;
  DoubleBuffered := true;

  Visible := false;
end;

procedure TUMiniScrollBar.WM_NCHitTest(var Msg: TWMNCHitTest);
begin
  Msg.Result := HTTRANSPARENT;
end;

end.
