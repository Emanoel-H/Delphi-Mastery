unit uFrmCategoriesSearching;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Category, CategoriesDAO;

type
  TfrmCategoriesSearching = class(TForm)
    dbgCategories: TDBGrid;
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnSearch: TToolButton;
    btnConfirm: TToolButton;
    pnMenu: TPanel;
    lblCode: TLabel;
    lblName: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    pnFooter: TPanel;
    pnRecords: TPanel;
    lblRecords: TLabel;
    lblRecordCount: TLabel;
    fdqCategories: TFDQuery;
    dsCategories: TDataSource;
    procedure btnBackClick(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgCategoriesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgCategoriesDblClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
    Category: TCategory;
    CategoriesDAO: TCategoriesDAO;
  public
    { Public declarations }
  end;

var
  frmCategoriesSearching: TfrmCategoriesSearching;

implementation

uses
  uFrmCategorySignUp;

{$R *.dfm}

procedure TfrmCategoriesSearching.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCategoriesSearching.btnConfirmClick(Sender: TObject);
begin
  if (frmCategorySignUp <> nil) and not (fdqCategories.IsEmpty) then
  begin
    Category.Id   := dbgCategories.DataSource.DataSet.FieldByName('id').AsInteger;
    Category.Code := dbgCategories.DataSource.DataSet.FieldByName('code').AsString;
    Category.Name := dbgCategories.DataSource.DataSet.FieldByName('name').AsString;

    frmCategorySignUp.setCategory(Category);
    Close;
  end;
end;

procedure TfrmCategoriesSearching.btnSearchClick(Sender: TObject);
begin
  Category.Code          := edtCode.Text;
  Category.Name          := edtName.Text;

  fdqCategories          := CategoriesDAO.getCategories(Category);
  dsCategories.DataSet   := fdqCategories;
  lblRecordCount.Caption := fdqCategories.RecordCount.ToString;
end;

procedure TfrmCategoriesSearching.dbgCategoriesDblClick(Sender: TObject);
begin
  btnConfirm.Click;
end;

procedure TfrmCategoriesSearching.dbgCategoriesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if gdSelected in State then
  begin
    dbgCategories.Canvas.Brush.Color := clNavy;
    dbgCategories.Canvas.Font.Color := clWhite;
  end

    else if dbgCategories.DataSource.DataSet.RecNo mod 2 = 0 then
  begin
    dbgCategories.Canvas.Brush.Color := $00673AB7;
  end;
  dbgCategories.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCategoriesSearching.edtCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCategoriesSearching.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    try
    CategoriesDAO.Free;
    Category.Free;
  finally
    Action                 := caFree;
    frmCategoriesSearching := nil;
  end;
end;

procedure TfrmCategoriesSearching.FormCreate(Sender: TObject);
begin
  Category      := TCategory.Create;
  CategoriesDAO := TCategoriesDAO.Create;

  dbgCategories.Color           := clBlack;
  dbgCategories.FixedColor      := $00202020;
  dbgCategories.Font.Color      := clWhite;
  dbgCategories.TitleFont.Color := clWhite;
  dbgCategories.TitleFont.Style := [fsBold];
  dbgCategories.DrawingStyle    := gdsClassic;
  dbgCategories.ParentColor     := False;
end;

procedure TfrmCategoriesSearching.FormShow(Sender: TObject);
begin
  fdqCategories          := CategoriesDAO.getCategories(Category);
  dsCategories.DataSet   := fdqCategories;
  lblRecordCount.Caption := fdqCategories.RecordCount.ToString;
end;

end.
