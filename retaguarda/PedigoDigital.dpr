program PedigoDigital;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uFrCadastroUsuario in 'uFrCadastroUsuario.pas' {frCadastroUsuario: TUniFrame},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uFrLogSys in 'uFrLogSys.pas' {frLogSys: TUniFrame},
  uFormLogin in 'uFormLogin.pas' {UniLoginForm1: TUniLoginForm},
  Dashboard.Infobox in 'Uses\Dashboard.Infobox.pas',
  Utils in 'Controle\Utils.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
