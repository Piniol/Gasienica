unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label2: TLabel;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
begin
Form2.Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
Label2.Caption:='Autor:'+#13+
'Przemys³aw Wiecheæ'+#13#13+
'Adres:'+#13+
'os.Or³a Bia³ego 52/11'+#13+
'61-251 Poznañ'+#13+
'Poland'+#13#13+
'Made with Delphi 2.0';
Label2.Left:=Form2.Width div 2 - Label2.Width div 2;
end;

procedure TForm2.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (Button= mbRight) and (ssShift in Shift) then
Application.MessageBox(PChar('G¹sienica'+#13#13+'Pomys³'+#13+'Przemys³aw Wiecheæ'+#13#13+
'Programowanie'+#13+'Przemys³aw Wiecheæ'+#13#13+'Grafika'+#13+'Przemys³aw Wiecheæ'+#13+'Nieznani mi ludzie'+#13#13+
'DŸwiêki'+#13+'Przemys³aw Wiecheæ'+#13#13'Adres'+#13+'Przemys³aw Wiecheæ'+#13+
'os. Or³a Bia³ego 52/11'+#13+'61-251 Poznañ'+#13+'Polska'),'Autorzy',mb_OK+mb_iconinformation);
end;

end.
