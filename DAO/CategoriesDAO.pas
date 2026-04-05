unit CategoriesDAO;

interface

uses
  SysUtils, Classes, System.Generics.Collections,
  DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Param, FireDAC.Phys.PG, dmMain, Category;

type
  TCategoriesDAO = class

  private

  public
    function categoryExists(Category: TCategory): boolean;
    procedure deleteCategory(Category: TCategory);
    function getCategories(Category: TCategory): TFDQuery;
    procedure addCategory(Category: TCategory);
    procedure updateCategory(Category: TCategory);
  end;

implementation

{ TCategoriesDAO }

procedure TCategoriesDAO.addCategory(Category: TCategory);
var
  sSQL: string;
  fSet: TFDQuery;
begin
  fSet := TFDQuery.Create(nil);
  try
    fSet.Connection := DataModule1.FDConnection;

    sSQL :=
    'INSERT INTO categories(code, name) '+
    'VALUES (                           '+
    ' '''+Category.Code+''',            '+
    ' '''+Category.Name+''');           ';

    fSet.Close;
    fSet.SQL.Clear;
    fSet.SQL.Text := sSQL;
    fSet.ExecSQL;
  finally
    fSet.Close;
    fSet.Free;
  end;
end;

function TCategoriesDAO.categoryExists(Category: TCategory): boolean;
var
  sSQL: string;
  fGet: TFDQuery;
begin
  fGet := TFDQuery.Create(nil);
  try
    fGet.Connection := DataModule1.FDConnection;

    sSQL :=
    'select id                                         '+
    'from products                                     '+
    'where category_id = '''+Category.Id.ToString+'''; ';

    fGet.Close;
    fGet.SQL.Clear;
    fGet.SQL.Text := sSQL;
    fGet.Open;

    Result := not (fGet.IsEmpty);
  finally
    fGet.Close;
    fGet.Free;
  end;
end;

procedure TCategoriesDAO.deleteCategory(Category: TCategory);
var
  sSQL: string;
  fSet: TFDQuery;
begin
  fSet := TFDQuery.Create(nil);
  try
    fSet.Connection := DataModule1.FDConnection;

    sSQL :=
    'DELETE FROM categories WHERE id = '''+Category.Id.ToString+'''; ';

    fSet.Close;
    fSet.SQL.Clear;
    fSet.SQL.Text := sSQL;
    fSet.ExecSQL;
  finally
    fSet.Close;
    fSet.Free;
  end;
end;

function TCategoriesDAO.getCategories(Category: TCategory): TFDQuery;
var
  sSQL: string;
  fGet: TFDQuery;
begin
  fGet    := TFDQuery.Create(nil);
  try
    fGet.Connection := DataModule1.FDConnection;

    sSQL :=
    'SELECT                                    '+
    'categories.id,                            '+
    'categories.code,                          '+
    'categories.name                           '+
    'FROM categories                           '+
    'WHERE 1=1                                 ';

    if Category.Code <> '' then
      sSQL := sSQL + ' AND categories.code = '+Category.Code+' ';

    if Category.Name <> '' then
      sSQL := sSQL + ' AND categories.name ILIKE ''%'+Category.Name+'%'' ';

    sSQL := sSQL + ' ORDER BY categories.name desc';

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

procedure TCategoriesDAO.updateCategory(Category: TCategory);
var
  sSQL: string;
  fSet: TFDQuery;
begin
  fSet := TFDQuery.Create(nil);
  try
    fSet.Connection := DataModule1.FDConnection;

    sSQL :=
    'UPDATE categories SET                    '+
    'code = '''+Category.Code+''',            '+
    'name = '''+Category.Name+'''             '+
    'WHERE id = '''+Category.Id.ToString+'''; ';

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
