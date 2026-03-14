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
    property Id: integer read iID write iId;
    property Code: string read sCode write sCode;
    property Name: string read sName write sName;
  end;
implementation

end.
