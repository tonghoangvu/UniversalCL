unit UCL.TUFormOverlay;

interface

uses
  Classes, SysUtils, Types, Messages, Windows, Graphics, Controls, Forms,
  UCL.Classes, UCL.TUThemeManager;

type
  TUOverlayType = (otNone, otBlur, otSplash);

  TUFormOverlay = class(TForm)
    private
      FOverlayType: TUOverlayType;
      FCaptionBarHeight: Integer;
      FAllowMove: Boolean;

      //  Setters
      procedure SetOverlayType(const Value: TUOverlayType);

      //  Messages
      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    public
      constructor CreateNew(aOwner: TComponent; Dummy: Integer = 0); override;
      procedure AssignToForm(Form: TForm);

    published
      property OverlayType: TUOverlayType read FOverlayType write SetOverlayType default otNone;
      property CaptionBarHeight: Integer read FCaptionBarHeight write FCaptionBarHeight default 32;
      property AllowMove: Boolean read FAllowMove write FAllowMove default true;
  end;

implementation

{ TUFormOverlay }

//  SETTERS

procedure TUFormOverlay.SetOverlayType(const Value: TUOverlayType);
begin
  if Value <> FOverlayType then
    begin
      FOverlayType := Value;

      //  Reset properties

      //  Apply changes
      case FOverlayType of
        otNone:
          begin
            AlphaBlend := false;
            Visible := false;
          end;

        otBlur:
          begin
            AlphaBlend := true;
            AlphaBlendValue := 150;
            Visible := true;
          end;

        otSplash:
          begin
            AlphaBlend := false;
            Visible := true;
            //
          end;
      end;
    end;
end;

//  MAIN CLASS

constructor TUFormOverlay.CreateNew(aOwner: TComponent; Dummy: Integer);
begin
  inherited;

  FOverlayType := otNone;
  FCaptionBarHeight := 32;
  FAllowMove := true;

  BorderStyle := bsNone;
  Color := $FFFFFF;
  Anchors := [akLeft, akTop, akRight, akBottom];
  Visible := false;

  AlphaBlend := false;
  AlphaBlendValue := 150;
end;

procedure TUFormOverlay.AssignToForm(Form: TForm);
begin
  Parent := Form;
  SetBounds(0, 0, Form.ClientWidth, Form.ClientHeight);
end;

//  MESSAGES

procedure TUFormOverlay.WM_NCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;

  case OverlayType of
    otNone:
      Msg.Result := HTTRANSPARENT;

    otBlur:
      if AllowMove and (Parent <> nil) then
        if Msg.YPos - Parent.BoundsRect.Top <= CaptionBarHeight then
          Msg.Result := HTTRANSPARENT;

    otSplash: ;
  end;
end;

end.
