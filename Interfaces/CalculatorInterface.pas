unit CalculatorInterface;

interface
uses
  System.SysUtils;
type
  ICalculator = interface
  function add(A, B: integer): integer;
  end;

implementation

end.
