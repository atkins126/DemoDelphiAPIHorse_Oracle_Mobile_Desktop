unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RESTRequest4D, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DataSet.Serialize, System.JSON;

type
  TForm1 = class(TForm)
    Button1: TButton;
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL('http://127.0.0.1:9000/cliente')
    .Accept('application/json')
    .Get;
  if LResponse.StatusCode = 200 then
    ShowMessage(LResponse.Content);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TRequest.New.BaseURL('http://localhost:9000/cliente')
    .Accept('application/json')
    .DataSetAdapter(FDMemTable1)
    .Get;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
LJSONObject: TJSONObject;
begin
   LJSONObject := FDMemTable1.ToJSONObject();
   Memo1.Lines.Clear;
   Memo1.Lines.Add(LJSONObject.ToString);
end;

end.
