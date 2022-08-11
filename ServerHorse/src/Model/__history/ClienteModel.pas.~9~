unit ClienteModel;

interface

uses FireDAC.Comp.Client, Data.DB, System.SysUtils, ServerModelConnection;

type

    TCliente = class

    private
      FCLIENTE_ID: Integer;
      FRAZAO_SOCIAL: String;
      FEMAIL: String;

    public
      constructor Create;
      destructor Destroy; override;

      property CLIENTE_ID: Integer read FCLIENTE_ID write FCLIENTE_ID;
      property RAZAO_SOCIAL: String read FRAZAO_SOCIAL write FRAZAO_SOCIAL;
      property EMAIL: String read FEMAIL write FEMAIL;

      function ListarCliente(order_by: string; out erro: string) : TFDQuery;
      function Inserir(out erro: string) : Boolean;
      function Excluir(out erro: string) : Boolean;

    end;

implementation


{ TCliente }

constructor TCliente.Create;
begin
   ServerModelConnection.Connected;
end;

destructor TCliente.Destroy;
begin
   ServerModelConnection.Disconnected;
end;

function TCliente.Excluir(out erro: string): Boolean;
begin
  //
end;

function TCliente.Inserir(out erro: string): Boolean;
begin
    //
end;

function TCliente.ListarCliente(order_by: string; out erro: string): TFDQuery;
var
  query : TFDQuery;
begin
   //
   try

     query := TFDQuery.Create(Nil);
     query.Connection := ServerModelConnection.FConn;

     with query do
     begin
       Active := False;
       SQL.Clear;
       SQL.Add('SELECT * FROM CLIENTE WHERE 1 = 1');

       if CLIENTE_ID > 0 then
       begin
         SQL.Add('AND CLIENTE_ID = :CLIENTE_ID');
         ParamByName('CLIENTE_ID').Value := CLIENTE_ID;
       end;

       if order_by = '' then
       begin
         SQL.Add('ORDER BY RAZAO_SOCIAL');
       end
       else
       begin
         SQL.Add('ORDER BY ' + order_by);
       end;

       Active := True;

     end;

     erro := '';
     Result := query;

     except on ex:exception do
     begin
         erro := 'Erro ao consultar cliente: ' + ex.Message;
         Result := nil;
     end;

   end;

end;

end.
