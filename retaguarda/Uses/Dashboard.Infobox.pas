
unit Dashboard.Infobox;

interface

uses
 System.SysUtils, System.Classes;

type
  IInfobox = interface
    ['{4EA7B8B0-476B-41D6-A748-60FDB3990B57}']
    function Valor1(Value:string) : IInfobox;
    function Valor2(Value:string) : IInfobox;
    function Valor3(Value:string) : IInfobox;
    function Valor4(Value:string) : IInfobox;
    function HTMLView : string;
  end;

  TInfobox = class(TInterfacedObject, IInfobox)
  private
    SL : TStringList;
    FStrNoCache,
    FHTML,
    FValor1,
    FValor2,
    FValor3,
    FValor4 : string;
    const
      cHTMLFile     =  '.\files\dashboard\html\infobox.html';
      cCSSImport    =  '/files/dashboard/css/infobox.css';
      cJavaScript   =  '/files/dashboard/js/infobox.js';
    function Valor1(Value:string) : IInfobox;
    function Valor2(Value:string) : IInfobox;
    function Valor3(Value:string) : IInfobox;
    function Valor4(Value:string) : IInfobox;
    function HTMLView : String;
    function HTMLFile : string;
    function JavaScript : string;
    function CSSImport : string;
    function Bind(aKey,aValue: string) : TInfobox;
  public
    class function Init: IInfobox;
    constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TInfobox }

constructor TInfobox.Create;
begin
  FHTML       := HTMLFile;

  //Para controlar/evitar Cache do CSS e JS:
  FStrNoCache := FormatDateTime('yhns',Now); // Em tempo de Desenvolvimento
//  FStrNoCache := FormatDateTime('ymd',Now);  // Em tempo de Produção
end;

destructor TInfobox.Destroy;
begin
  FreeAndNil(SL);
  inherited;
end;

function TInfobox.CSSImport: string;
begin
  Result := cCSSImport + '?' + FStrNoCache;
end;

function TInfobox.JavaScript: string;
begin
  Result := cJavaScript + '?' + FStrNoCache;
end;

class function TInfobox.Init: IInfobox;
begin
  Result := Self.Create;
end;

function TInfobox.Valor1(Value: string): IInfobox;
begin
  Result          := Self;
  FValor1  := Value;
end;

function TInfobox.Valor2(Value: string): IInfobox;
begin
  Result := Self;
  FValor2 := Value;
end;

function TInfobox.Valor3(Value: string): IInfobox;
begin
  Result    := Self;
  FValor3 := Value;
end;

function TInfobox.Valor4(Value: string): IInfobox;
begin
  Result        := Self;
  FValor4 := Value;
end;

function TInfobox.HTMLFile: string;
begin
  SL          := TStringList.Create;

  if FileExists(cHTMLFile) then
  begin
    SL.LoadFromFile(cHTMLFile,TEncoding.UTF8);
    Result := SL.Text;
  end else
  raise Exception.Create(
    'O arquivo "'+cHTMLFile+'" não foi encontrado'
  );
end;

function TInfobox.HTMLView: String;  // busca as variaveis do Html
begin
  Bind('CSSImport',CSSImport).
  Bind('JavaScript',JavaScript).
  Bind('Valor1',FValor1).
  Bind('Valor2',FValor2).
  Bind('Valor3',FValor3).
  Bind('Valor4',FValor4);

  Result := FHTML;
end;

function TInfobox.Bind(aKey,aValue:string) : TInfobox;
begin
  Result  := Self;
  FHTML   := StringReplace(FHTML,'{{'+aKey+'}}',aValue,
                            [rfReplaceAll,rfIgnoreCase]);
end;

end.
