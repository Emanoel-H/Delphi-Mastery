unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList;

type
  TDataModule1 = class(TDataModule)
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection: TFDConnection;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
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

end.
