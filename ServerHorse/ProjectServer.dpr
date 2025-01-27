program ProjectServer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DataSet.Serialize,
  DataSet.Serialize.Config,
  Horse.Jhonson,
  Horse,
  ServerModelConnection in 'src\Model\ServerModelConnection.pas',
  ClienteController in 'src\Controller\ClienteController.pas',
  ClienteModel in 'src\Model\ClienteModel.pas',
  EnderecoModel in 'src\Model\EnderecoModel.pas',
  EnderecoController in 'src\Controller\EnderecoController.pas';

var
    App : THorse;
begin

    THorse.Use(Jhonson());

    TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.cndNone;

    //Com apenas essa linha toda a rota de clientes esta registrada
    ClienteController.Registry;
    EnderecoController.Registry;

    //A linha acima � para evitar acumulo de rotas como est� abaixo
    THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin

      ServerModelConnection.Connected;
      ServerModelConnection.Disconnected;
      Res.Send('pong');

    end);

  THorse.Listen(9000);

end.
