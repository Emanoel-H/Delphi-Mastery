unit uFrmProductsSignUp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.NumberBox, Data.DB, ProductsDAO, Product, FireDAC.DApt, uFrmProductsSearching;

type
  TfrmProductsSignUp = class(TForm)
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnCancel: TToolButton;
    btnDelete: TToolButton;
    btnUpdate: TToolButton;
    btnAdd: TToolButton;
    btnConfirm: TToolButton;
    pnMain: TPanel;
    lblCode: TLabel;
    lblName: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    lblPrice: TLabel;
    dblCategory: TDBLookupComboBox;
    Label1: TLabel;
    nbPrice: TNumberBox;
    btnSearch: TToolButton;
    procedure btnBackClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dblCategoryKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    ProductsDAO: TProductsDAO;
    procedure ConfirmControl;
    procedure CancelControl;
    procedure ClearFields;
    procedure SearchControl;
    procedure AddControl;
  public
    { Public declarations }
    Product: TProduct;
    bAdd: boolean;
    bUpdate: boolean;
    procedure setProduct(AProduct: TProduct);
  end;

var
  frmProductsSignUp: TfrmProductsSignUp;

implementation

{$R *.dfm}

procedure TfrmProductsSignUp.AddControl;
begin
  btnUpdate.Enabled   := false;
  btnAdd.Enabled      := false;
  btnDelete.Enabled   := false;
  btnSearch.Enabled   := false;
  btnCancel.Enabled   := true;
  btnConfirm.Enabled  := true;
  pnMain.Enabled      := true;

  edtCode.SetFocus;
end;

procedure TfrmProductsSignUp.btnAddClick(Sender: TObject);
begin
  AddControl;
  bAdd := true;
end;

procedure TfrmProductsSignUp.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProductsSignUp.btnCancelClick(Sender: TObject);
begin
  ClearFields;
  CancelControl;
end;

procedure TfrmProductsSignUp.btnConfirmClick(Sender: TObject);
begin
  if (edtCode.Text = '') or (edtName.Text = '') or
     (nbPrice.Text = '') or (nbPrice.Value = 0) then
      raise Exception.Create('A product must have a code, name and price!');

  if bAdd then
  begin
    Product.Code        := edtCode.Text;
    Product.Name        := edtName.Text;
    Product.Price       := nbPrice.Value;
    Product.Category.Id := StrToIntDef(VarToStr(dblCategory.KeyValue), 0);

    ProductsDAO.addProduct(Product);

    bAdd := false;
  end;

  if bUpdate then
  begin
    Product.Code        := edtCode.Text;
    Product.Name        := edtName.Text;
    Product.Price       := nbPrice.Value;
    Product.Category.Id := StrToIntDef(VarToStr(dblCategory.KeyValue), 0);

    ProductsDAO.updateProduct(Product);

    bUpdate := false;
  end;

  ConfirmControl;
  ClearFields;
end;

procedure TfrmProductsSignUp.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Are you sure you want to delete this product?'), PChar('Attention!'), MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    ProductsDAO.deleteProduct(Product);
    ConfirmControl;
  end;
end;

procedure TfrmProductsSignUp.btnSearchClick(Sender: TObject);
begin
  if frmProductsSearching = nil then
  begin
    frmProductsSearching := TfrmProductsSearching.Create(Self);
    frmProductsSearching.ShowModal;
  end;
end;

procedure TfrmProductsSignUp.btnUpdateClick(Sender: TObject);
begin
  AddControl;
  bUpdate := true;
end;

procedure TfrmProductsSignUp.CancelControl;
begin
  btnUpdate.Enabled   := false;
  btnAdd.Enabled      := true;
  btnDelete.Enabled   := false;
  btnSearch.Enabled   := true;
  btnCancel.Enabled   := false;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;
end;

procedure TfrmProductsSignUp.ClearFields;
begin
  edtCode.Text  := '';
  edtName.Text  := '';
  nbPrice.Text  := '';
  dblCategory.KeyValue := null;
end;

procedure TfrmProductsSignUp.ConfirmControl;
begin
  btnUpdate.Enabled   := false;
  btnAdd.Enabled      := true;
  btnDelete.Enabled   := false;
  btnSearch.Enabled   := true;
  btnCancel.Enabled   := false;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;

  bAdd := false;
end;

procedure TfrmProductsSignUp.dblCategoryKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
    dblCategory.KeyValue := null;
end;

procedure TfrmProductsSignUp.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmProductsSignUp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    ProductsDAO.Free;
    Product.Free;
  finally
    Action            := caFree;
    frmProductsSignUp := nil;
  end;
end;

procedure TfrmProductsSignUp.FormCreate(Sender: TObject);
begin
  ProductsDAO := TProductsDAO.Create;
  Product     := TProduct.Create;
end;

procedure TfrmProductsSignUp.FormShow(Sender: TObject);
begin
  dblCategory.ListSource := ProductsDAO.listCategories;
  ConfirmControl;
end;

procedure TfrmProductsSignUp.SearchControl;
begin
  btnUpdate.Enabled   := true;
  btnAdd.Enabled      := false;
  btnDelete.Enabled   := true;
  btnSearch.Enabled   := false;
  btnCancel.Enabled   := true;
  btnConfirm.Enabled  := true;
  pnMain.Enabled      := true;
end;

procedure TfrmProductsSignUp.setProduct(AProduct: TProduct);
begin
  Product.Id            := AProduct.Id;
  Product.Code          := AProduct.Code;
  Product.Name          := AProduct.Name;
  Product.Price         := AProduct.Price;
  Product.Category.Id   := AProduct.Category.Id;
  Product.Category.Name := AProduct.Category.Name;

  edtCode.Text         := Product.Code;
  edtName.Text         := Product.Name;
  nbPrice.Text         := Product.Price.ToString;
  dblCategory.KeyValue := Product.Category.Id;
end;

end.
