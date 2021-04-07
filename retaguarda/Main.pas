unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniTreeView, uniTreeMenu,
  uniSweetAlert, uniStatusBar, uniScreenMask, uniGUIBaseClasses,
  uniImageList, Vcl.Menus, uniMainMenu, uniPanel, uniLabel,
  Vcl.Imaging.pngimage, uniImage, uniScrollBox, uniPageControl, frxClass,
  frxExportBaseDialog, frxExportPDF, frxGradient, frxDBSet, uniGUIFrame,
  uniButton, uniBitBtn, uniMenuButton, UniFSMenuButton, DB, UniFSButton,
  uniEdit, unimImage, Dashboard.Infobox, uniHTMLFrame, uniURLFrame,
  UniFSCalcEdit, Utils;

type
  TMainForm = class(TUniForm)
    frxGradientObject1: TfrxGradientObject;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    UniNativeImageList1: TUniNativeImageList;
    UniStatusBar1: TUniStatusBar;
    UniSweetAlert1: TUniSweetAlert;
    frxDBDataset1: TfrxDBDataset;
    Popup1: TUniPopupMenu;
    Usuarios1: TUniMenuItem;
    Log2: TUniMenuItem;
    Sair1: TUniMenuItem;
    paBackGround: TUniContainerPanel;
    PagePrincipal: TUniPageControl;
    TabHome: TUniTabSheet;
    paGeral: TUniContainerPanel;
    UniPanel1: TUniPanel;
    UniImage1: TUniImage;
    Frame: TUniURLFrame;
    uFramHtml: TUniHTMLFrame;
    UniTreeMenu1: TUniTreeMenu;
    PnlTop: TUniPanel;
    pnLogo: TUniPanel;
    lbTitulo: TUniLabel;
    imgIcone: TUniImage;
    UniFSButton2: TUniFSButton;
    UniFSMenuButton2: TUniFSMenuButton;
    UniMenuItems1: TUniMenuItems;
    E1: TUniMenuItem;
    mnuGrupos: TUniMenuItem;
    mnuProdutos: TUniMenuItem;
    lbOla: TUniLabel;
    procedure UniFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure Sair1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure RegistraLog(Tipo: String; Historico: String);
    procedure Log2Click(Sender: TObject);
    procedure DashBoardClick(Sender: TObject);// procedure gravar log
    procedure AtualizaDados;
    procedure UniFormShow(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject); //atualizar dados html
  private
    FInfobox : IInfobox; // Declaração...
    FValor1, FValor2, FValor3, FValor4 : string;
    //x----, x----, x---, x---- : string; // para direcionara ao total pelos cards
    procedure ToogleMenu; // redimenciona lateral

  public
    { Public declarations }
    vADMIN, vUSUARIO : Boolean;  // Administrador
    xUsuario : string; // variavel para chamr o nome do usuario logado

  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uFrCadastroUsuario, uDados, uFrLogSys;


function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ToogleMenu; // redimenciona lateral
begin

  if UniTreeMenu1.Width > 50 then
  begin
    UniTreeMenu1.Micro   := true;
    pnLogo.Width := 50;
  end else
  begin

    pnLogo.ClientEvents.UniEvents.Clear;

    UniTreeMenu1.Micro := false;

    pnLogo.ClientEvents.UniEvents.Add('resize=function resize(sender, width, height, oldWidth, oldHeight, eOpts)'+
                                      '{sender.cls="animated zoomIn";}');

    pnLogo.Width :=  221;
    pnLogo.Repaint;
  end;

end;

procedure TMainForm.AtualizaDados; //atualizar dados html
begin
  FInfobox := TInfobox.Init; // Instância | Instance

  //procedure para total nos cards
//   *
//   *
//   *


    // Dados do seu Banco/Consulta | Data from your Database/Query:
  FValor1 := '1' ; // recebe o valor 1
  FValor2 := '2'; // recebe o valor 2
  FValor3 := '3'; // recebe o valor 3
  FValor4 := '4'; // recebe o valor 4

  Frame.HTML.Text :=
    FInfobox
      .Valor1(FValor1)
      .Valor2(FValor2)
      .Valor3(FValor3)
      .Valor4(FValor4)
        .HTMLView;
end;

procedure TMainForm.RegistraLog(Tipo: String; Historico: String);  // procedure gravar log
var
  xERRO: String;
begin
  exit;
  // registra o log ( função Log ) para todos
  dmDados.FDAuxiliar.Close;
  dmDados.FDAuxiliar.SQL.Clear;
  dmDados.FDAuxiliar.SQL.Add('INSERT into LOGSYS values (NULL, :vDIA, :vLOGIN, :vOPERACAO, :vOCORRENCIA )');
  // DIA
  dmDados.FDAuxiliar.Params[0].DataType := ftDateTime;
  dmDados.FDAuxiliar.Params[0].Value := DateTimeToStr(now);
  // pega a Data do computador
  // Login
  dmDados.FDAuxiliar.Params[1].DataType := ftString;
  dmDados.FDAuxiliar.Params[1].Value := MainModule.UniMainModule.xUsuario;
  // pega o usuario na entrada do sistema ( usuario global )
  // operação
  dmDados.FDAuxiliar.Params[2].DataType := ftString;
  dmDados.FDAuxiliar.Params[2].Value := Tipo; // pega esse valor para a função
  // Ocorrencia
  dmDados.FDAuxiliar.Params[3].DataType := ftString;
  dmDados.FDAuxiliar.Params[3].Value := Historico;
  // pega esse valor para a função

  dmDados.FDAuxiliar.ExecSQL(xERRO);

  dmDados.FDLogSys.Close;
  dmDados.FDLogSys.Open;
end;

// frame lateral
procedure TMainForm.DashBoardClick(Sender: TObject);
begin
  PagePrincipal.ActivePage := TabHome; // ativa pagina Principal
end;

procedure TMainForm.Log2Click(Sender: TObject);
begin
  if (not MainModule.UniMainModule.vADMIN) then exit;
  AddTab(PagePrincipal,TFrame(TfrLogSys),'log Sys');
end;

procedure TMainForm.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.UniFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin
      // resposividade na tela
  Self.Left := Round((AWidth / 2)  - (Self.Width / 2));
  Self.Top  := Round((AHeight / 2) - (Self.Height / 2));
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
   AtualizaDados; //atualizar dados html
end;

procedure TMainForm.UniFSButton1Click(Sender: TObject);
begin
  ToogleMenu;
//  UniTreeMenu1.Micro := not UniTreeMenu1.Micro;
end;

procedure TMainForm.Usuarios1Click(Sender: TObject);
begin
    AddTab(PagePrincipal,TFrame(TfrCadastroUsuario),'Usuário');
end;

// fim

initialization
  RegisterAppFormClass(TMainForm);

end.
