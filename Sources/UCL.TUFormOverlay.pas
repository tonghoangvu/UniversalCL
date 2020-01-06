unit UCL.TUFormOverlay;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  Classes, SysUtils, Types, Messages, Windows, dialogs,
  Graphics, Controls, Forms;

type
  TUFormOverlay = class(TForm)
    private
      FCaptionBarHeight: Integer;
      FAllowMove: Boolean;

      procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    public
      constructor CreateNew(aOwner: TComponent; Dummy: Integer = 0); override;
      procedure AssignToForm(Form: TForm);

    published
      property CaptionBarHeight: Integer read FCaptionBarHeight write FCaptionBarHeight default 32;
      property AllowMove: Boolean read FAllowMove write FAllowMove default true;
  end;

implementation

{ TUFormOverlay }

procedure TUFormOverlay.AssignToForm(Form: TForm);
begin
  Parent := Form;
  SetBounds(0, 0, Form.ClientWidth, Form.ClientHeight);
end;

constructor TUFormOverlay.CreateNew(aOwner: TComponent; Dummy: Integer);
begin
  inherited;

  FCaptionBarHeight := 32;
  FAllowMove := true;

  BorderStyle := bsNone;
  Color := $FFFFFF;
  Anchors := [akLeft, akTop, akRight, akBottom];
  Visible := false;

  AlphaBlend := true;
  AlphaBlendValue := 150;
end;

procedure TUFormOverlay.WM_NCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;

  if AllowMove and (Parent <> nil) then
    if Msg.YPos - Parent.BoundsRect.Top <= CaptionBarHeight then
      Msg.Result := HTTRANSPARENT;
end;

end.
