unit uFrmUserControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, dmMain,
  Vcl.StdCtrls;

type
  TFrmUserControl = class(TForm)
    pnMain: TPanel;
    ToolBar1: TToolBar;
    btnBack: TToolButton;
    btnCancel: TToolButton;
    btnSubtract: TToolButton;
    btnUpdate: TToolButton;
    btnMultiply: TToolButton;
    btnAdd: TToolButton;
    btnConfirm: TToolButton;
    lblName: TLabel;
    edtName: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUserControl: TFrmUserControl;

implementation

{$R *.dfm}

end.
