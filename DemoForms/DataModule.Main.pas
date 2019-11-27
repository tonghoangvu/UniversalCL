unit DataModule.Main;

interface

uses
  System.SysUtils, System.Classes, UCL.TUThemeManager;

type
  TdmMain = class(TDataModule)
    AppTheme: TUThemeManager;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
