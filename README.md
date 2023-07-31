# Delphi-Jikan-API-Wrapper

Example Delphi implementation of the Jikan Rest API.

# Important

I'm not sure if I'll ever finish this. I only implemenented the functionality I required.

## Search Anime

```delphi
procedure Main;
begin
  var api := TJikanAPI.Create;
  try
    for var aShow in api.SearchAnime('Attack on titan') do
    begin
      if not aShow.Title_English.Trim.IsEmpty then
      begin
        WriteLn(aShow.Title_English);
      end
      else
      begin
        Writeln(aShow.Title);
      end;
    end;
  finally
    api.Free;
  end;
end;
```
