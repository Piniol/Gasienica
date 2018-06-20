unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, INIFiles, StdCtrls, MMSystem;

type
  TForm8 = class(TForm)
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    NowaGra1: TMenuItem;
    Pauza1: TMenuItem;
    Wyjcie1: TMenuItem;
    Timer1: TTimer;
    Poziom1: TMenuItem;
    atwy1: TMenuItem;
    Normalny1: TMenuItem;
    Trudny1: TMenuItem;
    Ustawienia1: TMenuItem;
    OdtwarzajDwiki1: TMenuItem;
    Zakocz1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer4: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Wyjcie1Click(Sender: TObject);
    procedure NowaGra1Click(Sender: TObject);
    procedure Obliczenia1(Sender: TObject);
    procedure Obliczenia2(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Zjedzone1(Sender: TObject);
    procedure Zjedzone2(Sender: TObject);
    procedure NowaGra0(Sender: TObject);
    procedure Koniec1(Sender: TObject);
    procedure Koniec2(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pauza1Click(Sender: TObject);
    procedure atwy1Click(Sender: TObject);
    procedure Normalny1Click(Sender: TObject);
    procedure Trudny1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OdtwarzajDwiki1Click(Sender: TObject);
    procedure Zakocz1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Koniec0(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  Za0,Zb0,Poziom0,Sound0,X1,Y1,Kierunek1,Kulki1,X2,Y2,Kierunek2,Kulki2: Integer;
  Punkty1,Punkty1a,Punkty2,Punkty2a,Kupa1,Kupa2: Integer;
  Kon1,Zje1,Kon2,Zje2: Boolean;
  Tab0: array[1..450] of Integer = (-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,999,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-999,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1000,
                                    -1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000);
  TabA1: array[1..450] of Integer;
  TabB1: array[1..15,1..30] of Integer;
  Tab10: array[1..450] of Word = (10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                  10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                  10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                  10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                  10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                  10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590);
  Tab20: array[1..450] of Word = (10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
                                 30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,
                                 50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,
                                 70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,
                                 90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,
                                 110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,
                                 130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,
                                 150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,
                                 170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,
                                 190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,
                                 210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,
                                 230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,
                                 250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,
                                 270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,
                                 290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290);
const title='Gra Dwuosobowa ';

implementation

{$R *.DFM}

procedure TForm8.Zjedzone1(Sender: TObject);
var I,J: integer;
begin
Timer1.Enabled:=False;
Zje1:=False;
 for I:=1 to 15 do
    begin
    for J:=1 to 30 do
       begin
       if (TabB1[I,J]>0) and (TabB1[i,j]<999) then Inc(TabB1[I,J]);
       end;
    end;
 repeat
  Za0:=(Random(15))+1; Zb0:=(Random(30))+1;
  if TabB1[Za0,Zb0]=0 then
     begin
     TabB1[Za0,Zb0]:=-1001;
     Zje1:=True;
     end;
 until Zje1=True;
 if Zje1=True then
    begin
    Inc(Kulki1);
    Punkty1:=Punkty1+Poziom0;
    Label1.Caption:=IntToStr(Punkty1);
    Label4.Caption:=IntToStr(Kulki1);
    Obliczenia1(Sender);
    Timer1.Enabled:=True;
    Inc(Kupa1);
    if Sound0=1 then begin
    PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);
    if Kupa1=5 then
    PlaySound(PChar(ExtractFilePath(ParamStr(0))+'kupa'),0,snd_ASync);end;
    end else Zjedzone1(Sender);
end;

procedure TForm8.Zjedzone2(Sender: TObject);
var I,J: integer;
begin
Timer4.Enabled:=False;
Zje2:=False;
 for I:=1 to 15 do
    begin
    for J:=1 to 30 do
       begin
       if (TabB1[I,J]<0) and (TabB1[i,j]>-999) then Dec(TabB1[I,J]);
       end;
    end;
 repeat
  Za0:=(Random(15))+1; Zb0:=(Random(30))+1;
  if TabB1[Za0,Zb0]=0 then
     begin
     TabB1[Za0,Zb0]:=-1001;
     Zje2:=True;
     end;
 until Zje2=True;
 if Zje2=True then
    begin
    Dec(Kulki2);
    Punkty2:=Punkty2+Poziom0;
    Label2.Caption:=IntToStr(Punkty2);
    Label3.Caption:=IntToStr(Kulki2*(-1));
    Obliczenia2(Sender);
    Timer4.Enabled:=True;
    Inc(Kupa2);
    if Sound0=1 then begin
    PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);
    if Kupa2=5 then
    PlaySound(PChar(ExtractFilePath(ParamStr(0))+'kupa'),0,snd_ASync);end;
    end else Zjedzone2(Sender);
end;

procedure TForm8.Koniec0(Sender: TObject);
begin
NowaGra1.Enabled:=True;
Poziom1.Enabled:=True;
Timer1.Enabled:=False;
Timer4.Enabled:=False;
Kon1:=True;
Kon2:=True;
canvas.pen.color:=clblack;
canvas.brush.color:=clblack;
canvas.brush.style:=bssolid;
form8.canvas.rectangle(0,0,form8.width,form8.height);
Punkty1:=0;
Punkty2:=0;
Punkty1a:=0;
Punkty2a:=0;
Label7.Caption:='0';
Label8.Caption:='0';
Label1.Caption:='';
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
end;

procedure TForm8.Koniec1(Sender: TObject);
var I,J,z: Byte;
begin
Timer1.Enabled:=False;
Kon1:=True;
if Kon2=True then
begin
 if Punkty1>Punkty2 then begin Punkty1a:=Punkty1a+1;end;
 if Punkty1<Punkty2 then begin Punkty2a:=Punkty2a+1;end;
 if Punkty1=Punkty2 then begin Punkty1a:=Punkty1a+1;end;
Label7.Caption:=IntToStr(Punkty1a);
Label8.Caption:=IntToStr(Punkty2a);
Poziom1.Enabled:=True;
NowaGra1.Enabled:=True;
end;
if Sound0=1 then begin
if Kon2=True then
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'flawles'),0,snd_ASync) else
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'nie'),0,snd_ASync);end;
FormPaint(Sender);
end;

procedure TForm8.Koniec2(Sender: TObject);
var I,J,z: Byte;
begin
Timer4.Enabled:=False;
Kon2:=True;
if Kon1=True then
begin
 if Punkty1>Punkty2 then begin Punkty1a:=Punkty1a+1;end;
 if Punkty1<Punkty2 then begin Punkty2a:=Punkty2a+1;end;
 if Punkty1=Punkty2 then begin Punkty2a:=Punkty2a+1;end;
Label7.Caption:=IntToStr(Punkty1a);
Label8.Caption:=IntToStr(Punkty2a);
Poziom1.Enabled:=True;
NowaGra1.Enabled:=True;
end;
if Sound0=1 then begin
if Kon1=True then
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'flawles'),0,snd_ASync) else
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'nie'),0,snd_ASync);end;
FormPaint(Sender);
end;

procedure TForm8.NowaGra0(Sender: TObject);
var i,j,z:integer;
begin
NowaGra1.Enabled:=False;
Label1.Caption:='';
Label4.Caption:='';
Label2.Caption:='';
Label3.Caption:='';
if Sound0=1 then begin
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'fight'),0,snd_ASync);end;
Form8.Caption:=title;
Poziom1.Enabled:=False;
Kon1:=False;
Kon2:=False;
X1:=8;
Y1:=8;
X2:=23;
Y2:=8;
Kulki1:=0;
Kulki2:=0;
Punkty1:=0;
Punkty2:=0;
Kupa1:=0;
Kupa2:=0;
Kierunek1:=(Random(4))+1;
Kierunek2:=(Random(4))+1;
 for I:=1 to 450 do
    begin
    TabA1[I]:=Tab0[I];
    end;
Z:=1;
 for I:=1 to 15 do
    begin
    for J:=1 to 30 do
       begin
       TabB1[I,J]:=TabA1[Z];
       Inc(Z);
       end;
    end;
 repeat
  Za0:=(Random(15))+1; Zb0:=(Random(30))+1;
   if TabB1[Za0,Zb0]=0 then TabB1[Za0,Zb0]:=-1001;
 until TabB1[Za0,Zb0]=-1001;
FormPaint(Sender);
SetCursorPos(0,0);
Sleep(2000);
Timer1.Enabled:=True;
Timer4.Enabled:=True;
end;

procedure TForm8.Obliczenia1(Sender: TObject);
var I,J,A,B,C: integer;
begin
if Kon2=true then begin
 for i:=1 to 15 do begin
  for j:=1 to 30 do begin
   if (tabb1[i,j]<0) and (tabb1[i,j]>=-999) then tabb1[i,j]:=0;end;end;
end;
if kupa1=5 then begin
 for I:=1 to 15 do begin
    for J:=1 to 30 do begin
        Kupa1:=0;
        if TabB1[I,J]=1 then TabB1[I,J]:=-1002;
       end;
    end;end;
C:=1;
 for I:=1 to 15 do
    begin
    for J:=1 to 30 do
       begin
       if (TabB1[I,J]>0) and (TabB1[i,j]<999) then TabB1[I,J]:=(TabB1[I,J])-1 else
       if TabB1[I,J]=999 then TabB1[I,J]:=Kulki1;
       end;
    end;
TabB1[Y1,X1]:=999;
 for A:=1 to 15 do
    begin
    for B:=1 to 30 do
       begin
       TabA1[C]:=TabB1[A,B];
       Inc(C);
       end;
    end;
FormPaint(Sender);
end;

procedure TForm8.Obliczenia2(Sender: TObject);
var I,J,A,B,C: integer;
begin
if Kon1=true then begin
 for i:=1 to 15 do begin
  for j:=1 to 30 do begin
   if (tabb1[i,j]>0) and (tabb1[i,j]<=999) then tabb1[i,j]:=0;end;end;
end;
C:=1;
if kupa2=5 then begin
 for I:=1 to 15 do begin
    for J:=1 to 30 do begin
       Kupa2:=0;
       if TabB1[I,J]=-1 then TabB1[I,J]:=-1002;
       end;
    end;end;

 for I:=1 to 15 do
    begin
    for J:=1 to 30 do
       begin
       if (TabB1[I,J]<0) and (TabB1[i,j]>-999) then TabB1[I,J]:=(TabB1[I,J])+1 else
       if TabB1[I,J]=-999 then TabB1[I,J]:=Kulki2;
       end;
    end;
TabB1[Y2,X2]:=-999;
 for A:=1 to 15 do
    begin
    for B:=1 to 30 do
       begin
       TabA1[C]:=TabB1[A,B];
       Inc(C);
       end;
    end;
FormPaint(Sender);
end;

procedure TForm8.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Timer4.Enabled=True then begin
  if (Key=VK_LEFT) and (Kulki2=0) then Kierunek2:=1;
  if (Key=VK_LEFT) and (Kulki2<0) and (Kierunek2=2) then Kierunek2:=2;
  if (Key=VK_LEFT) and (Kierunek2<>2) then Kierunek2:=1;
  if (Key=VK_RIGHT) and (Kulki2=0) then Kierunek2:=2;
  if (Key=VK_RIGHT) and (Kulki2<0) and (Kierunek2=1) then Kierunek2:=1;
  if (Key=VK_RIGHT) and (Kierunek2<>1) then Kierunek2:=2;
  if (Key=VK_UP) and (Kulki2=0) then Kierunek2:=3;
  if (Key=VK_UP) and (Kulki2<0) and (Kierunek2=4) then Kierunek2:=4;
  if (Key=VK_UP) and (Kierunek2<>4) then Kierunek2:=3;
  if (Key=VK_DOWN) and (Kulki2=0) then Kierunek2:=4;
  if (Key=VK_DOWN) and (Kulki2<0) and (Kierunek2=3) then Kierunek2:=3;
  if (Key=VK_DOWN) and (Kierunek2<>3) then Kierunek2:=4;
 end;
if Timer1.Enabled=True then begin
  if (Key=65) and (Kulki1=0) then Kierunek1:=1;
  if (Key=65) and (Kulki1>0) and (Kierunek1=2) then Kierunek1:=2;
  if (Key=65) and (Kierunek1<>2) then Kierunek1:=1;
  if (Key=68) and (Kulki1=0) then Kierunek1:=2;
  if (Key=68) and (Kulki1>0) and (Kierunek1=1) then Kierunek1:=1;
  if (Key=68) and (Kierunek1<>1) then Kierunek1:=2;
  if (Key=87) and (Kulki1=0) then Kierunek1:=3;
  if (Key=87) and (Kulki1>0) and (Kierunek1=4) then Kierunek1:=4;
  if (Key=87) and (Kierunek1<>4) then Kierunek1:=3;
  if (Key=83) and (Kulki1=0) then Kierunek1:=4;
  if (Key=83) and (Kulki1>0) and (Kierunek1=3) then Kierunek1:=3;
  if (Key=83) and (Kierunek1<>3) then Kierunek1:=4;
 end;
end;

procedure TForm8.Wyjcie1Click(Sender: TObject);
begin
Form8.Close;
end;

procedure TForm8.NowaGra1Click(Sender: TObject);
begin
NowaGra0(Sender);
end;

procedure TForm8.FormPaint(Sender: TObject);
var I,J:integer;
    MyRect,MyRect2,MyRect3,MyRect4,MyRect5,MyRect6,MyRect7,myrect8,MyOther: TRect;
    Bitmapa: TBitmap;
begin
if (Kon1=True) and (Kon2=True) then begin
canvas.pen.color:=clblack;
canvas.brush.color:=clblack;
canvas.brush.style:=bssolid;
form8.canvas.rectangle(0,0,form8.width,form8.height);
end else begin
MyRect:=Rect(43,1,63,21);
MyRect2:=Rect(1,1,21,21);
MyRect3:=Rect(22,1,42,21);
MyRect4:=Rect(64,1,84,21);
MyRect5:=Rect(22,22,42,42);
MyRect6:=Rect(64,22,84,42);
MyRect7:=Rect(1,22,21,42);
myrect8:=rect(43,22,63,42);
Bitmapa:=TBitmap.Create;
Bitmapa.LoadFromFile(ExtractFilePath(ParamStr(0))+'grafika');
 for I:=1 to 450 do
    begin
    MyOther := Rect(Tab10[I]+6,Tab20[I],Tab10[I]+26,Tab20[I]+20);
    if TabA1[I]=-1000 then
    Form8.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect) else
    if TabA1[I]=999 then
    Form8.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect6) else
    if TabA1[I]=-999 then
    Form8.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect4) else
    if TabA1[I]=-1001 then
    Form8.Canvas.Copyrect(MyOther,Bitmapa.Canvas,MyRect3) else
    if TabA1[I]=-1002 then
    Form8.Canvas.Copyrect(MyOther,Bitmapa.Canvas,MyRect8) else
    if (TabA1[I]>0) and (TabA1[I]<999) then
    Form8.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect7) else
    if (TabA1[I]<0) and (TabA1[I]>-999) then
    Form8.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect2) else
    if TabA1[i]=0 then
       begin
       Canvas.Brush.Color:=clBlack;
       Canvas.Brush.Style:=bsSolid;
       Form8.Canvas.Rectangle(Tab10[I]+6,Tab20[I],Tab10[I]+26,Tab20[I]+20);
       end
     end;
     Bitmapa.Free;
     end;
end;

procedure TForm8.FormCreate(Sender: TObject);
var Plik: TINIFile;
    I: Integer;
    MyRect,MyOther: TRect;
    Bitmapa: TBitmap;
begin
Bitmapa:=TBitmap.Create;
Bitmapa.LoadFromFile(ExtractFilePath(ParamStr(0))+'grafika');
MyRect:=Rect(1,199,319,249);
MyOther:=Rect(0,0,319,Image2.Height);
Image2.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect);
MyOther:=Rect(319,0,638,Image2.Height);
Image2.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect);
 try
 Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
  case Plik.ReadInteger('POZIOM','p3',2) of
   1: begin atwy1.Checked:=True; Poziom0:=1; Timer1.Interval:=150;  Timer4.Interval:=150;end;
   2: begin Normalny1.Checked:=True; Poziom0:=2; Timer1.Interval:=100; Timer4.Interval:=100;end;
   3: begin Trudny1.Checked:=True; Poziom0:=3; Timer1.Interval:=50; Timer4.Interval:=50;end;
  end;
  case Plik.ReadInteger('SOUND','s3',1) of
   0: begin OdtwarzajDwiki1.Checked:=False; Sound0:=0; end;
   1: begin OdtwarzajDwiki1.Checked:=True; Sound0:=1; end;
  end;
 finally
 Plik.Free;
 end;
Bitmapa.Free;
end;

procedure TForm8.Pauza1Click(Sender: TObject);
begin
 If Pauza1.Caption='Pauza' then
    begin
    Pauza1.Caption:='Start';
    Timer1.Enabled:=False;
    Timer4.Enabled:=False;
    Form8.Caption:=title+'Pauza';
    end else
       begin
       Pauza1.Caption:='Pauza';
       Timer1.Enabled:=True;
       Timer4.Enabled:=True;
       Form8.Caption:=title;
       SetCursorPos(0,0);
       end;
end;

procedure TForm8.atwy1Click(Sender: TObject);
begin
Normalny1.Checked:=False;
Trudny1.Checked:=False;
atwy1.Checked:=True;
Poziom0:=1;
Timer1.Interval:=150;
Timer4.Interval:=150;
end;

procedure TForm8.Normalny1Click(Sender: TObject);
begin
Normalny1.Checked:=True;
Trudny1.Checked:=False;
atwy1.Checked:=False;
Poziom0:=2;
Timer1.Interval:=100;
Timer4.Interval:=100;
end;

procedure TForm8.Trudny1Click(Sender: TObject);
begin
Normalny1.Checked:=False;
Trudny1.Checked:=True;
atwy1.Checked:=False;
Poziom0:=3;
Timer1.Interval:=50;
Timer4.Interval:=50;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
var Plik: TINIFile;
text: PChar;
begin
Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
Plik.WriteInteger('POZIOM','p3',Poziom0);
Plik.WriteInteger('SOUND','s3',Sound0);
Plik.Free;
if Punkty1a>Punkty2a then begin
text:=PChar('Zawody wygra³ Gracz 1'); end else
if Punkty1a<Punkty2a then begin
text:=PChar('Zawody wygra³ Gracz 2'); end else
if Punkty1a=Punkty2a then begin
text:=PChar('Gracze zremisowali'); end;
application.messagebox(text,'Zwyciêzca',mb_ok);
end;

procedure TForm8.OdtwarzajDwiki1Click(Sender: TObject);
begin
 If OdtwarzajDwiki1.Checked=True then
    begin
    OdtwarzajDwiki1.Checked:=False;
    Sound0:=0;
    end else
       begin
       OdtwarzajDwiki1.Checked:=True;
       Sound0:=1;
       end;
end;

procedure TForm8.Zakocz1Click(Sender: TObject);
begin
Koniec0(Sender);
end;

procedure TForm8.Timer4Timer(Sender: TObject);
begin

 if Kierunek2=1 then
    begin
     if (TabB1[Y2,X2-1]=0) or (TabB1[Y2,X2-1]=1) or (TabB1[Y2,X2-1]=-1) then
        begin
        X2:=X2-1;
        Obliczenia2(Sender);
        end else
         if TabB1[Y2,X2-1]=-1001 then
            begin
            X2:=X2-1;
            Zjedzone2(Sender);
            end else
             if (TabB1[Y2,X2-1]>1) or (TabB1[Y2,X2-1]<-1) then Koniec2(Sender);
     end;


 if Kierunek2=2 then
    begin
     if (TabB1[Y2,X2+1]=0) or (TabB1[Y2,X2+1]=1) or (TabB1[Y2,X2+1]=-1) then
        begin
        X2:=X2+1;
        Obliczenia2(Sender);
        end else
         if TabB1[Y2,X2+1]=-1001 then
            begin
            X2:=X2+1;
            Zjedzone2(Sender);
            end else
             if (TabB1[Y2,X2+1]>1) or (TabB1[Y2,X2+1]<-1) then Koniec2(Sender);
    end;

 if Kierunek2=3 then
    begin
     if (TabB1[Y2-1,X2]=0) or (TabB1[Y2-1,X2]=1) or (TabB1[Y2-1,X2]=-1) then
        begin
        Y2:=Y2-1;
        Obliczenia2(Sender);
        end else
         if TabB1[Y2-1,X2]=-1001 then
            begin
            Y2:=Y2-1;
            Zjedzone2(Sender);
            end else
             if (TabB1[Y2-1,X2]>1) or (TabB1[Y2-1,X2]<-1) then Koniec2(Sender);
    end;

 if Kierunek2=4 then
    begin
     if (TabB1[Y2+1,X2]=0) or (TabB1[Y2+1,X2]=1) or (TabB1[Y2+1,X2]=-1) then
        begin
        Y2:=Y2+1;
        Obliczenia2(Sender);
        end else
         if TabB1[Y2+1,X2]=-1001 then
            begin
            Y2:=Y2+1;
            Zjedzone2(Sender);
            end else
             if (TabB1[Y2+1,X2]>1) or (TabB1[Y2+1,X2]<-1) then Koniec2(Sender);
    end;

end;

procedure TForm8.FormShow(Sender: TObject);
begin
Label1.Caption:='';
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
Label7.Caption:='0';
Label8.Caption:='0';
Punkty1a:=0;
Punkty2a:=0;
end;

procedure TForm8.Timer1Timer(Sender: TObject);
begin

if Kierunek1=1 then
    begin
     if (TabB1[Y1,X1-1]=0) or (TabB1[Y1,X1-1]=1) or (TabB1[Y1,X1-1]=-1) then
        begin
        X1:=X1-1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1,X1-1]=-1001 then
            begin
            X1:=X1-1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1,X1-1]>1) or (TabB1[Y1,X1-1]<-1) then Koniec1(Sender);
     end;

 if Kierunek1=2 then
    begin
     if (TabB1[Y1,X1+1]=0) or (TabB1[Y1,X1+1]=1) or (TabB1[Y1,X1+1]=-1) then
        begin
        X1:=X1+1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1,X1+1]=-1001 then
            begin
            X1:=X1+1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1,X1+1]>1) or (TabB1[Y1,X1+1]<-1) then Koniec1(Sender);
    end;

 if Kierunek1=3 then
    begin
     if (TabB1[Y1-1,X1]=0) or (TabB1[Y1-1,X1]=1) or (TabB1[Y1-1,X1]=-1) then
        begin
        Y1:=Y1-1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1-1,X1]=-1001 then
            begin
            Y1:=Y1-1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1-1,X1]>1) or (TabB1[Y1-1,X1]<-1) then Koniec1(Sender);
    end;

 if Kierunek1=4 then
    begin
     if (TabB1[Y1+1,X1]=0) or (TabB1[Y1+1,X1]=1) or (TabB1[Y1+1,X1]=-1) then
        begin
        Y1:=Y1+1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1+1,X1]=-1001 then
            begin
            Y1:=Y1+1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1+1,X1]>1) or (TabB1[Y1+1,X1]<-1) then Koniec1(Sender);
    end;

end;

end.
