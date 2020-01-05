unit DataModule.Main;

interface

uses
  UCL.TUThemeManager, UCL.Classes, UCL.Utils,
  UCL.TUCheckBox,
  SysUtils, Classes, Dialogs, Graphics,
  Windows;

type
  TdmMain = class(TDataModule)
    AppTheme: TUThemeManager;
    procedure AppThemeAfterUpdate(Sender: TObject);
    procedure AppThemeBeforeUpdate(Sender: TObject);
    procedure AppThemeBeforeColorLoading(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

uses
  UCL.Colors,
  Form.Demo, Form.LoginDialog, Form.ImageBackground;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.AppThemeAfterUpdate(Sender: TObject);
begin
  //  Handle theme changed for formDemo
  if formDemo <> nil then
    begin
      //  Theme changed
      if AppTheme.UseSystemTheme then
        formDemo.radioSystemTheme.IsChecked := true
      else if AppTheme.CustomTheme = utLight then
        formDemo.radioLightTheme.IsChecked := true
      else
        formDemo.radioDarkTheme.IsChecked := true;

      //  Accent color changed
      formDemo.panelSelectAccentColor.CustomBackColor := AppTheme.AccentColor;
      formDemo.panelSelectAccentColor.CustomTextColor :=
        GetTextColorFromBackground(AppTheme.AccentColor);

      //  Color on border changed
      if AppTheme.ColorOnBorder then
        formDemo.checkColorBorder.State := cbsChecked
      else
        formDemo.checkColorBorder.State := cbsUnchecked;
    end;

  //  Handle theme changed for formImageBackground
  if formImageBackground <> nil then
    begin
      //  Theme changed
      if AppTheme.UseSystemTheme then
        formImageBackground.radioSystemTheme.IsChecked := true
      else if AppTheme.CustomTheme = utLight then
        formImageBackground.radioLightTheme.IsChecked := true
      else
        formImageBackground.radioDarkTheme.IsChecked := true;
    end;

  LockWindowUpdate(0);
end;

procedure TdmMain.AppThemeBeforeColorLoading(Sender: TObject);
begin
  //SCROLLBOX_BACK_LIGHT := clred;
end;

procedure TdmMain.AppThemeBeforeUpdate(Sender: TObject);
begin
  if formDemo <> nil then
    LockWindowUpdate(formDemo.Handle);
  if formLoginDialog <> nil then
    LockWindowUpdate(formLoginDialog.Handle);
  if formImageBackground <> nil then
    LockWindowUpdate(formImageBackground.Handle);
end;

end.
