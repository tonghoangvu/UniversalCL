unit UCL.TUScrollBox;

interface

uses
  FlatSB,
  UCL.Classes, UCL.TUThemeManager, UCL.IntAnimation,
  System.Classes, System.SysUtils,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.Forms, VCL.Dialogs;

type
  TUScrollBox = class(TScrollBox, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FIsScrolling: Boolean;
      FScrollLength: Integer;
      FScrollTime: Integer;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

      //  Messages
      procedure WM_MouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
      procedure WM_Paint(var Msg: TWMPaint); message WM_PAINT;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; reintroduce;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property IsScrolling: Boolean read FIsScrolling;
      property ScrollLength: Integer read FScrollLength write FScrollLength default 320;
      property ScrollTime: Integer read FScrollTime write FScrollTime default 300;
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
  FlatSB_ShowScrollBar(Handle, SB_BOTH, false);
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

  DoubleBuffered := true;
  BorderStyle := bsNone;

  FIsScrolling := false;

  FScrollLength := 320;
  FScrollTime := 300;

  InitializeFlatSB(Handle);
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
begin
  inherited;

  if FIsScrolling = true then
    exit
  else
    FIsScrolling := true;

  DisableAlign;

  Ani := TIntAni.Create(akOut, afkQuartic,
    VertScrollBar.Position, VertScrollBar.Position - ScrollLength * Msg.WheelDelta div Abs(Msg.WheelDelta),
    procedure (Value: Integer)
    begin
      VertScrollBar.Position := Value;
    end, true);

  Ani.AniDoneProc :=
    procedure
    begin
      FIsScrolling := false;
      FlatSB_ShowScrollBar(Handle, SB_BOTH, false);
      EnableAlign;
    end;

  Ani.Duration := ScrollTime;
  Ani.Start;
end;

procedure TUScrollBox.WM_Paint(var Msg: TWMPaint);
begin
  //  Hide scrollbar after construction
  FlatSB_ShowScrollBar(Handle, SB_BOTH, false);
  inherited;
end;

end.
