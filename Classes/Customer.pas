unit Customer;

interface
uses
  System.SysUtils;
type
  TCustomer = class

  private
    iCustomerID: integer;
    sName: string;
    sEmail: string;
    cCreditLimit: currency;
  public
    property CustomerID: integer read iCustomerID write iCustomerID;
    property Name: string read sName write sName;
    property Email: string read sEmail write sEmail;
    property CreditLimit: currency read cCreditLimit write cCreditLimit;
  end;
implementation

end.
