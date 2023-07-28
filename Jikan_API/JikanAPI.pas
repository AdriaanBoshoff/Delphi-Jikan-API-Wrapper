unit JikanAPI;

interface

uses
  System.Types, System.Classes, System.SysUtils, System.JSON, Rest.Client,
  Rest.Types;

type
  TJikanAPI = class
  private
  { Private Const }
    const
      BASE_URL = 'https://api.jikan.moe/v4';
  private
    { Private Methods }
    function SetupRestRequest(const ResourcePath: string = ''): TRESTRequest;
  end;

implementation

{ TJikanAPI }

function TJikanAPI.SetupRestRequest(const ResourcePath: string): TRESTRequest;
begin
  // Setup Rest Request
  Result := TRESTRequest.Create(nil);
  Result.Client := TRESTClient.Create(Result);
  Result.Response := TRESTResponse.Create(Result);

  // Options
  Result.Client.BaseURL := Self.BASE_URL;
  Result.Resource := ResourcePath;
end;

end.

