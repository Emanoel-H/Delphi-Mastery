unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, System.IniFiles, Vcl.Dialogs;

type
  TDataModule1 = class(TDataModule)
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection: TFDConnection;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.FDConnectionBeforeConnect(Sender: TObject);
var
  Ini: TIniFile;
  sPath: string;
begin
  sPath := ExtractFilePath(ParamStr(0)) + 'config.ini';

  if not FileExists(sPath) then
  begin
    ShowMessage('Configuration file (config.ini) not found!');
    Exit;
  end;

  Ini   := TIniFile.Create(sPath);
  try
    FDConnection.Params.Values['Server']    := Ini.ReadString('Database', 'Server', 'localhost');
    FDConnection.Params.Values['Port']      := Ini.ReadString('Database', 'Port', '5432');
    FDConnection.Params.Values['User_Name'] := Ini.ReadString('Database', 'User', '');
    FDConnection.Params.Values['Password']    := Ini.ReadString('Database', 'Password', '');
  finally
    Ini.Free;
  end;
end;

end.
