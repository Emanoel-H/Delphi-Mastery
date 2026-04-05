unit uFrmCategorySignUp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.NumberBox, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, CategoriesDAO, Category, uFrmCategoriesSearching;

type
  TfrmCategorySignUp = class(TForm)
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnCancel: TToolButton;
    btnDelete: TToolButton;
    btnUpdate: TToolButton;
    btnAdd: TToolButton;
    btnSearch: TToolButton;
    btnConfirm: TToolButton;
    pnMain: TPanel;
    lblCode: TLabel;
    lblName: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    procedure btnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CategoriesDAO: TCategoriesDAO;
    procedure CancelControl;
    procedure ClearFields;
    procedure ConfirmControl;
    procedure AddControl;
    procedure SearchControl;
  public
    { Public declarations }
    Category: TCategory;
    bAdd: boolean;
    bUpdate: boolean;
    procedure setCategory(ACategory: TCategory);
  end;

var
  frmCategorySignUp: TfrmCategorySignUp;

implementation

{$R *.dfm}

procedure TfrmCategorySignUp.AddControl;
begin
  btnUpdate.Enabled  := false;
  btnAdd.Enabled     := false;
  btnDelete.Enabled  := false;
  btnSearch.Enabled  := false;
  btnCancel.Enabled  := true;
  btnConfirm.Enabled := true;
  pnMain.Enabled     := true;

  edtCode.SetFocus;
end;

procedure TfrmCategorySignUp.btnAddClick(Sender: TObject);
begin
  AddControl;
  bAdd := true;
end;

procedure TfrmCategorySignUp.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCategorySignUp.btnCancelClick(Sender: TObject);
begin
  ClearFields;
  CancelControl;
end;

procedure TfrmCategorySignUp.btnConfirmClick(Sender: TObject);
begin
  if (edtCode.Text = '') or (edtName.Text = '') then
  begin
    Application.MessageBox('A category must have a code, name!', 'Attention', MB_OK + MB_ICONERROR);
    Abort;
  end;

  if bAdd then
  begin
    Category.Code        := edtCode.Text;
    Category.Name        := edtName.Text;

    CategoriesDAO.addCategory(Category);

    bAdd := false;
  end;

  if bUpdate then
  begin
    Category.Code        := edtCode.Text;
    Category.Name        := edtName.Text;

    CategoriesDAO.updateCategory(Category);

    bUpdate := false;
  end;

  ConfirmControl;
  ClearFields;
end;

procedure TfrmCategorySignUp.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Are you sure you want to delete this Category?'), PChar('Attention!'), MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    if CategoriesDAO.categoryExists(Category) then
    begin
      Application.MessageBox('You cannot delete a category that is related to a product!', 'Deletion Error', MB_OK + MB_ICONERROR);
      Abort;
    end;

    CategoriesDAO.deleteCategory(Category);
    ConfirmControl;
  end;
end;

procedure TfrmCategorySignUp.btnSearchClick(Sender: TObject);
begin
  if frmCategoriesSearching = nil then
  begin
    frmCategoriesSearching := TfrmCategoriesSearching.Create(Self);
    frmCategoriesSearching.ShowModal;
    SearchControl;
  end;
end;

procedure TfrmCategorySignUp.btnUpdateClick(Sender: TObject);
begin
  AddControl;
  bUpdate := true;
end;

procedure TfrmCategorySignUp.CancelControl;
begin
  btnUpdate.Enabled  := false;
  btnAdd.Enabled     := true;
  btnDelete.Enabled  := false;
  btnSearch.Enabled  := true;
  btnCancel.Enabled  := false;
  btnConfirm.Enabled := false;
  pnMain.Enabled     := false;
end;

procedure TfrmCategorySignUp.ClearFields;
begin
  edtCode.Text  := '';
  edtName.Text  := '';
end;

procedure TfrmCategorySignUp.ConfirmControl;
begin
  btnUpdate.Enabled  := false;
  btnAdd.Enabled     := true;
  btnDelete.Enabled  := false;
  btnSearch.Enabled  := true;
  btnCancel.Enabled  := false;
  btnConfirm.Enabled := false;
  pnMain.Enabled     := false;

  bAdd := false;
end;

procedure TfrmCategorySignUp.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCategorySignUp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    CategoriesDAO.Free;
    Category.Free;
  finally
    Action            := caFree;
    frmCategorySignUp := nil;
  end;
end;

procedure TfrmCategorySignUp.FormCreate(Sender: TObject);
begin
  Category       := TCategory.Create;
  CategoriesDAO  := TCategoriesDAO.Create;
end;

procedure TfrmCategorySignUp.FormShow(Sender: TObject);
begin
  ConfirmControl;
end;

procedure TfrmCategorySignUp.SearchControl;
begin
  btnUpdate.Enabled   := true;
  btnAdd.Enabled      := false;
  btnDelete.Enabled   := true;
  btnSearch.Enabled   := false;
  btnCancel.Enabled   := true;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;
end;

procedure TfrmCategorySignUp.setCategory(ACategory: TCategory);
begin
  Category.Code := ACategory.Code;
  Category.Id   := ACategory.Id;
  Category.Name := ACategory.Name;

  edtCode.Text  := Category.Code;
  edtName.Text  := Category.Name;
end;

end.
