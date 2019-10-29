unit UCL.IntAnimation;

interface

uses
  System.Classes, System.Threading;

type
  TAniSyncProc = reference to procedure (V: Integer);
  TAniDoneProc = reference to procedure;  //  TProc

  TAniFunction = reference to function (P: Single): Single;

  TAniKind = (akIn, akOut, akInOut);
  TAniFunctionKind = (
    afkLinear, afkQuadratic, afkCubic, afkQuartic, afkQuintic,
    afkBack, afkBounce, afkExpo, afkSine, afkCircle
    );

  TIntAni = class(TThread)
    var CurrentValue: Integer;

    private
      var FStep: Byte;
      var AniFunction: TAniFunction;

      FOnSync: TAniSyncProc;
      FOnDone: TAniDoneProc;

      FAniKind: TAniKind;
      FAniFunctionKind: TAniFunctionKind;

      FDelayStartTime: Cardinal;
      FDuration: Cardinal;
      FStartValue: Integer;
      FDeltaValue: Integer;

      function UpdateFunction: Boolean;
      procedure UpdateControl;
      procedure DoneControl;

    protected
      procedure Execute; override;

    public
      constructor Create(
        FreeOnFinish: Boolean;
        aAniKind: TAniKind; aAniFunctionKind: TAniFunctionKind;
        aStartValue, aDeltaValue: Integer;
        aSyncProc: TAniSyncProc);

      //  Events
      property OnSync: TAniSyncProc read FOnSync write FOnSync;
      property OnDone: TAniDoneProc read FOnDone write FOnDone;

      //  Props
      property Step: Byte read FStep write FStep default 25;
      property AniKind: TAniKind read FAniKind write FAniKind default akIn;
      property AniFunctionKind: TAniFunctionKind read FAniFunctionKind write FAniFunctionKind default afkLinear;

      property DelayStartTime: Cardinal read FDelayStartTime write FDelayStartTime default 0;
      property Duration: Cardinal read FDuration write FDuration default 400;
      property StartValue: Integer read FStartValue write FStartValue default 0;
      property DeltaValue: Integer read FDeltaValue write FDeltaValue default 0;
  end;

implementation

uses
  System.Math,
  UCL.IntAnimation.Collection;

{ SPECIAL }

function TIntAni.UpdateFunction: Boolean;
begin
  Result := true;
  case AniKind of
    akIn:
      case AniFunctionKind of
        afkLinear:
          AniFunction := TIntAniCollection.Linear;
        afkQuadratic:
          AniFunction := TIntAniCollection.Quadratic_In;
        afkCubic:
          AniFunction := TIntAniCollection.Cubic_In;
        afkQuartic:
          AniFunction := TIntAniCollection.Quartic_In;
        afkQuintic:
          AniFunction := TIntAniCollection.Quintic_In;
        afkBack:
          AniFunction := TIntAniCollection.Back_In;
        afkBounce:
          AniFunction := TIntAniCollection.Bounce_In;
        afkExpo:
          AniFunction := TIntAniCollection.Expo_In;
        afkSine:
          AniFunction := TIntAniCollection.Sine_In;
        afkCircle:
          AniFunction := TIntAniCollection.Circle_In;
        else
          Result := false;
      end;

    akOut:
      case AniFunctionKind of
        afkLinear:
          AniFunction := TIntAniCollection.Linear;
        afkQuadratic:
          AniFunction := TIntAniCollection.Quadratic_Out;
        afkCubic:
          AniFunction := TIntAniCollection.Cubic_Out;
        afkQuartic:
          AniFunction := TIntAniCollection.Quartic_Out;
        afkQuintic:
          AniFunction := TIntAniCollection.Quintic_Out;
        afkBack:
          AniFunction := TIntAniCollection.Back_Out;
        afkBounce:
          AniFunction := TIntAniCollection.Bounce_Out;
        afkExpo:
          AniFunction := TIntAniCollection.Expo_Out;
        afkSine:
          AniFunction := TIntAniCollection.Sine_Out;
        afkCircle:
          AniFunction := TIntAniCollection.Circle_Out;
        else
          Result := false;
      end;

    akInOut:
      case AniFunctionKind of
        afkLinear:
          AniFunction := TIntAniCollection.Linear;
        afkQuadratic:
          AniFunction := TIntAniCollection.Quadratic_InOut;
        afkCubic:
          AniFunction := TIntAniCollection.Cubic_InOut;
        afkQuartic:
          AniFunction := TIntAniCollection.Quartic_InOut;
        afkQuintic:
          AniFunction := TIntAniCollection.Quintic_InOut;
        afkBack:
          AniFunction := TIntAniCollection.Back_InOut;
        afkBounce:
          AniFunction := TIntAniCollection.Bounce_InOut;
        afkExpo:
          AniFunction := TIntAniCollection.Expo_InOut;
        afkSine:
          AniFunction := TIntAniCollection.Sine_InOut;
        afkCircle:
          AniFunction := TIntAniCollection.Circle_InOut;
        else
          Result := false;
      end;

    else
      Result := false;
  end;
end;

{ MAIN CLASS }

constructor TIntAni.Create(
  FreeOnFinish: Boolean;
  aAniKind: TAniKind; aAniFunctionKind: TAniFunctionKind;
  aStartValue, aDeltaValue: Integer;
  aSyncProc: TAniSyncProc);
begin
  inherited Create(True);

  //  Internal
  CurrentValue := 0;
  AniFunction := nil;

  //  New props
  FStep := 25;
  FAniKind := aAniKind;
  FAniFunctionKind := aAniFunctionKind;

  FDelayStartTime := 0;
  FDuration := 400;
  FStartValue := aStartValue;
  FDeltaValue := aDeltaValue;

  FOnDone := nil;
  FOnSync := aSyncProc;

  //  Old props
  FreeOnTerminate := FreeOnFinish;

  UpdateFunction;
end;

procedure TIntAni.Execute;
var
  i: Cardinal;
  t, d, TimePerStep: Cardinal;
  b, c: Integer;
begin
  if UpdateFunction = false then exit;
    ///  Update easing function
    ///  Depend on AniKind (In, Out,...) and AniFunctionKind (Linear,...)
    ///  If Result = false (error found), then exit

  d := Duration;
  b := StartValue;
  c := DeltaValue;

  //  Delay start
  Sleep(DelayStartTime);

  //  Calc step by FPS
  TimePerStep := Round(d / Step);

  //  Run
  for i := 1 to Step do
    begin
      t := i * TimePerStep;
      CurrentValue := b + Round(c * AniFunction(t / d));
      Synchronize(UpdateControl);
      Sleep(TimePerStep);
    end;

  //  Finish
  Synchronize(UpdateControl);
  Synchronize(DoneControl);
end;

{ PROCS }

procedure TIntAni.DoneControl;
begin
  if Assigned(FOnDone) then
    FOnDone();
end;

procedure TIntAni.UpdateControl;
begin
  if Assigned(FOnSync) then
    FOnSync(CurrentValue);
end;

end.
