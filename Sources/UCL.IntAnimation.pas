unit UCL.IntAnimation;

interface

uses
  Classes
  {$IF CompilerVersion > 29}
  , Threading
  {$ENDIF}
  ;

type
  TAniSyncProc = reference to procedure (V: Integer);
  TAniDoneProc = reference to procedure;
  TAniFunction = reference to function (P: Single): Single;

  TAniKind = (akIn, akOut, akInOut);

  TAniFunctionKind =
  (
    afkLinear, afkQuadratic, afkCubic, afkQuartic, afkQuintic,
    afkBack, afkBounce, afkExpo, afkSine, afkCircle
  );

  TIntAniSet = class(TPersistent)
    private
      FAniKind: TAniKind;
      FAniFunctionKind: TAniFunctionKind;
      FDelayStartTime: Cardinal;
      FDuration: Cardinal;
      FStep: Cardinal;
    public
      constructor Create;
      procedure Assign(Source: TPersistent); override;
      procedure QuickAssign(AniKind: TAniKind; AniFunctionKind: TAniFunctionKind;
        Delay, Duration, Step: Cardinal);
    published
      property AniKind: TAniKind read FAniKind write FAniKind default akOut;
      property AniFunctionKind: TAniFunctionKind read FAniFunctionKind write FAniFunctionKind default afkLinear;
      property DelayStartTime: Cardinal read FDelayStartTime write FDelayStartTime default 0;
      property Duration: Cardinal read FDuration write FDuration default 200;
      property Step: Cardinal read FStep write FStep default 20;
  end;

  TIntAni = class(TThread)
    var CurrentValue: Integer;

    private
      var AniFunction: TAniFunction;

      FOnSync: TAniSyncProc;
      FOnDone: TAniDoneProc;
      FAniSet: TIntAniSet;
      FStartValue: Integer;
      FDeltaValue: Integer;

      function UpdateFunction: Boolean;
      procedure UpdateControl;
      procedure DoneControl;

    protected
      procedure Execute; override;

    public
      constructor Create(aStartValue, aDeltaValue: Integer;
        aSyncProc: TAniSyncProc; aDoneProc: TAniDoneProc);
      destructor Destroy; override;

      //  Events
      property OnSync: TAniSyncProc read FOnSync write FOnSync;
      property OnDone: TAniDoneProc read FOnDone write FOnDone;

      //  Properties
      property AniSet: TIntAniSet read FAniSet write FAniSet;
      property StartValue: Integer read FStartValue write FStartValue default 0;
      property DeltaValue: Integer read FDeltaValue write FDeltaValue default 0;
  end;

implementation

uses
  SysUtils,
  Math,
  UCL.IntAnimation.Collection;

{ SPECIAL }

function TIntAni.UpdateFunction: Boolean;
begin
  Result := true;
  case AniSet.AniKind of
    akIn:
      case AniSet.AniFunctionKind of
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
      case AniSet.AniFunctionKind of
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
      case AniSet.AniFunctionKind of
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

constructor TIntAni.Create(aStartValue: Integer; aDeltaValue: Integer;
  aSyncProc: TAniSyncProc; aDoneProc: TAniDoneProc);
begin
  inherited Create(True);
  FreeOnTerminate := true;

  //  Internal
  CurrentValue := 0;
  AniFunction := nil;

  //  AniSet
  FAniSet := TIntAniSet.Create;
  FAniSet.QuickAssign(akOut, afkLinear, 0, 200, 20);

  //  Fields
  FStartValue := aStartValue;
  FDeltaValue := aDeltaValue;
  FOnSync := aSyncProc;
  FOnDone := aDoneProc;

  //  Finish
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

  d := AniSet.Duration;
  b := StartValue;
  c := DeltaValue;

  //  Delay start
  Sleep(AniSet.DelayStartTime);

  //  Calc step by FPS
  TimePerStep := Round(d / AniSet.Step);

  //  Run
  for i := 1 to AniSet.Step do
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

destructor TIntAni.Destroy;
begin
  FAniSet.Free;
  inherited;
end;

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

{ TIntAniSet }

procedure TIntAniSet.Assign(Source: TPersistent);
begin
  if Source is TIntAniSet then
    begin
      FAniKind := (Source as TIntAniSet).AniKind;
      FAniFunctionKind := (Source as TIntAniSet).AniFunctionKind;
      FDelayStartTime := (Source as TIntAniSet).DelayStartTime;
      FDuration := (Source as TIntAniSet).Duration;
      FStep := (Source as TIntAniSet).Step;
    end
  else
    inherited;
end;

constructor TIntAniSet.Create;
begin
  inherited Create;
  FAniKind := akOut;
  FAniFunctionKind := afkLinear;
  FDelayStartTime := 0;
  FDuration := 200;
  FStep := 20;
end;

procedure TIntAniSet.QuickAssign(AniKind: TAniKind; AniFunctionKind: TAniFunctionKind;
  Delay, Duration, Step: Cardinal);
begin
  FAniKind := AniKind;
  FAniFunctionKind := AniFunctionKind;
  FDelayStartTime := Delay;
  FDuration := Duration;
  FStep := Step;
end;

end.
