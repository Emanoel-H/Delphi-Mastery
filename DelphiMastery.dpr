program DelphiMastery;

uses
  Vcl.Forms,
  uFrmHelloWorld in 'forms\uFrmHelloWorld.pas' {frmHelloWorld},
  uFrmCalculator in 'forms\uFrmCalculator.pas' {frmCalculator},
  dmMain in 'dmMain.pas' {DataModule1: TDataModule},
  uFrmUserControl in 'forms\uFrmUserControl.pas' {FrmUserControl},
  uFrmSales in 'forms\uFrmSales.pas' {frmSales},
  uFrmProductsSignUp in 'forms\uFrmProductsSignUp.pas' {frmProductsSignUp},
  uFrmProductsSearching in 'forms\uFrmProductsSearching.pas' {frmProductsSearching},
  ufrmCustomersSignUp in 'forms\ufrmCustomersSignUp.pas' {frmCustomersSignUp},
  uFrmCustomersSearching in 'forms\uFrmCustomersSearching.pas' {frmCustomersSearching},
  Category in 'Classes\Category.pas',
  Product in 'Classes\Product.pas',
  Customer in 'Classes\Customer.pas',
  ProductsDAO in 'DAO\ProductsDAO.pas',
  Vcl.Themes,
  Vcl.Styles,
  uFrmCategorySignUp in 'forms\uFrmCategorySignUp.pas' {frmCategorySignUp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Dark');
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmProductsSignUp, frmProductsSignUp);
  Application.Run;
end.
