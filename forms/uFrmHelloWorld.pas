unit uFrmHelloWorld;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmHelloWorld = class(TForm)
    pnPrincipal: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    btnGreet: TButton;
    lblAge: TLabel;
    edtAge: TEdit;
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnGreetClick(Sender: TObject);
    procedure edtAgeKeyPress(Sender: TObject; var Key: Char);
  private
    procedure ProcessData;
    function isAdult(iAge: integer): boolean;
  public
    { Public declarations }
  end;

var
  frmHelloWorld: TfrmHelloWorld;

implementation

{$R *.dfm}

procedure TfrmHelloWorld.btnGreetClick(Sender: TObject);
var
  sName, sAge, sMessage: string;
begin
  if edtNome.Text = '' then
    raise Exception.Create('Please enter your name!');

  if edtNome.Text = '' then
    raise Exception.Create('Please enter your age!');

  sName := edtNome.Text;
  sAge  := edtAge.Text;

  sMessage := 'Name: ' + sName + #13#10 + 'Age: ' + sAge + #13#10 + 'You are an adult';

  if not isAdult(sAge.ToInteger) then
    sMessage := 'Name: ' + sName + #13#10 + 'Age: ' + sAge + #13#10 + 'You are a minor';

  ShowMessage(sMessage);
end;

procedure TfrmHelloWorld.edtAgeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #32, #13]) then
  begin
    Key := #0;
  end;

  if key = #13 then
    btnGreet.Click;
end;

procedure TfrmHelloWorld.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['a'..'z', 'A'..'Z', #8, #32, #13]) then
  begin
    Key := #0;
  end;
end;

function TfrmHelloWorld.isAdult(iAge: integer): boolean;
var
  bIsAdult: boolean;
begin
  bIsAdult := false;

  if iAge >= 18 then
    bIsAdult := true;

  Result := bIsAdult;
end;

procedure TfrmHelloWorld.ProcessData;
var
  DataList: TStringList;
begin
  DataList := TStringList.Create;
  try
    DataList.Add('Learning Delphi is awesome!');
  finally
    DataList.Free;
  end;
end;

end.
