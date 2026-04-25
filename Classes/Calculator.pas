unit Calculator;

interface
uses
  System.SysUtils, CalculatorInterface;
type
  TCalculator = class(TInterfacedObject, ICalculator)

    function add(A, B: integer): integer;
  end;

implementation

{ TCalculator }

function TCalculator.add(A, B: integer): integer;
begin
  Result := A + B;
end;

end.
