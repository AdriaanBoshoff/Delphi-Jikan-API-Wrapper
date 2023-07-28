program Jikan_API_Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  JikanAPI in 'Jikan_API\JikanAPI.pas',
  JikanAPI.Types in 'Jikan_API\JikanAPI.Types.pas';

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

begin
  try
    Main;

    ReadLn;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      ReadLn;
    end;
  end;
end.

