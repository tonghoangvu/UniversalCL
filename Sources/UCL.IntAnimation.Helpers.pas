unit UCL.IntAnimation.Helpers;

interface

uses
  UCL.IntAnimation,
  Controls;

type
  TAnimationProp = (
    apTop, apLeft, apWidth, apHeight,
    apMarginTop, apMarginLeft, apMarginRight, apMarginBottom,
    apPaddingTop, apPaddingLeft, apPaddingRight, apPaddingBottom
    );

  TWinControlHelper = class helper for TWinControl
    function GetPropValue(Prop: TAnimationProp): Integer;
    procedure SetPropValue(Prop: TAnimationProp; Value: Integer);

    procedure Animation(
      AniProperty: TAnimationProp;
      StartValue, DeltaValue: Integer; Step, Duration: Cardinal;
      AniKind: TAniKind; AniFunctionKind: TAniFunctionKind;
      OnDone: TAniDoneProc);
    procedure AnimationFromCurrent(
      AniProperty: TAnimationProp;
      DeltaValue: Integer; Step, Duration: Cardinal;
      AniKind: TAniKind; AniFunctionKind: TAniFunctionKind;
      OnDone: TAniDoneProc);
  end;

implementation

{ TWinControlHelper }

procedure TWinControlHelper.Animation(
  AniProperty: TAnimationProp;
  StartValue, DeltaValue: Integer; Step, Duration: Cardinal;
  AniKind: TAniKind; AniFunctionKind: TAniFunctionKind;
  OnDone: TAniDoneProc);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(True, AniKind, AniFunctionKind, StartValue, DeltaValue,
    procedure (V: Integer)
    begin
      SetPropValue(AniProperty, V);
    end);
  Ani.Step := Step;
  Ani.Duration := Duration;

  Ani.OnDone := OnDone;
  Ani.Start;
end;

procedure TWinControlHelper.AnimationFromCurrent(
  AniProperty: TAnimationProp; DeltaValue: Integer; Step,
  Duration: Cardinal; AniKind: TAniKind; AniFunctionKind: TAniFunctionKind;
  OnDone: TAniDoneProc);
begin
  Animation(AniProperty, GetPropValue(AniProperty), DeltaValue, Step, Duration,
    AniKind, AniFunctionKind, OnDone);
end;

//  PROPERTY

function TWinControlHelper.GetPropValue(Prop: TAnimationProp): Integer;
begin
  case Prop of
    apTop:
      Result := Top;
    apLeft:
      Result := Left;
    apWidth:
      Result := Width;
    apHeight:
      Result := Height;
    apMarginTop:
      Result := Margins.Top;
    apMarginLeft:
      Result := Margins.Left;
    apMarginRight:
      Result := Margins.Right;
    apMarginBottom:
      Result := Margins.Bottom;
    apPaddingTop:
      Result := Padding.Top;
    apPaddingLeft:
      Result := Padding.Left;
    apPaddingRight:
      Result := Padding.Right;
    apPaddingBottom:
      Result := Padding.Bottom;
    else
      Result := -1;
  end;
end;

procedure TWinControlHelper.SetPropValue(Prop: TAnimationProp; Value: Integer);
begin
  case Prop of
    apTop:
      Top := Value;
    apLeft:
      Left := Value;
    apWidth:
      Width := Value;
    apHeight:
      Height := Value;

    apMarginTop:
      Margins.Top := Value;
    apMarginLeft:
      Margins.Left := Value;
    apMarginRight:
      Margins.Right := Value;
    apMarginBottom:
      Margins.Bottom := Value;

    apPaddingTop:
      Padding.Top := Value;
    apPaddingLeft:
      Padding.Left := Value;
    apPaddingRight:
      Padding.Right := Value;
    apPaddingBottom:
      Padding.Bottom := Value;
  end;
end;

end.
