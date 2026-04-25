unit uFrmJsonToObject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.NumberBox, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, REST.Json, User, UserDAO, System.Generics.Collections;

type
  TfrmJsonToObject = class(TForm)
    pnMain: TPanel;
    lblCode: TLabel;
    lblName: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnCancel: TToolButton;
    btnAdd: TToolButton;
    btnConfirm: TToolButton;
    edtEmail: TEdit;
    lblEmail: TLabel;
    lblJson: TLabel;
    mmJson: TMemo;
    procedure btnBackClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConfirmControl;
    procedure CancelControl;
    procedure AddControl;
    procedure ClearFields;
  public
    { Public declarations }
    bAdd: boolean;
  end;

var
  frmJsonToObject: TfrmJsonToObject;

implementation

{$R *.dfm}

procedure TfrmJsonToObject.AddControl;
begin
  btnAdd.Enabled      := false;
  btnCancel.Enabled   := true;
  btnConfirm.Enabled  := true;
  pnMain.Enabled      := true;

  mmJson.SetFocus;
end;

procedure TfrmJsonToObject.btnAddClick(Sender: TObject);
begin
  AddControl;
  ClearFields;

  lblCode.Visible  := false;
  lblName.Visible  := false;
  lblEmail.Visible := false;

  edtCode.Visible  := false;
  edtName.Visible  := false;
  edtEmail.Visible := false;

  bAdd := true;
end;

procedure TfrmJsonToObject.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmJsonToObject.btnCancelClick(Sender: TObject);
begin
  ClearFields;
  CancelControl;
end;

procedure TfrmJsonToObject.btnConfirmClick(Sender: TObject);
var
  iCount : integer;
  User: TUser;
  UserDAO: TUserDAO;
  UserList: TObjectList<TUser>;
begin
  User     := TUser.Create;
  UserDAO  := TUserDAO.Create;
  UserList := TObjectList<TUser>.Create;
  try
    if (trim(mmJson.Text) = '') then
    begin
      Application.MessageBox('Insert a JSON on the JSON field!', 'Attention', MB_OK + MB_ICONERROR);
      Abort;
    end;

  //  if not (UserDAO.isJSON(trim(mmJson.Text))) then
  //  begin
  //    Application.MessageBox('Insert a valid JSON value!', 'Attention', MB_OK + MB_ICONERROR);
  //    Abort;
  //  end;

    if bAdd then
    begin
      UserList := UserDAO.loadUsers(trim(mmJson.Text));

      if UserList.Count = 1 then
      begin
        User := UserList[0];

        lblCode.Visible  := true;
        lblName.Visible  := true;
        lblEmail.Visible := true;

        edtCode.Visible  := true;
        edtName.Visible  := true;
        edtEmail.Visible := true;

        edtCode.Text  := User.Code;
        edtName.Text  := User.Name;
        edtEmail.Text := User.Email;
      end
      else
      begin
        mmJson.Clear;
        for iCount := 0 to UserList.Count - 1 do
          mmJson.Lines.Add('Code: ' + UserList[iCount].Code + ', Name: ' + UserList[iCount].Name + ', Email: ' + UserList[iCount].Email);
      end;

      bAdd := false;
    end;

    ConfirmControl;
  finally
    UserList.Free;
//    User.Free;
    UserDAO.Free;
  end;
end;

procedure TfrmJsonToObject.CancelControl;
begin;
  btnAdd.Enabled      := true;
  btnCancel.Enabled   := false;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;
end;

procedure TfrmJsonToObject.ClearFields;
begin
  edtCode.Text  := '';
  edtName.Text  := '';
  edtEmail.Text := '';
  mmJSON.Clear;
end;

procedure TfrmJsonToObject.ConfirmControl;
begin
  btnAdd.Enabled      := true;
  btnCancel.Enabled   := false;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;

  bAdd := false;
end;

procedure TfrmJsonToObject.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action          := caFree;
  frmJsonToObject := nil;
end;

procedure TfrmJsonToObject.FormShow(Sender: TObject);
begin
  ConfirmControl;
end;

end.
