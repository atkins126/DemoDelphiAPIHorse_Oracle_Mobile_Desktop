unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RESTRequest4D, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DataSet.Serialize, System.JSON, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  DataSet.Serialize.Config;

type
  TForm1 = class(TForm)
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button4: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    FDMemTable1CLIENTE_ID: TIntegerField;
    FDMemTable1RAZAO_SOCIAL: TStringField;
    FDMemTable1EMAIL: TStringField;
    Button5: TButton;
    Button6: TButton;
    Excluir: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure buscaClientes;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  urlServidor : String;

implementation

{$R *.dfm}

procedure TForm1.buscaClientes;
begin
    TRequest.New.BaseURL(urlServidor + '/cliente')
    .Accept('application/json')
    .DataSetAdapter(FDMemTable1)
    .Get;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  buscaClientes;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  FDMemTable1.Cancel;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  FDMemTable1.Insert;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
LJSONObject: TJSONObject;
begin

   FDMemTable1.Post;
   LJSONObject := FDMemTable1.ToJSONObject();


   if (FDMemTable1CLIENTE_ID.AsInteger > 0) then
   begin
       TRequest.New.BaseURL(urlServidor + '/cliente')
      .ContentType('application/json')
      .AddBody(LJSONObject.ToString)
      .Put;
   end
   else
   begin
       TRequest.New.BaseURL(urlServidor + '/cliente')
       .ContentType('application/json')
       .AddBody(LJSONObject.ToString)
       .Post;
   end;

   buscaClientes;

end;

procedure TForm1.ExcluirClick(Sender: TObject);
var
LJSONObject: TJSONObject;
begin

   TRequest.New.BaseURL(urlServidor + '/cliente/' + FDMemTable1CLIENTE_ID.AsInteger.ToString)
  .Delete;

  TRequest.New.BaseURL(urlServidor + '/cliente')
  .Accept('application/json')
  .DataSetAdapter(FDMemTable1)
  .Get;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.cndNone;
  urlServidor :=  'http://localhost:9000';
  buscaClientes;

end;

end.
