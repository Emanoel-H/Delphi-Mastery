unit Person;

interface
uses
  System.SysUtils;
type
  TPerson = class
    private
      sName: string;

    public
      property Name: string read sName write sName;
      function GetDescription: string; virtual;
  end;
implementation

{ TPerson }

function TPerson.GetDescription: string;
begin
  Result := 'Person: ' + sName;
end;

end.
