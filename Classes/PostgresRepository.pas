unit PostgresRepository;

interface
uses
  System.SysUtils, IRepository;
type
  TPostgresRepository = class(TInterfacedObject, Repository)

  procedure Save;
  procedure Delete;
  end;

implementation

{ TPostgresRepository }

procedure TPostgresRepository.Delete;
begin

end;

procedure TPostgresRepository.Save;
begin

end;

end.
