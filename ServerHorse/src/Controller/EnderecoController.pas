unit EnderecoController;

interface

uses
Horse,
System.JSON,
System.SysUtils,
EnderecoModel,
FireDAC.Comp.Client,
Data.DB,
DataSet.Serialize;


procedure Registry;
procedure listEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure addEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure deleteEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure updateEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);

procedure findEnderecoId(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure listEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  endereco : TEndereco;
  query : TFDQuery;
  erro : string;
  arrayEnderecos : TJSONArray;
begin

  try
     endereco := TEndereco.Create;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;

  try
     query := endereco.ListarEndereco('', erro);
     arrayEnderecos := query.ToJSONArray();
     Res.Send<TJSONArray>(arrayEnderecos);
  finally
     query.Free;
     endereco.Free;
  end;

end;

procedure findEnderecoId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  endereco : TEndereco;
  query : TFDQuery;
  erro : string;
  enderecoObject : TJSONObject;
begin

  try
     endereco := TEndereco.Create;
     endereco.ENDERECO_ID := Req.Params['id'].ToInteger;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;

  try
     query := endereco.ListarEndereco('', erro);

     if query.RecordCount > 0 then
     begin
       enderecoObject := query.ToJSONObject;
       Res.Send<TJSONObject>(enderecoObject);
     end
     else
     begin
        Res.Send('Endereco nao encontrado.').Status(404);
     end;


  finally
     query.Free;
     endereco.Free;
  end;

end;

procedure addEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  endereco : TEndereco;
  query : TFDQuery;
  erro : string;
  enderecoObject : TJSONObject;
  body : TJSONValue;
begin

  try
     endereco := TEndereco.Create;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;

  try

      try
        body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJSONValue;

        endereco.RUA        := body.GetValue<string>('RUA','');
        endereco.NUMERO     := body.GetValue<string>('NUMERO','');
        endereco.BAIRRO     := body.GetValue<string>('BAIRRO','');
        endereco.CIDADE     := body.GetValue<string>('CIDADE','');
        endereco.UF         := body.GetValue<string>('UF','');
        endereco.CEP        := body.GetValue<string>('CEP','');
        endereco.CLIENTE_ID := StrToInt(body.GetValue<string>('CLIENTE_ID',''));


        endereco.Inserir(erro);

        body.Free;

        if erro <> '' then
          raise Exception.Create(erro);

      except on ex:exception do
        begin
            Res.Send(ex.Message).Status(400);
            exit;
        end;

      end;

      enderecoObject := TJSONObject.Create;
      enderecoObject.AddPair('ENDERECO_ID', endereco.ENDERECO_ID.ToString);
      Res.Send<TJSONObject>(enderecoObject).Status(201);

  finally
    endereco.Free;

  end;

  Res.Send('Add Clientes');
end;

procedure deleteEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  endereco : TEndereco;
  erro : string;
  enderecoObject : TJSONObject;
begin


  try
     endereco := TEndereco.Create;
     endereco.ENDERECO_ID := Req.Params['id'].ToInteger;
  except
     Res.Send('Erro ao conectar-se com o banco.').Status(500);
     exit;
  end;


  try

    try
      endereco.ENDERECO_ID := Req.Params['id'].ToInteger;

      if NOT endereco.Excluir(erro) then
        raise Exception.Create(erro);


    except on ex:exception do
      begin
          Res.Send(ex.Message).Status(400);
          exit;
      end;

    end;

    enderecoObject := TJSONObject.Create;
    enderecoObject.AddPair('ENDERECO_ID', endereco.ENDERECO_ID.ToString);

    Res.Send<TJSONObject>(enderecoObject);

  finally

    endereco.Free;

  end;


  Res.Send('Delete Clientes');
end;

procedure updateEndereco(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    endereco : TEndereco;
    objEndereco: TJSONObject;
    erro : string;
    body : TJsonValue;
begin
    // Conexao com o banco...
    try
        endereco := TEndereco.Create;
    except
        res.Send('Erro ao conectar com o banco').Status(500);
        exit;
    end;

    try
        try
            body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJsonValue;

            endereco.ENDERECO_ID  := body.GetValue<integer>('ENDERECO_ID', 0);
            endereco.RUA          := body.GetValue<string>('RUA','');
            endereco.NUMERO       := body.GetValue<string>('NUMERO','');
            endereco.BAIRRO       := body.GetValue<string>('BAIRRO','');
            endereco.CIDADE       := body.GetValue<string>('CIDADE','');
            endereco.UF           := body.GetValue<string>('UF','');
            endereco.CEP          := body.GetValue<string>('CEP','');
            endereco.CLIENTE_ID   := StrToInt(body.GetValue<string>('CLIENTE_ID',''));

            endereco.Atualizar(erro);

            body.Free;

            if erro <> '' then
                raise Exception.Create(erro);

        except on ex:exception do
            begin
                res.Send(ex.Message).Status(400);
                exit;
            end;
        end;


        objEndereco := TJSONObject.Create;
        objEndereco.AddPair('ENDERECO_ID', endereco.ENDERECO_ID.ToString);

        res.Send<TJSONObject>(objEndereco).Status(200);
    finally
        endereco.Free;
    end;
end;

procedure Registry;
begin
    THorse.Get('/endereco', listEndereco);
    THorse.Get('/endereco/:id', findEnderecoId);
    THorse.Post('/endereco', addEndereco);
    THorse.Put('/endereco', updateEndereco);
    THorse.Delete('/endereco/:id', deleteEndereco);

end;


end.
