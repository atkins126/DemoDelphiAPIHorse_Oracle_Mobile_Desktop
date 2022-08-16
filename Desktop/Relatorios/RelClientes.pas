unit RelClientes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RLReport,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  RESTRequest4D,
  DataSet.Serialize,
  DataSet.Serialize.Config;

type
  TfrmRelClientes = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    FDMemTable1: TFDMemTable;
    FDMemTable1CLIENTE_ID: TIntegerField;
    FDMemTable1RAZAO_SOCIAL: TStringField;
    FDMemTable1EMAIL: TStringField;
    DataSource1: TDataSource;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

{$R *.dfm}

procedure TfrmRelClientes.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  //
   TRequest.New.BaseURL('http://localhost:9000/cliente')
    .Accept('application/json')
    .DataSetAdapter(FDMemTable1)
    .Get;
end;

end.
