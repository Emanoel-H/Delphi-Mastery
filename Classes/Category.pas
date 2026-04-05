unit Category;

interface
uses
  System.SysUtils;
type
  TCategory = class

  private
    iId: integer;
    sCode: string;
    sName: string;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: integer read iID write iId;
    property Code: string read sCode write sCode;
    property Name: string read sName write sName;
  end;
implementation

{ TCategory }

constructor TCategory.Create;
begin

end;

destructor TCategory.Destroy;
begin

  inherited;
end;

end.
