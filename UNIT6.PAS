unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.DFM}

procedure TForm6.Button1Click(Sender: TObject);
begin
Form6.Close;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
try
Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'widok.bmp');
except
end;
end;

end.
