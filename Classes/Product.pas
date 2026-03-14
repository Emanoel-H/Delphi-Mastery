unit Product;

interface
uses
  System.SysUtils, Category;
type
  TProduct = class

  private
    iId: integer;
    sCode: string;
    sName: string;
    cPrice: currency;
    FCategory: TCategory;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: integer read iID write iId;
    property Code: string read sCode write sCode;
    property Name: string read sName write sName;
    property Price: currency read cPrice write cPrice;
    property Category: TCategory read FCategory write FCategory;
  end;
implementation

{ TProduct }

constructor TProduct.Create;
begin
  Category := TCategory.Create;
end;

destructor TProduct.Destroy;
begin
  Category.Free;
  inherited;
end;

end.
