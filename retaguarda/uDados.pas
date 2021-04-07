unit uDados;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDWConstsData, uRESTDWPoolerDB, uDWAbout, uniGUIBaseClasses,
  uniGUIClasses, UniFSToast, uniImageList, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TdmDados = class(TDataModule)
    Toast: TUniFSToast;
    imglFA: TUniNativeImageList;
    FDUsuario: TFDQuery;
    FDAuxiliar: TFDQuery;
    FDLogSys: TFDQuery;
    FDLogSysID: TIntegerField;
    FDLogSysDIA: TSQLTimeStampField;
    FDLogSysLOGIN: TStringField;
    FDLogSysOPERACAO: TStringField;
    FDLogSysOCORRENCIA: TStringField;
    FDTransaction1: TFDTransaction;
    FDConnection1: TFDConnection;
    FDUsuarioID: TIntegerField;
    FDUsuarioNOME: TStringField;
    FDUsuarioEMAIL: TStringField;
    FDUsuarioLOGIN: TStringField;
    FDUsuarioSENHA: TStringField;
    FDUsuarioPERFIL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function dmDados: TdmDados;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function dmDados: TdmDados;
begin
  Result := TdmDados(UniMainModule.GetModuleInstance(TdmDados));
end;

initialization
  RegisterModuleClass(TdmDados);

end.
