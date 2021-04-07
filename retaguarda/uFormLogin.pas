unit uFormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniEdit, uniLabel,
  Vcl.Imaging.jpeg, uniSpeedButton, uniButton, uniBitBtn, uniPanel,
  uniGUIBaseClasses, uniImage, uniSweetAlert, uniImageList, unimEdit,
  uniScreenMask, UniFSiGrowl, UniFSToast, UniFSEdit, UniFSButton,
  uniMultiItem, uniComboBox, UniFSMaskEdit, Vcl.Imaging.pngimage,
  uniHTMLFrame, System.TypInfo, Soap.WebServExp, Soap.WSDLBind,
  Xml.XMLSchema, Soap.WSDLPub, Utils;

type
  TformLogin = class(TUniLoginForm)
    UniNativeImageList1: TUniNativeImageList;
    UniSweetAlert1: TUniSweetAlert;
    UniScreenMask1: TUniScreenMask;
    FSiGrowl: TUniFSiGrowl;
    imgl20: TUniNativeImageList;
    Toast: TUniFSToast;
    PnlBottom: TUniPanel;
    lbA: TUniLabel;
    lbF: TUniLabel;
    sbConectar: TUniBitBtn;
    sbSair: TUniSpeedButton;
    edSenha: TUniEdit;
    UniLabel4: TUniLabel;
    edUsuario: TUniEdit;
    lbUsuario: TUniLabel;
    UniLabel3: TUniLabel;
    UniImage2: TUniImage;
    UniFSToast1: TUniFSToast;
    procedure lbAClick(Sender: TObject);
    procedure xedSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure UniLoginFormShow(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure edSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure UniLoginFormCreate(Sender: TObject);
    procedure UniFSButton2Click(Sender: TObject);
    procedure sbConectarClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure lbFClick(Sender: TObject);
    procedure UniLoginFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function formLogin: TformLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uDados, Main;

function formLogin: TformLogin;
begin
  Result := TformLogin(UniMainModule.GetFormInstance(TformLogin));
end;

procedure TformLogin.xedSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  sbConectar.SetFocus;
end;

procedure TformLogin.edSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  sbConectar.SetFocus;
end;

procedure TformLogin.lbAClick(Sender: TObject);
begin
  lbF.Visible := True ;
  lbA.Visible := False ;
  edSenha.PasswordChar := #0;

end;

procedure TformLogin.lbFClick(Sender: TObject);
begin
  lbF.Visible := False ;
  lbA.Visible := True;
  edSenha.PasswordChar :=  '*' ;


end;

procedure TformLogin.sbConectarClick(Sender: TObject);
begin

  dmDados.FDUsuario.Open;
  if dmDados.FDUsuario.Locate('LOGIN', EdUsuario.Text, []) then
    begin
    if dmDados.FDUsuarioSENHA.Value <> edSenha.Text then
      begin
      //ShowMessage('ATENÇÃO: USUARIO ou SENHA INVÁLIDA.');
        UniSweetAlert1.InputType := ItNone;
        UniSweetAlert1.AlertType := atWarning;
        UniSweetAlert1.ShowCancelButton := False;
        UniSweetAlert1.ShowConfirmButton := True;
        UniSweetAlert1.Width := 300;
        UniSweetAlert1.Title := 'ATENÇÃO';
        UniSweetAlert1.Show('Usuario / Senha Incorreta');
        edUsuario.SetFocus;
        exit;
      end;

    end
    else
      begin
        //ShowMessage('ATENÇÃO: USUARIO ou SENHA INVÁLIDA.');
        UniSweetAlert1.InputType := ItNone;
        UniSweetAlert1.AlertType := atWarning;
        UniSweetAlert1.ShowCancelButton := False;
        UniSweetAlert1.ShowConfirmButton := True;
        UniSweetAlert1.Width := 300;
        UniSweetAlert1.Title := 'ATENÇÃO';
        UniSweetAlert1.Show('Usuario / Senha Incorreta');
        edUsuario.SetFocus;
        exit;
      end;

    ModalResult := mrOk;

//      MainForm.ExtAlerta('Ola,  '+dmDados.RDWUsuarioNOME.Value, 'Seja Bem Vindo'); // chama o alerta (notificação

  MainForm.xUsuario := edUsuario.Text; // o edit usuario sempre sera o usuario global

  MainForm.lbOla.Text := 'Usuário: '+MainForm.xUsuario; // nome do usuario para troca de senha

  // registra o log de entrada
  MainForm.RegistraLog('LOGIN', 'LOGOU NO SISTEMA');

  MainForm.vADMIN := False;
  if dmDados.FDUsuarioPERFIL.Value = 'ADMINISTRADOR' then  // ADMIN
      MainForm.vADMIN := True;

  MainForm.vUSUARIO := False;
  if dmDados.FDUsuarioPERFIL.Value = 'USUARIO' then  // USUARIO
      MainForm.vUSUARIO := True;

end;

procedure TformLogin.sbSairClick(Sender: TObject);
begin
  Close;

end;

procedure TformLogin.UniFSButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TformLogin.UniLoginFormCreate(Sender: TObject);
begin
  edUsuario.SetFocus;
end;

procedure TformLogin.UniLoginFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin
  // resposividade na tela
  Self.Left := Round((AWidth / 2)  - (Self.Width / 2));
  Self.Top  := Round((AHeight / 2) - (Self.Height / 2));
end;

procedure TformLogin.UniLoginFormShow(Sender: TObject);
begin
  // pnAutenticacao.Visible := True; // deixa o peinel de ativação de chave ativo

end;

procedure TformLogin.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  Close; // fecha o sistema caso clicar no alert
end;

initialization

RegisterAppFormClass(TformLogin);

end.
