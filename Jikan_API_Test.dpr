program Jikan_API_Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  JikanAPI in 'Jikan_API\JikanAPI.pas',
  JikanAPI.Types in 'Jikan_API\JikanAPI.Types.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      ReadLn;
    end;
  end;
end.

