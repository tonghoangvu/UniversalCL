unit UCL.IntAnimation.Collection;

interface

type
  TIntAniCollection = class
    //  Linear
    class function Linear(P: Single): Single; inline;

    //  Quadratic
    class function Quadratic_In(P: Single): Single; inline;
    class function Quadratic_Out(P: Single): Single; inline;
    class function Quadratic_InOut(P: Single): Single; inline;

    //  Cubic
    class function Cubic_In(P: Single): Single; inline;
    class function Cubic_Out(P: Single): Single; inline;
    class function Cubic_InOut(P: Single): Single; inline;

    //  Quartic
    class function Quartic_In(P: Single): Single; inline;
    class function Quartic_Out(P: Single): Single; inline;
    class function Quartic_InOut(P: Single): Single; inline;

    //  Quintic
    class function Quintic_In(P: Single): Single; inline;
    class function Quintic_Out(P: Single): Single; inline;
    class function Quintic_InOut(P: Single): Single; inline;

    //  Back
    class function Back_In(P: Single): Single; inline;
    class function Back_Out(P: Single): Single; inline;
    class function Back_InOut(P: Single): Single; inline;

    //  Bounce
    class function Bounce_In(P: Single): Single; inline;
    class function Bounce_Out(P: Single): Single; inline;
    class function Bounce_InOut(P: Single): Single; inline;

    //  Expo
    class function Expo_In(P: Single): Single; inline;
    class function Expo_Out(P: Single): Single; inline;
    class function Expo_InOut(P: Single): Single; inline;

    //  Sine
    class function Sine_In(P: Single): Single; inline;
    class function Sine_Out(P: Single): Single; inline;
    class function Sine_InOut(P: Single): Single; inline;

    //  Circle
    class function Circle_In(P: Single): Single; inline;
    class function Circle_Out(P: Single): Single; inline;
    class function Circle_InOut(P: Single): Single; inline;
  end;

implementation

uses
  Math;

{ LINEAR }

class function TIntAniCollection.Linear(P: Single): Single;
begin
  Result := P;
end;

{ QUADRATIC }

class function TIntAniCollection.Quadratic_In(P: Single): Single;
begin
  Result := P * P;
end;

class function TIntAniCollection.Quadratic_Out(P: Single): Single;
begin
  Result := 1 - Quadratic_In(1 - P);
end;

class function TIntAniCollection.Quadratic_InOut(P: Single): Single;
begin
  if P < 0.5 then
    Result := 2 * Quadratic_In(P)
  else
    Result := 1 - 2 * Quadratic_In(P - 1);
end;

{ CUBIC }


class function TIntAniCollection.Cubic_In(P: Single): Single;
begin
  Result := P * P * P;
end;

class function TIntAniCollection.Cubic_Out(P: Single): Single;
begin
  Result := 1 - Cubic_In(1 - P);
end;

class function TIntAniCollection.Cubic_InOut(P: Single): Single;
begin
  if P < 0.5 then
    Result := 4 * Cubic_In(P)
  else
    Result := 1 + 4 * Cubic_In(P - 1);
end;

{ QUARTIC }

class function TIntAniCollection.Quartic_In(P: Single): Single;
begin
  Result := P * P * P * P;
end;

class function TIntAniCollection.Quartic_Out(P: Single): Single;
begin
  Result := 1 - Quartic_In(1 - P);
end;

class function TIntAniCollection.Quartic_InOut(P: Single): Single;
begin
  if P < 0.5 then
    Result := 8 * Quintic_In(P)
  else
    Result := 1 - 8 * Quartic_In(P - 1);
end;

{ QUINTIC }

class function TIntAniCollection.Quintic_In(P: Single): Single;
begin
  Result := P * P * P * P * P;
end;

class function TIntAniCollection.Quintic_Out(P: Single): Single;
begin
  Result := 1 - Quintic_In(1 - P);
end;

class function TIntAniCollection.Quintic_InOut(P: Single): Single;
begin
  if P < 0.5 then
    Result := 16 * Quintic_In(P)
  else
    Result := 1 + 16 * Quintic_In(P - 1);
end;

{ BACK }

class function TIntAniCollection.Back_In(P: Single): Single;
var
  S: Single;
begin
  S := 1.70158;
  Result := P * P * (P * (S + 1) - S);
end;

class function TIntAniCollection.Back_Out(P: Single): Single;
var
  S: Single;
begin
  P := P - 1;
  S := 1.70158;
  Result := 1 + P * P * (P * (S + 1) + S);
end;

class function TIntAniCollection.Back_InOut(P: Single): Single;
var
  S: Single;
begin
  S := 1.70158;
  P := 2 * P;
  if P / 2 < 0.5 then
    begin
      S := S * 1.525;
      Result := 0.5 * P * P * (P * (S + 1) - S);
    end
  else
    begin
      P := P - 2;
      S := S * 1.525;
      Result := 1 + 0.5 * P * P * (P * (S + 1) + S);
    end;
end;

{ BOUNCE }

class function TIntAniCollection.Bounce_In(P: Single): Single;
begin
  P := 1 - P;
  Result := 1 - Bounce_Out(P);
end;

class function TIntAniCollection.Bounce_Out(P: Single): Single;
begin
  if P < 1 / 2.75 then
    Result := 7.5625 * P * P
  else if P < 2 / 2.72 then
    begin
      P := P - (1.5 / 2.75);
      Result := 0.75 + 7.5625 * P * P;
    end
  else if P < 2.5 / 2.75 then
    begin
      P := P - (2.25 / 2.75);
      Result := 0.9375 + 7.5625 * P * P;
    end
  else
    begin
      P := P - (2.625 / 2.75);
      Result := 0.984375 + 7.5625 * P * P;
    end;
end;

class function TIntAniCollection.Bounce_InOut(P: Single): Single;
begin
  if P < 0.5 then
    Result := 0.5 * Bounce_In(P * 2)
  else
    Result := 0.5 * (1 + Bounce_Out(2 * P - 1));
end;

{ EXPO }

class function TIntAniCollection.Expo_In(P: Single): Single;
begin
  Result := Power(2, (10 * (P - 1)));
end;

class function TIntAniCollection.Expo_Out(P: Single): Single;
begin
  Result := 1 - Power(2, (-10 * P));
end;

class function TIntAniCollection.Expo_InOut(P: Single): Single;
begin
  P := 2 * P;
  if P / 2 < 0.5 then
    Result := 0.5 * Power(2, (10 * (P - 1)))
  else
    Result := 0.5 * (2 - Power(2, (-10 * P)));
end;

{ SINE }

class function TIntAniCollection.Sine_In(P: Single): Single;
begin
  Result := 1 - Cos(P * Pi / 2);
end;

class function TIntAniCollection.Sine_Out(P: Single): Single;
begin
  Result := Sin(P * Pi / 2);
end;

class function TIntAniCollection.Sine_InOut(P: Single): Single;
begin
  Result := 0.5 * (1 - Cos(P * Pi));
end;

{ CIRCLE }

class function TIntAniCollection.Circle_In(P: Single): Single;
begin
  Result := 1 - Sqrt(1 - P * P);
end;

class function TIntAniCollection.Circle_Out(P: Single): Single;
begin
  P := P - 1;
  Result := Sqrt(1 - P * P);
end;

class function TIntAniCollection.Circle_InOut(P: Single): Single;
begin
  P := 2 * P;
  if P / 2 < 0.5 then
    Result := 0.5 * (1 - Sqrt(1 - P * P))
  else
    begin
      P := P - 2;
      Result := 0.5 * (1 + Sqrt(1 - P * P));
    end;
end;

end.
