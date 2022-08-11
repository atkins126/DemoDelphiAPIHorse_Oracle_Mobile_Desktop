unit ClienteController;

interface

uses 
Horse,
System.JSON,
System.SysUtils,
ClienteModel,
FireDAC.Comp.Client,
Data.DB,
DataSet.Serialize;


procedure Registry;
procedure listCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure addCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure deleteCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure updateCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);

procedure findClienteId(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation



procedure listCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli : TCliente;
  query : TFDQuery;
  erro : string;
  arrayClientes : TJSONArray;
begin

  try
     cli := TCliente.Create;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;

  try
     query := cli.ListarCliente('', erro);
     arrayClientes := query.ToJSONArray();
     Res.Send<TJSONArray>(arrayClientes);
  finally
     query.Free;
     cli.Free;
  end;

end;

procedure findClienteId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli : TCliente;
  query : TFDQuery;
  erro : string;
  clienteObject : TJSONObject;
begin

  try
     cli := TCliente.Create;
     cli.CLIENTE_ID := Req.Params['id'].ToInteger;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;

  try
     query := cli.ListarCliente('', erro);

     if query.RecordCount > 0 then
     begin
       clienteObject := query.ToJSONObject;
       Res.Send<TJSONObject>(clienteObject);
     end
     else
     begin
        Res.Send('Cliente nao encontrado.').Status(404);
     end;


  finally
     query.Free;
     cli.Free;
  end;

end;

procedure addCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli : TCliente;
  query : TFDQuery;
  erro : string;
  clienteObject : TJSONObject;
  body : TJSONValue;
begin

    try
     cli := TCliente.Create;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;



  try

      try
        body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJSONValue;

        cli.RAZAO_SOCIAL := body.GetValue<string>('razao','');
        cli.EMAIL := body.GetValue<string>('email','');
        cli.Inserir(erro);

        body.Free;

        if erro <> '' then
          raise Exception.Create(erro);

      except on ex:exception do
      begin
          Res.Send(ex.Message).Status(400);
          exit;
      end;

      end;


  finally

  end;



  Res.Send('Add Clientes');
end;

procedure deleteCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send('Delete Clientes');
end;

procedure updateCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send('Update Clientes');
end;

procedure Registry;
begin
    THorse.Get('/cliente', listCliente);
    THorse.Get('/cliente/:id', findClienteId);
    THorse.Post('/cliente', addCliente);
    THorse.Put('/cliente', updateCliente);
    THorse.Delete('/cliente', deleteCliente);

end;

end.