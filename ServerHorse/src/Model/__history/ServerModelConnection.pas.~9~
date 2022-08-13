unit ServerModelConnection;

interface

uses

FireDAC.Stan.Intf,
FireDAC.Stan.Option,
FireDAC.Stan.Error,
FireDAC.UI.Intf,
FireDAC.Phys.Intf,
FireDAC.Stan.Def,
FireDAC.Stan.Pool,
FireDAC.Stan.Async,
FireDAC.Phys,
FireDAC.VCLUI.Wait,
Data.DB,
FireDAC.Comp.Client,
FireDAC.DApt,
FireDAC.Phys.OracleDef,
FireDAC.Phys.Oracle;

var
FConn : TFDConnection;

function Connected : TFDConnection;
procedure Disconnected;

implementation


function Connected : TFDConnection;
begin

  FConn := TFDConnection.Create(nil);
  FConn.Params.DriverID := 'Ora';
  FConn.Params.Database := 'xe';
  FConn.Params.UserName := 'system';
  FConn.Params.Password := '041680861Arf';
  FConn.Params.Add('Port=1521');
  FConn.Params.Add('Server=localhost');
  FConn.TxOptions.AutoCommit := False;
  FConn.Connected;
  Result := FConn;

end;

procedure Disconnected;
begin

  if Assigned(FConn) then
  begin
    FConn.Connected := False;
    FConn.Free;
  end;

end;

end.
