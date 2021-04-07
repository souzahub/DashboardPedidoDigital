unit uFrLogSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniEdit, uniPanel, uniBasicGrid,
  uniDBGrid, uniGUIBaseClasses, uniScrollBox, Data.DB, uniButton,
  uniBitBtn, UniFSButton;

type
  TfrLogSys = class(TUniFrame)
    dsConulta: TDataSource;
    UniScrollBox1: TUniScrollBox;
    UniDBGrid1: TUniDBGrid;
    PnlCrud: TUniPanel;
    UniLabel1: TUniLabel;
    EdPesquisar: TUniEdit;
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDados, Main;



procedure TfrLogSys.EdPesquisarChange(Sender: TObject);
begin
  // pesquisa dinamica na tabela LOG
  dmDados.FDLogSys.SQL.Clear;
  dmDados.FDLogSys.SQL.Add('select * from LOGSYS where');
  dmDados.FDLogSys.SQL.Add('(LOGIN LIKE  ' +QuotedStr('%' + EdPesquisar.Text + '%'));
  dmDados.FDLogSys.SQL.Add('or OPERACAO LIKE  ' +QuotedStr('%' + EdPesquisar.Text + '%'));
  dmDados.FDLogSys.SQL.Add('or DIA LIKE  ' +QuotedStr('%' + EdPesquisar.Text + '%'));
  dmDados.FDLogSys.SQL.Add(')order by ID desc');
  dmDados.FDLogSys.Open;

end;

procedure TfrLogSys.UniFrameCreate(Sender: TObject);
begin
 EdPesquisarChange(Sender);
end;

end.
