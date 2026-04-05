unit uFrmCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.ToolWin, dmMain, Vcl.Menus;

type
  TfrmCalculator = class(TForm)
    pnMain: TPanel;
    lblValue1: TLabel;
    lblValue2: TLabel;
    edtValue1: TEdit;
    edtValue2: TEdit;
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnCancel: TToolButton;
    btnSubtract: TToolButton;
    btnDivide: TToolButton;
    btnMultiply: TToolButton;
    btnAdd: TToolButton;
    btnConfirm: TToolButton;
    ppMultiplication: TPopupMenu;
    btnMultiplicationTable: TMenuItem;
    btnMultiplication: TMenuItem;
    mmResult: TMemo;
    procedure btnMultiplicationTableClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure edtValue1KeyPress(Sender: TObject; var Key: Char);
    procedure btnBackClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnMultiplicationClick(Sender: TObject);
    procedure btnDivideClick(Sender: TObject);
    procedure btnSubtractClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }

    bMultiplicationTable : boolean;
    procedure MultiplyControl;
    procedure ConfirmControl;
    procedure CancelControl;
    procedure ClearFields;
  public
    { Public declarations }
  end;

var
  frmCalculator: TfrmCalculator;

implementation

{$R *.dfm}

procedure TfrmCalculator.btnAddClick(Sender: TObject);
begin
  ClearFields;
end;

procedure TfrmCalculator.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalculator.btnCancelClick(Sender: TObject);
begin
  ClearFields;
  CancelControl;
end;

procedure TfrmCalculator.btnConfirmClick(Sender: TObject);
var
  iValue1, iValue2, iIndex, iResult: integer;
begin
  if edtValue1.Text = '' then
  begin
    Application.MessageBox('Type a number to start an operation!', 'Attention', MB_OK + MB_ICONERROR);
    Abort;
  end;

  iValue1 := StrToIntDef(edtValue1.Text, 0);

  if edtValue2.Visible then
    iValue2 := StrToIntDef(edtValue2.Text, 0);

  if bMultiplicationTable then
  begin
    for iIndex := 1 to 10 do
    begin
      iResult :=  iValue1 * iIndex;
      mmResult.Lines.Add(edtValue1.Text + ' X ' + iIndex.ToString + ' = ' + iResult.ToString);
    end;
  end;

  ConfirmControl;
end;

procedure TfrmCalculator.btnDivideClick(Sender: TObject);
begin
  ClearFields;
end;

procedure TfrmCalculator.btnMultiplicationClick(Sender: TObject);
begin
  ClearFields;
end;

procedure TfrmCalculator.btnMultiplicationTableClick(Sender: TObject);
begin
  ClearFields;
  MultiplyControl;
  bMultiplicationTable := true;

  edtValue1.SetFocus;
end;

procedure TfrmCalculator.btnSubtractClick(Sender: TObject);
begin
  ClearFields;
end;

procedure TfrmCalculator.CancelControl;
begin
  btnDivide.Enabled   := true;
  btnAdd.Enabled      := true;
  btnSubtract.Enabled := true;
  btnMultiply.Enabled := true;
  btnCancel.Enabled   := false;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;
end;

procedure TfrmCalculator.ClearFields;
begin
  edtValue1.Text := '';
  edtValue2.Text := '';
  mmResult.Lines.Clear;
end;

procedure TfrmCalculator.ConfirmControl;
begin
  btnDivide.Enabled   := true;
  btnAdd.Enabled      := true;
  btnSubtract.Enabled := true;
  btnMultiply.Enabled := true;
  btnCancel.Enabled   := false;
  btnConfirm.Enabled  := false;
  pnMain.Enabled      := false;
end;

procedure TfrmCalculator.edtValue1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
  end;

  if key = #13 then
    btnConfirm.Click;
end;

procedure TfrmCalculator.MultiplyControl;
begin
  btnDivide.Enabled   := false;
  btnAdd.Enabled      := false;
  btnSubtract.Enabled := false;
  btnMultiply.Enabled := false;
  btnCancel.Enabled   := true;
  btnConfirm.Enabled  := true;
  pnMain.Enabled      := true;
end;

end.
