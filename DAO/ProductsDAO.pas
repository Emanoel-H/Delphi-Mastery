unit ProductsDAO;

interface

uses
  SysUtils, Classes, System.Generics.Collections,
  DB, Product, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Param, FireDAC.Phys.PG, dmMain, Category;

type
  TProductsDAO = class

  private

  public
    procedure deleteProduct(Product: TProduct);
    procedure addProduct(Product: TProduct);
    procedure updateProduct(Product: TProduct);
    function getProducts(Product: TProduct): TFDQuery;
    function listCategories: TDataSource;
  end;
implementation

{ TProductsDAO }

procedure TProductsDAO.addProduct(Product: TProduct);
var
  sSQL: string;
  fSet: TFDQuery;
begin
  fSet := TFDQuery.Create(nil);
  try
    fSet.Connection := DataModule1.FDConnection;

    sSQL :=
    'INSERT INTO products(code, name, price, category_id)  '+
    'VALUES (                                              '+
    ' '''+Product.Code+''',                                '+
    ' '''+Product.Name+''',                                '+
    ' '''+FloatToStr(Product.Price).Replace(',', '.')+''', '+
    ' '''+Product.Category.Id.ToString+''');               ';

    fSet.Close;
    fSet.SQL.Clear;
    fSet.SQL.Text := sSQL;
    fSet.ExecSQL;
  finally
    fSet.Close;
    fSet.Free;
  end;
end;

procedure TProductsDAO.deleteProduct(Product: TProduct);
var
  sSQL: string;
  fSet: TFDQuery;
begin
  fSet := TFDQuery.Create(nil);
  try
    fSet.Connection := DataModule1.FDConnection;

    sSQL := 'DELETE FROM products WHERE id = '''+Product.Id.ToString+''' ';

    fSet.Close;
    fSet.SQL.Clear;
    fSet.SQL.Text := sSQL;
    fSet.ExecSQL;
  finally
    fSet.Close;
    fSet.Free;
  end;
end;

function TProductsDAO.getProducts(Product: TProduct): TFDQuery;
var
  sSQL: string;
  fGet: TFDQuery;
begin
  fGet    := TFDQuery.Create(nil);
  try
    fGet.Connection := DataModule1.FDConnection;

    sSQL :=
    'SELECT                                    '+
    'products.id,                              '+
    'products.code,                            '+
    'products.name,                            '+
    'products.price,                           '+
    'categories.name as category,              '+
    'products.category_id                      '+
    'FROM products                             '+
    'LEFT JOIN categories                      '+
    'ON products.category_id = categories.id   '+
    'WHERE 1=1                                 ';

    if Product.Code <> '' then
      sSQL := sSQL + ' AND products.code = '+Product.Code+' ';

    if Product.Name <> '' then
      sSQL := sSQL + ' AND products.name ILIKE ''%'+Product.Name+'%'' ';

    if Product.Category.Id <> 0 then
      sSQL := sSQL + ' AND products.category_id = '''+Product.Category.Id.ToString+''' ';

    sSQL := sSQL + ' ORDER BY products.name desc';

    fGet.Close;
    fGet.SQL.Clear;
    fGet.SQL.Text := sSQL;
    fGet.Open;

    if not fGet.IsEmpty then
      Result := fGet;
  except
    on E: Exception do
    begin
      fGet.Close;
      fGet.Free;
    end;
  end;
end;

function TProductsDAO.listCategories: TDataSource;
var
  sSQL: string;
  fGet: TFDQuery;
  ds: TDataSource;
begin
  fGet := TFDQuery.Create(nil);
  ds := TDataSource.Create(nil);
  try
    fGet.Connection := DataModule1.FDConnection;

    sSQL :=
    'select              '+
    'id,                 '+
    'name::VARCHAR(200)  '+
    'from categories     '+
    'order by name desc; ';
    fGet.Close;
    fGet.SQL.Clear;
    fGet.SQL.Text := sSQL;
    fGet.Open;

    ds.DataSet := fGet;

    Result     := ds;
  except
    on E: Exception do
    begin
      ds.Free;
      fGet.Close;
      fGet.Free;
    end;
  end;
end;

procedure TProductsDAO.updateProduct(Product: TProduct);
var
  sSQL: string;
  fSet: TFDQuery;
begin
  fSet := TFDQuery.Create(nil);
  try
    fSet.Connection := DataModule1.FDConnection;

    sSQL :=
    'UPDATE products SET                                          '+
    'code = '''+Product.Code+''',                                 '+
    'name = '''+Product.Name+''',                                 '+
    'price = '''+FloatToStr(Product.Price).Replace(',', '.')+''', '+
    'category_id = '''+Product.Category.Id.ToString+'''           '+
    'WHERE id = '''+Product.Id.ToString+''';                      ';

    fSet.Close;
    fSet.SQL.Clear;
    fSet.SQL.Text := sSQL;
    fSet.ExecSQL;
  finally
    fSet.Close;
    fSet.Free;
  end;
end;

end.
