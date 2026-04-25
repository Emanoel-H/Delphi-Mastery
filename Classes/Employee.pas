unit Employee;

interface
uses
  System.SysUtils, Person;
type
  TEmployee = class(TPerson)
  private
    cSalary: Currency;
  public
    property Salary: currency read cSalary write cSalary;
    function GetDescription: string; override;
  end;
implementation

{ TEmployee }

function TEmployee.GetDescription: string;
begin
  Result := 'Employee: ' + Name + #13#10 + 'Salary: ' + CurrToStr(Salary);
end;

end.
