unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, INIFiles, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDEdit;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TLMDEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1, Unit3;

{$R *.DFM}

procedure TForm4.Button1Click(Sender: TObject);
var I: Byte;
    Plik: TINIFile;
begin
Wynik1[10]:=Edit1.Text;
Wynik2[10]:=Punkty;
 case Poziom of
  1: Wynik3[10]:='£atwy';
  2: Wynik3[10]:='Normalny';
  3: Wynik3[10]:='Trudny';
 end;
Wynik4[10]:=Kulki;
try
Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
for I:=1 to 10 do begin
Plik.WriteString('WYNIKI',IntToStr(I),Wynik1[I]);
Plik.WriteInteger('WYNIKI',IntToStr(I)+'a',Wynik2[I]);
Plik.WriteString('WYNIKI',IntToStr(I)+'b',Wynik3[I]);
Plik.WriteInteger('WYNIKI',IntToStr(I)+'c',Wynik4[I]);
end;
finally
Plik.Free;
end;
Form4.Close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
Edit1.setfocus;
Edit1.SelStart:=0;
Edit1.SelLength:=12;
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_Return then
Button1Click(Sender);
end;

end.
