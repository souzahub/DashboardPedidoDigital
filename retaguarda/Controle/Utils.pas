unit Utils;

interface

uses
  uniPanel, uniPageControl,uniGUIFrame,forms,System.SysUtils,uniGUIDialogs,
  uniGUITypes, uniGUIAbstractClasses,uniGUIVars,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, Vcl.Controls;

  procedure AddTab(PC:TuniPageControl;FrameAba: TFrame; Titulo: string);
  procedure CentralizaPanel(UniPanel:TUniPanel;Width,Height:integer);

implementation

uses
   MainModule, uniGUIApplication;


procedure CentralizaPanel(UniPanel:TUniPanel;Width,Height:integer);
begin  // Centraliza o Panel - Colocar no evento OnScreenResize do Form;

  UniPanel.BorderStyle  := ubsNone; // Remove a borda do Panel;
  UniPanel.Left         := Round((Width/ 2) - (UniPanel.Width / 2));
  UniPanel.Top          := Round((Height / 2) - (UniPanel.Height / 2));
  UniPanel.Update;

end;

procedure AddTab(PC: TuniPageControl; FrameAba: TFrame; // add frames
  Titulo: string);
var
  TabSheet    :TUniTabSheet;
  Frame    :  TUniFrame;
  Aba             :Integer;
begin

  for Aba := 0 to PC.PageCount - 1 do
  with PC do
  if trim(Pages[Aba].Caption) = Titulo  then
  begin
     PC.ActivePageIndex := Aba;
     Abort;
  end;

  TabSheet              := TUniTabSheet.Create(PC);
  TabSheet.PageControl  := PC;
  TabSheet.Caption      := '   '+Titulo+'   ';
  TabSheet.Closable     := True;

  Frame := TUniFrameClass(FrameAba).Create(PC);

  Frame.Align  := alClient;
  Frame.Parent := TabSheet;

  PC.ActivePage := TabSheet;
end;

end.
