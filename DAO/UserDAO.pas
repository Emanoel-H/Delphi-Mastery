unit UserDAO;

interface
uses
  SysUtils, Classes, System.Generics.Collections, Dialogs,
  DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, REST.Json,
  FireDAC.Stan.Param, FireDAC.Phys.PG, dmMain, User, System.JSON;

type
  TUserDAO = class

  private

  public
    function getUserByJSON(JSON: string): TUser;
    function isJSON(JSON: string): boolean;
    function loadUsers(JSONResponse: string): TObjectList<TUser>;
  end;


implementation

{ TUserDAO }


function TUserDAO.getUserByJSON(JSON: string): TUser;
var
  User: TUser;
begin
  try
    User := TJson.JsonToObject<TUser>(JSON);

    Result := User;
  except
    on E: Exception do
    begin
      User.Free;
    end;
  end;
end;

function TUserDAO.isJSON(JSON: string): boolean;
var
   JSONValue: TJSONValue;
begin
  try
    JSONValue := TJSONObject.ParseJSONValue(JSON);

    Result := Assigned(JSONValue);
  finally
    JSONValue.Free;
  end;
end;

function TUserDAO.loadUsers(JSONResponse: string): TObjectList<TUser>;
var
  UserList: TObjectList<TUser>;
  iCount: Integer;
  JSONArray: TJSONArray;
begin
  Result := TObjectList<TUser>.Create;
  try
    JSONArray := TJSONObject.ParseJSONValue(JSONResponse) as TJSONArray;

    if Assigned(JSONArray) then
    try
      for iCount := 0 to JSONArray.Count - 1 do
        Result.Add(TJson.JsonToObject<TUser>(JSONArray.Items[iCount].ToString));
    finally
      JSONArray.Free;
    end;
  except
    on E: EJSONException do
    begin
      ShowMessage('Erro: Você inseriu algum JSON inválido.');
      Result.Free;
    end;
  end;
end;

end.
