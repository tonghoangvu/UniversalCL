unit UCL.IntAnimation;

interface

uses
  System.Classes, System.Threading, System.SysUtils;

type
  TAniSyncProc = reference to procedure (Value: Integer);
  TAniFunction = reference to function (Value: Integer): Int64;

  TAniKind = (akIn, akOut);
  TAniFunctionKind = (afkCustom, afkLinear, afkQuadratic, afkCubic, afkQuartic, afkQuintic);

  TIntAni = class(TThread)
    private
      FAniFunction: TAniFunction;
      FOnSync: TAniSyncProc;
      FOnDone: TProc;

      FAniKind: TAniKind;
      FAniFunctionKind: TAniFunctionKind;

      FStep: Integer;
      FDelayStart: Integer;
      FDuration: Integer;
      FStartValue: Integer;
      FStopValue: Integer;

      //  Temp
      FCurrent: Integer;

      //  Setters
      procedure SetAniFunctionKind(const Value: TAniFunctionKind);

      procedure SetOnDone(const Value: TProc);

      procedure UpdateControl;
      procedure DoneControl;

    protected
      procedure Execute; override;

    public
      constructor Create(
        aAniKind: TAniKind; aFunctionKind: TAniFunctionKind;
        aStartValue, aStopValue: Integer;
        aSyncProc: TAniSyncProc;
        FreeOnFinish: Boolean = false);

      property AniFunction: TAniFunction read FAniFunction write FAniFunction;
      property OnSync: TAniSyncProc read FOnSync write FOnSync;
      property OnDone: TProc read FOnDone write SetOnDone;

      class function afLinear(Value: Integer): Int64;
      class function afQuadratic(Value: Integer): Int64;
      class function afCubic(Value: Integer): Int64;
      class function afQuartic(Value: Integer): Int64;
      class function afQuintic(Value: Integer): Int64;

    //published   //  This causes RTTI (Slow)
      property AniKind: TAniKind read FAniKind write FAniKind default akOut;  //  I like it
      property AniFunctionKind: TAniFunctionKind read FAniFunctionKind write SetAniFunctionKind default afkLinear;

      property Step: Integer read FStep write FStep default 25;
      property DelayStart: Integer read FDelayStart write FDelayStart default 0;
      property Duration: Integer read FDuration write FDuration default 250;
      property StartValue: Integer read FStartValue write FStartValue default 0;
      property StopValue: Integer read FStopValue write FStopValue default 0;
  end;

implementation

{ SETTERS }

procedure TIntAni.SetAniFunctionKind(const Value: TAniFunctionKind);
begin
  if FAniFunctionKind <> Value then
    begin
      FAniFunctionKind := Value;
      case Value of
        afkCustom: ;
        afkLinear: 
          FAniFunction := afLinear;
        afkQuadratic: 
          FAniFunction := afQuadratic;
        afkCubic: 
          FAniFunction := afCubic;
        afkQuartic: 
          FAniFunction := afQuartic;
        afkQuintic: 
          FAniFunction := afQuintic;
      end;
    end;
end;

procedure TIntAni.SetOnDone(const Value: TProc);
begin
  FOnDone := Value;
end;

{ MAIN CLASS }

constructor TIntAni.Create(
  aAniKind: TAniKind; aFunctionKind: TAniFunctionKind;
  aStartValue, aStopValue: Integer;
  aSyncProc: TAniSyncProc;
  FreeOnFinish: Boolean);
begin
  inherited Create(true);

  FreeOnTerminate := FreeOnFinish;

  FOnDone := nil;

  //  Default properties
  FStep := 25;
  FDelayStart := 0;
  FDuration := 250;
  FStartValue := aStartValue;
  FStopValue := aStopValue;

  //  Params properties
  AniKind := aAniKind;
  AniFunctionKind := aFunctionKind;
  OnSync := aSyncProc;
end;

procedure TIntAni.Execute;
var 
  AniLength: Integer;
  TimePerStep: Integer;
  Max: Int64;
  Part: Single;
  BaseInverse: ShortInt;

  i: Integer;
begin
  AniLength := Abs(StopValue - StartValue);
  TimePerStep := Round(Duration / Step);
  Max := AniFunction(Step);
  Part := AniLength / Max;

  if StartValue < StopValue then
    BaseInverse := 1
  else
    BaseInverse := -1;

  //  Delay start
  Sleep(DelayStart);

  //  Loop
  if AniKind = akIn then
    for i := 1 to Step do
      begin
        FCurrent := StartValue + BaseInverse * Round(AniFunction(i) * Part);
        Synchronize(UpdateControl);
        Sleep(TimePerStep);
      end
  else
    for i := 1 to Step do
      begin
        FCurrent := StartValue + BaseInverse * (AniLength - Round(AniFunction(Step + 1 - i) * Part));
        Synchronize(UpdateControl);
        Sleep(TimePerStep);
      end;

  FCurrent := StopValue;
  Synchronize(UpdateControl);
  Synchronize(DoneControl);
end;

procedure TIntAni.UpdateControl;
begin
  if Assigned(FOnSync) then
    FOnSync(FCurrent);
end;

procedure TIntAni.DoneControl;
begin
  if Assigned(FOnDone) then
    FOnDone();
end;

{ SOME EASING FUNCTION }

class function TIntAni.afCubic(Value: Integer): Int64;
begin
  Result := Value;
end;

class function TIntAni.afLinear(Value: Integer): Int64;
begin
  Result := Value * Value;
end;

class function TIntAni.afQuadratic(Value: Integer): Int64;
begin
  Result := Value * Value * Value;
end;

class function TIntAni.afQuartic(Value: Integer): Int64;
begin
  Result := Value * Value * Value * Value;
end;

class function TIntAni.afQuintic(Value: Integer): Int64;
begin
  Result := Value * Value * Value * Value * Value;
end;

end.
