program ProjectDesktop;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  RelClientes in 'Relatorios\RelClientes.pas' {frmRelClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmRelClientes, frmRelClientes);
  Application.Run;
end.
