unit User;

interface
uses
  System.SysUtils;
type
  TUser = class

  private
    sName: string;
    sEmail: string;
    iUserID: integer;
    sCode: string;
  public
    property ID: integer read iUserID write iUserID;
    property Name: string read sName write sName;
    property Email: string read sEmail write sEmail;
    property Code: string read sCode write sCode;
  end;

implementation

end.
