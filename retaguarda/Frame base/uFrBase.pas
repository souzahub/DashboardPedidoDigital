unit uFrBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniSweetAlert, uniScreenMask, uniLabel,
  uniPanel, uniScrollBox, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  UniFSButton, uniEdit, uniPageControl, uniGUIBaseClasses, uniImageList,
  Data.DB, uniRadioGroup, uniDBText, uniMemo, uniDBEdit, uniFileUpload, UniFSiGrowl,
  uniMultiItem, uniListBox, UniFSToast, uniComboBox, UniFSCombobox,
  uniCheckBox, uniDateTimePicker, ACBrBase, ACBrValidador, uniSpinEdit,
  frxClass, frxDBSet, frxGradient, frxExportBaseDialog, frxExportPDF,
  uniGroupBox;

type
  TfrCadCliente = class(TUniFrame)
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    Tab2: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniScrollBox2: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    cpBusca: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    EdPesquisar: TUniEdit;
    UniFSButton1: TUniFSButton;
    BtInc: TUniFSButton;
    BtAlt: TUniFSButton;
    BtExc: TUniFSButton;
    BtGrv: TUniFSButton;
    BtCan: TUniFSButton;
    pnFormCliente: TUniPanel;
    panelCValorTarifa: TUniPanel;
    lbFornec: TUniLabel;
    frameFornec: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure BtIncClick(Sender: TObject);
    procedure BtAltClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGrvClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);

  private
    { Private declarations }
    xIncluindo, xDeletando, xEditando, xSoAlerta, xSalvando, xAprovar, xRecusar : Boolean;

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses  ServerModule, uniImage, Main, uDados;

procedure TfrCadCliente.BtAltClick(Sender: TObject);
begin
  xSoAlerta := False;
    xIncluindo := False;
    xEditando := True;
    xDeletando := False;


// Visualizando a Tab2
    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
    PageCadastro.Pages[0].TabVisible := False ;
    PageCadastro.Pages[1].TabVisible := True ;

 // Visualizando Botao do Crud
    BtInc.Enabled := False;
    BtAlt.Enabled := False;
    BtExc.Enabled := False;
    BtGrv.Enabled := True;
    BtCan.Enabled := True;

end;

procedure TfrCadCliente.BtCanClick(Sender: TObject);
begin
   dmDados.RDWFornec.Cancel;
   PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
   PageCadastro.Pages[0].TabVisible := True ;
   PageCadastro.Pages[1].TabVisible := False ;

   // Visualizando Botao do Crud
   BtInc.Enabled := True;
   BtAlt.Enabled := True;
   BtExc.Enabled := True;
   BtGrv.Enabled := False;
   BtCan.Enabled := False;
   dmDados.RDWFornec.Close();
   dmDados.RDWFornec.Open();

   btAlt.Enabled := dmDados.RDWFornec.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
   btExc.Enabled := dmDados.RDWFornec.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado

end;

procedure TfrCadCliente.BtExcClick(Sender: TObject);
begin
  //  Confirmacao da exclusao com SweetAlert1
     xSoAlerta := False;
     xIncluindo := False;
     xEditando := False;
     xDeletando := True;

end;

procedure TfrCadCliente.BtGrvClick(Sender: TObject);
begin
//     //  usando  SweetAlert1
//       if EditNomeFornec.Text = '' then
//    begin
//      xSoAlerta := True;   // bloqueia alerta
//      UniSweetAlert1.Title := ('Campo Obrigatório');
//      UniSweetAlert1.AlertType := atInfo;
//      UniSweetAlert1.ShowConfirmButton := False;
//      UniSweetAlert1.ShowCancelButton := True;
//      UniSweetAlert1.CancelButtonText := 'Ok';
//      UniSweetAlert1.Show('Digite o Nome do Fornecedor');
//      exit;
//    end;
//
//      if uEditCNPJFornec.Text = '' then
//    begin
//      xSoAlerta := True;   // bloqueia alerta
//      UniSweetAlert1.Title := ('Campo Obrigatório');
//      UniSweetAlert1.AlertType := atInfo;
//      UniSweetAlert1.ShowConfirmButton := False;
//      UniSweetAlert1.ShowCancelButton := True;
//      UniSweetAlert1.CancelButtonText := 'Ok';
//      UniSweetAlert1.Show('Informe o CNPJ');
//      exit;
//
//    end;
//
//     //  Salvando com SweetAlert1
//    xSoAlerta := False;
//    UniSweetAlert1.Title := 'Deseja salvar o Fornecedor ?';
//    UniSweetAlert1.AlertType := atQuestion;
//    UniSweetAlert1.ShowConfirmButton := True;
//    UniSweetAlert1.ConfirmButtonText := 'Sim';
//    UniSweetAlert1.ShowCancelButton := True;
//    UniSweetAlert1.CancelButtonText := 'Não';
//    UniSweetAlert1.Show( EditNomeFornec.Text );

    BtInc.Enabled := True;
    BtAlt.Enabled := True;
    BtExc.Enabled := True;
    BtGrv.Enabled := False;
    BtCan.Enabled := False;
    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
    PageCadastro.Pages[0].TabVisible := True ;
    PageCadastro.Pages[1].TabVisible := False ;

end;

procedure TfrCadCliente.BtIncClick(Sender: TObject);
begin
   xSoAlerta := False;
     xIncluindo := True;
     xEditando := False;

     PageCadastro.ActivePage := Tab2 ;

         // Visualizando a Tab2
     PageCadastro.Pages[0].TabVisible := False ;
     PageCadastro.Pages[1].TabVisible := Visible ;

      // Visualizando Botao do Crud
     BtInc.Enabled := False;
     BtAlt.Enabled := False;
     BtExc.Enabled := False;
     BtGrv.Enabled := True;
     BtCan.Enabled := True;
     EdPesquisar.Clear;

end;

procedure TfrCadCliente.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica na tabela Usuario
     dmDados.RDWFornec.SQL.Clear;
     dmDados.RDWFornec.SQL.Add('select * from FORNEC where');
     dmDados.RDWFornec.SQL.Add('(DESCRICAO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
     dmDados.RDWFornec.SQL.Add('or ID LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
     dmDados.RDWFornec.SQL.Add('or CGC LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
     dmDados.RDWFornec.SQL.Add(')order by DESCRICAO');
     dmDados.RDWFornec.Open;
end;

procedure TfrCadCliente.UniFrameCreate(Sender: TObject);
begin
    dmDados.RDWFornec.Open;
    btAlt.Enabled := dmDados.RDWFornec.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
    btExc.Enabled := dmDados.RDWFornec.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado


    PageCadastro.Pages[0].TabVisible := True  ;
    PageCadastro.Pages[1].TabVisible := False ;
    BtInc.Enabled := True;
    BtGrv.Enabled := False;
    BtCan.Enabled := False;
    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
end;

procedure TfrCadCliente.UniFSButton1Click(Sender: TObject);
begin
 EdPesquisarChange(Sender);
end;

end.



