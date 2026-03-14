unit uFrmProductsSearching;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Product, ProductsDAO, Vcl.Grids, Vcl.DBGrids;

type
  TfrmProductsSearching = class(TForm)
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnSearch: TToolButton;
    btnConfirm: TToolButton;
    pnMenu: TPanel;
    lblCode: TLabel;
    edtCode: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    Label1: TLabel;
    dblCategory: TDBLookupComboBox;
    fdqProducts: TFDQuery;
    fdqProductsid: TIntegerField;
    fdqProductscode: TWideStringField;
    fdqProductsname: TWideStringField;
    fdqProductsprice: TFloatField;
    fdqProductscategory: TWideStringField;
    fdqProductscategory_id: TIntegerField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    dsProducts: TDataSource;
    dbgProducts: TDBGrid;
    pnFooter: TPanel;
    pnRecords: TPanel;
    lblRecords: TLabel;
    lblRecordCount: TLabel;
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgProductsDblClick(Sender: TObject);
    procedure dbgProductsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    ProductsDAO: TProductsDAO;
    Product: TProduct;
  public
    { Public declarations }
  end;

var
  frmProductsSearching: TfrmProductsSearching;

implementation

uses
  uFrmProductsSignUp;
{$R *.dfm}

procedure TfrmProductsSearching.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProductsSearching.btnConfirmClick(Sender: TObject);
begin
  if (frmProductsSignUp = nil) and not (fdqProducts.IsEmpty) then
  begin
    Product.Id            := dbgProducts.DataSource.DataSet.FieldByName('id').AsInteger;
    Product.Code          := dbgProducts.DataSource.DataSet.FieldByName('code').AsString;
    Product.Name          := dbgProducts.DataSource.DataSet.FieldByName('name').AsString;
    Product.Category.Id   := dbgProducts.DataSource.DataSet.FieldByName('category_id').AsInteger;
    Product.Category.Name := dbgProducts.DataSource.DataSet.FieldByName('category').AsString;

    frmProductsSignUp.setProduct(Product);
    Close;
  end;
end;

procedure TfrmProductsSearching.btnSearchClick(Sender: TObject);
begin
  Product.Code           := edtCode.Text;
  Product.Name           := edtName.Text;
  Product.Category.Id    := StrToIntDef(VartoStr(dblCategory.KeyValue), 0);

  fdqProducts            := ProductsDAO.getProducts(Product);
  dsProducts.DataSet     := fdqProducts;
  lblRecordCount.Caption := fdqProducts.RecordCount.ToString;
end;

procedure TfrmProductsSearching.dbgProductsDblClick(Sender: TObject);
begin
  btnConfirm.Click;
end;

procedure TfrmProductsSearching.dbgProductsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if gdSelected in State then
  begin
    dbgProducts.Canvas.Brush.Color := clNavy;
    dbgProducts.Canvas.Font.Color := clWhite;
  end

    else if dbgProducts.DataSource.DataSet.RecNo mod 2 = 0 then
  begin
    dbgProducts.Canvas.Brush.Color := $00673AB7;
  end;
  dbgProducts.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProductsSearching.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmProductsSearching.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    try
    ProductsDAO.Free;
    Product.Free;
  finally
    Action            := caFree;
    frmProductsSearching := nil;
  end;
end;

procedure TfrmProductsSearching.FormCreate(Sender: TObject);
begin
  ProductsDAO := TProductsDAO.Create;
  Product     := TProduct.Create;

  dbgProducts.Color := clBlack;
  dbgProducts.FixedColor := $00202020;
  dbgProducts.Font.Color := clWhite;
  dbgProducts.TitleFont.Color := clWhite;
  dbgProducts.TitleFont.Style := [fsBold];
  dbgProducts.DrawingStyle := gdsClassic;
  dbgProducts.ParentColor := False;
end;

procedure TfrmProductsSearching.FormShow(Sender: TObject);
begin
  fdqProducts            := ProductsDAO.getProducts(Product);
  dsProducts.DataSet     := fdqProducts;
  dblCategory.ListSource := ProductsDAO.listCategories;

  lblRecordCount.Caption := fdqProducts.RecordCount.ToString;
end;

end.
