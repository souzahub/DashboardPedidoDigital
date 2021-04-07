program Patch_12011007;

uses
  Forms,
  frmComp in '..\..\..\..\mkmNautilus_COMMERCE_ERP\PATCHES_ERP\frmComp.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
  //Form1.Free;
  //DataMdIbx.Free;
end.
