unit JikanAPI;

interface

uses
  System.Types, System.Classes, System.SysUtils, System.JSON, Rest.Client,
  Rest.Types, JikanAPI.Types;

type
  TJikanAPI = class
  private
  { Private Const }
    const
      BASE_URL = 'https://api.jikan.moe/v4';
  private
    { Private Methods }
    function SetupRestRequest(const ResourcePath: string = ''): TRESTRequest;
  public
    { Public Methods }
    function SearchAnime(const SearchText: string): TArray<TShowSearchItem>;
  end;

implementation

{ TJikanAPI }

function TJikanAPI.SearchAnime(const SearchText: string): TArray<TShowSearchItem>;
begin
  var rest := Self.SetupRestRequest('/anime');
  try
    rest.Params.AddItem('q', SearchText, pkQUERY);

    rest.Execute;

    var I := 0;
    SetLength(Result, (rest.Response.JSONValue.FindValue('data') as TJSONArray).Count);
    for var jAnime in rest.Response.JSONValue.FindValue('data') as TJSONArray do
    begin
      Result[I].ID := jAnime.GetValue<Integer>('mal_id', -1).ToString;
      Result[I].URL := jAnime.GetValue<string>('url', '');
      Result[I].Title := jAnime.GetValue<string>('title', '');
      Result[I].Title_English := jAnime.GetValue<string>('title_english', '');
      Result[I].Description := jAnime.GetValue<string>('synopsis', '');
      Result[I].Year := jAnime.GetValue<Integer>('year', -1);
      Result[I].Episodes := jAnime.GetValue<Integer>('episodes', -1);

      Inc(I);
    end;
  finally
    rest.Free;
  end;
end;

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

