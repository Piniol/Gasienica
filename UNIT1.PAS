{
NAME:     G�sienica;
VERSION:  1.4;
AUTHOR:   Przemys�aw Wieche�;
CONTACT:  os.Or�a Bia�ego 52/11
          61-251 Pozna�
          Poland;
COMPILER: Delphi 2.0;
STATUS:   Freeware;
DATE:     08.XI.2001-09.II.2002

Copyright � Przemys�aw Wieche�
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, INIFiles, StdCtrls, MMSystem;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    NowaGra1: TMenuItem;
    Pauza1: TMenuItem;
    Wyjcie1: TMenuItem;
    Timer1: TTimer;
    HighScores1: TMenuItem;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Poziom1: TMenuItem;
    atwy1: TMenuItem;
    Normalny1: TMenuItem;
    Trudny1: TMenuItem;
    Label4: TLabel;
    Pomoc1: TMenuItem;
    Informacje1: TMenuItem;
    OProgramie1: TMenuItem;
    Podzikowania1: TMenuItem;
    Timer2: TTimer;
    Ustawienia1: TMenuItem;
    OdtwarzajDwiki1: TMenuItem;
    Sciany1: TMenuItem;
    Zakocz1: TMenuItem;
    OstatniWidok1: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    GraDwuosobowa1: TMenuItem;
    Na2planszach1: TMenuItem;
    Na1planszy1: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Wyjcie1Click(Sender: TObject);
    procedure OProgramie1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Obliczenia(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Zjedzone(Sender: TObject);
    procedure NowaGra(Sender: TObject);
    procedure HighScores1Click(Sender: TObject);
    procedure Koniec(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pauza1Click(Sender: TObject);
    procedure Credits1Click(Sender: TObject);
    procedure atwy1Click(Sender: TObject);
    procedure Normalny1Click(Sender: TObject);
    procedure Trudny1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Informacje1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure OdtwarzajDwiki1Click(Sender: TObject);
    procedure Sciany1Click(Sender: TObject);
    procedure Zakocz1Click(Sender: TObject);
    procedure OstatniWidok1Click(Sender: TObject);
    procedure Na2planszach1Click(Sender: TObject);
    procedure Na1planszy1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  X,Y,Kierunek,Kulki,Za,Zb,Poziom,Bek,Sound,Wall: Byte;
  Punkty: Integer;
  Kon,Zje: Boolean;
  Tab: array[1..225] of Integer = (-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,-2,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
  TabA: array[1..225] of Integer;
  TabB: array[1..15,1..15] of Integer;
  Wynik1: array[0..10] of String;
  Wynik2: array[0..10] of Integer;
  Wynik3: array[0..10] of String;
  Wynik4: array[0..10] of Integer;
  Tab1: array[1..225] of Word = (10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
                                 10,30,50,70,90,110,130,150,170,190,210,230,250,270,290);
  Tab2: array[1..225] of Word = (10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
                                 30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,
                                 50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,
                                 70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,
                                 90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,
                                 110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,
                                 130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,
                                 150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,
                                 170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,
                                 190,190,190,190,190,190,190,190,190,190,190,190,190,190,190,
                                 210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,
                                 230,230,230,230,230,230,230,230,230,230,230,230,230,230,230,
                                 250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,
                                 270,270,270,270,270,270,270,270,270,270,270,270,270,270,270,
                                 290,290,290,290,290,290,290,290,290,290,290,290,290,290,290);
const title='G�sienica 1.4 - Freeware ';

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;

{$R *.DFM}

procedure TForm1.Koniec(Sender: TObject);
var I,J: Byte;
Rect1, Rect2: TRect;
begin
Rect1 := Rect(10,10,310,310);
Rect2 := Rect(0,0,300,300);
Form6.Image1.Canvas.CopyRect(Rect2, Form1.Canvas, Rect1);
Form6.Image1.Picture.SaveToFile(ExtractFilePath(ParamStr(0))+'widok.bmp');
OstatniWidok1.Enabled:=True;
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Poziom1.Enabled:=True;
Kon:=True;
Bek:=0;
 for I:=1 to 10 do
  for J:=1 to 10 do
   if Wynik2[I]>Wynik2[J] then
      begin
      Wynik1[0]:=Wynik1[i];
      Wynik1[i]:=Wynik1[j];
      Wynik1[j]:=Wynik1[0];
      Wynik2[0]:=Wynik2[i];
      Wynik2[i]:=Wynik2[j];
      Wynik2[j]:=Wynik2[0];
      Wynik3[0]:=Wynik3[i];
      Wynik3[i]:=Wynik3[j];
      Wynik3[j]:=Wynik3[0];
      Wynik4[0]:=Wynik4[i];
      Wynik4[i]:=Wynik4[j];
      Wynik4[j]:=Wynik4[0];
      end;
if Sound=1 then begin
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'nie'),0,snd_ASync);end;
FormPaint(Sender);
 if Punkty>Wynik2[10] then
    begin
    Form4.ShowModal;
    Form3.ShowModal;
    end;
end;

procedure TForm1.NowaGra(Sender: TObject);
var I,J,Z: Byte;
    Ciag: String;
    Bitmapa: TBitmap;
    MyRect,MyOther: TRect;
begin
Label1.Caption:='';
Label4.Caption:='';
if Sound=1 then begin
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'dobry'),0,snd_ASync);end;
OstatniWidok1.Enabled:=False;
Form1.Caption:=title;
Poziom1.Enabled:=False;
Canvas.Brush.Style:=bsSolid;
Canvas.Brush.Color:=clBlack;
Form1.Canvas.Rectangle(91,92,222,184);
Kon:=False;
X:=8;
Y:=8;
Kulki:=0;
Punkty:=0;
Kierunek:=(Random(4))+1;
 for I:=1 to 225 do
    begin
    TabA[I]:=Tab[I];
    end;
Z:=1;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       TabB[I,J]:=TabA[Z];
       Inc(Z);
       end;
    end;
 repeat
  Za:=(Random(12))+1; Zb:=(Random(12))+1;
   if TabB[Za,Zb]=0 then TabB[Za,Zb]:=-3;
 until TabB[Za,Zb]=-3;
FormPaint(Sender);
SetCursorPos(0,0);
Sleep(500);
Timer1.Enabled:=True;
Timer2.Enabled:=True;
end;

procedure TForm1.Zjedzone(Sender: TObject);
var I,J: Byte;
begin
Timer1.Enabled:=False;
Zje:=False;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       if TabB[I,J]>0 then Inc(TabB[I,J]);
       end;
    end;
 repeat
  Za:=(Random(12))+1; Zb:=(Random(12))+1;
  if TabB[Za,Zb]=0 then
     begin
     TabB[Za,Zb]:=-3;
     Zje:=True;
     end;
 until Zje=True;
 if Zje=True then
    begin
   Inc(Kulki);
    if Wall=0 then
       begin
        if bek<9 then begin
        Punkty:=Punkty+Poziom;
        Bek:=0;
        if Sound=1 then begin
        PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);end; end else
         if bek=9 then
            begin
            Punkty:=Punkty-1;
            bek:=0;
            if Sound=1 then begin
            PlaySound(PChar(ExtractFilePath(ParamStr(0))+'bek'),0,snd_ASync);end;
            Timer2.Enabled:=True;
            end;
       end else
        if Wall=1 then
           begin
            if bek<9 then begin
            Punkty:=Punkty+2;
            Bek:=0;
            if Sound=1 then begin
             PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);end; end else
             if bek=9 then
                begin
                Punkty:=Punkty-1;
                bek:=0;
                if Sound=1 then begin
                PlaySound(PChar(ExtractFilePath(ParamStr(0))+'bek'),0,snd_ASync);end;
                Timer2.Enabled:=True;
                end;
           end;
    Label1.Caption:=IntToStr(Punkty);
    Label4.Caption:=IntToStr(Kulki);
    Obliczenia(Sender);
    Timer1.Enabled:=True;
    end else Zjedzone(Sender);
end;

procedure TForm1.Obliczenia(Sender: TObject);
var I,J,A,B,C: Byte;
begin
C:= 1;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       if TabB[I,J]>0 then TabB[I,J]:=(TabB[I,J])-1 else
       if TabB[I,J]=-2 then TabB[I,J]:=Kulki;
       end;
    end;
TabB[Y,X]:=-2;
 for A:=1 to 15 do
    begin
    for B:=1 to 15 do
       begin
       TabA[C]:=TabB[A,B];
       Inc(C);
       end;
    end;
FormPaint(Sender);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if kierunek=1 then
  begin
    if (Key=VK_RIGHT) and (Kulki=0) then begin Kierunek:=2;  end;
    if (Key=VK_UP) {and (Kulki=0) }then begin Kierunek:=3;  end;
    if (Key=VK_DOWN) {and (Kulki=0)} then begin Kierunek:=4;  end;
  end;
  if Kierunek=2 then
  begin
    if (Key=VK_LEFT) and (Kulki=0) then begin Kierunek:=1;  end;
    if (Key=VK_UP) {and (Kulki=0) }then begin Kierunek:=3;  end;
    if (Key=VK_DOWN) {and (Kulki=0)} then begin Kierunek:=4;  end;
  end;
  if kierunek=3 then
  begin
    if (Key=VK_LEFT) {and (Kulki=0)} then begin Kierunek:=1;  end;
    if (Key=VK_RIGHT) {and (Kulki=0) }then begin Kierunek:=2;  end;
    if (Key=VK_DOWN) and (Kulki=0) then begin Kierunek:=4;  end;
  end;
  if kierunek=4 then
  begin
    if (Key=VK_LEFT) {and (Kulki=0)} then begin Kierunek:=1;  end;
    if (Key=VK_RIGHT) {and (Kulki=0) }then begin Kierunek:=2;  end;
    if (Key=VK_UP) and (Kulki=0) then begin Kierunek:=3;  end;
  end;
end;

procedure TForm1.Wyjcie1Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.OProgramie1Click(Sender: TObject);
begin
 if Timer1.Enabled=True then
    begin
    Pauza1Click(Sender);
    end;
Form2.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

 if Kierunek=1 then
 if Wall=0 then BEGIN
    begin
     if (TabB[Y,X-1]=0) or (TabB[Y,X-1]=1) then
        begin
        X:=X-1;
        Obliczenia(Sender);
        end else
         if TabB[Y,X-1]<=-3 then
            begin
            X:=X-1;
            Zjedzone(Sender);
            end else
             if (TabB[Y,X-1]>1) or (TabB[Y,X-1]=-1) then Koniec(Sender);
    end;
    END ELSE
   if Wall=1 then BEGIN
    if (TabB[Y,X-1]=0) or (TabB[Y,X-1]=1) then
         begin
         X:=X-1;
         Obliczenia(Sender);
         end else
          if (TabB[Y,X-1]<=-3) then
             begin
             X:=X-1;
             Zjedzone(Sender);
             end else
             if (TabB[Y,X-1]=-1) and (TabB[Y,X+12]<=-3) then begin
             X:=x+12;
             Zjedzone(Sender); end else
              if (TabB[Y,X-1]>1) or (TabB[Y,X+12]>1) then Koniec(Sender) else
              if TabB[Y,X-1]=-1 then begin
              x:=x+12;
             Obliczenia(Sender);
             end;
          END;

 if Kierunek=2 then
 if Wall=0 then BEGIN
    begin
     if (TabB[Y,X+1]=0) or (TabB[Y,X+1]=1) then
        begin
        X:=X+1;
        Obliczenia(Sender);
        end else
         if TabB[Y,X+1]<=-3 then
            begin
            X:=X+1;
            Zjedzone(Sender);
            end else
             if (TabB[Y,X+1]>1) or (TabB[Y,X+1]=-1) then Koniec(Sender);
    end;
    END ELSE
   if Wall=1 then BEGIN
    if (TabB[Y,X+1]=0) or (TabB[Y,X+1]=1) then
         begin
         X:=X+1;
         Obliczenia(Sender);
         end else
          if TabB[Y,X+1]<=-3 then
             begin
             X:=X+1;
             Zjedzone(Sender);
             end else
             if (TabB[Y,X+1]=-1) and (TabB[Y,X-12]<=-3) then begin
             X:=x-12;
             Zjedzone(Sender); end else
              if (TabB[Y,X+1]>1) or (TabB[Y,X-12]>1) then Koniec(Sender) else
              if TabB[Y,X+1]=-1 then begin
              x:=x-12;
             Obliczenia(Sender);
             end;
          END;

 if Kierunek=3 then
 if Wall=0 then BEGIN
    begin
     if (TabB[Y-1,X]=0) or (TabB[Y-1,X]=1) then
        begin
        Y:=Y-1;
        Obliczenia(Sender);
        end else
         if TabB[Y-1,X]<=-3 then
            begin
            Y:=Y-1;
            Zjedzone(Sender);
            end else
             if (TabB[Y-1,X]>1) or (TabB[Y-1,X]=-1) then Koniec(Sender);
    end;
    END ELSE
   if Wall=1 then BEGIN
    if (TabB[Y-1,X]=0) or (TabB[Y-1,X]=1) then
         begin
         Y:=Y-1;
         Obliczenia(Sender);
         end else
          if TabB[Y-1,X]<=-3 then
             begin
             Y:=Y-1;
             Zjedzone(Sender);
             end else
             if (TabB[Y-1,X]=-1) and (TabB[Y+12,X]<=-3) then begin
             y:=y+12;
             Zjedzone(Sender); end else
              if (TabB[Y-1,X]>1) or (TabB[Y+12,X]>1) then Koniec(Sender) else
              if TabB[Y-1,X]=-1 then begin
              Y:=Y+12;
             Obliczenia(Sender);
             end;
          END;

 if Kierunek=4 then
 if Wall=0 then BEGIN
    begin
     if (TabB[Y+1,X]=0) or (TabB[Y+1,X]=1) then
        begin
        Y:=Y+1;
        Obliczenia(Sender);
        end else
         if TabB[Y+1,X]<=-3 then
            begin
            Y:=Y+1;
            Zjedzone(Sender);
            end else
             if (TabB[Y+1,X]>1) or (TabB[Y+1,X]=-1) then Koniec(Sender);
    end;
    END ELSE
   if Wall=1 then BEGIN
    if (TabB[Y+1,X]=0) or (TabB[Y+1,X]=1) then
         begin
         Y:=Y+1;
         Obliczenia(Sender);
         end else
          if TabB[Y+1,X]<=-3 then
             begin
             Y:=Y+1;
             Zjedzone(Sender);
             end else
             if (TabB[Y-1,X]=-1) and (TabB[Y-13,X]<=-3) then begin
             y:=y+12;
             Zjedzone(Sender); end else
             if (TabB[Y+1,X]=-1) and (TabB[Y-12,X]<=-3) then begin
             y:=y-12;
             Zjedzone(Sender); end else
              if (TabB[Y+1,X]>1) or (TabB[Y-12,X]>1) then Koniec(Sender) else
              if TabB[Y+1,X]=-1 then begin
              Y:=Y-12;
             Obliczenia(Sender);
             end;
          END;
end;

procedure TForm1.FormPaint(Sender: TObject);
var I:integer;
    MyRect,MyRect2,MyRect3,MyRect4,MyRect5,MyOther: TRect;
    Bitmapa: TBitmap;
begin
MyRect:=Rect(43,1,63,21);
MyRect2:=Rect(1,1,21,21);
MyRect3:=Rect(22,1,42,21);
MyRect4:=Rect(64,1,84,21);
MyRect5:=Rect(22,22,42,42);
Bitmapa:=TBitmap.Create;
Bitmapa.LoadFromFile(ExtractFilePath(ParamStr(0))+'grafika');
if Kon=True then
   begin
   Canvas.Pen.Color:=clBlack;
   Canvas.Brush.Style:=bsSolid;
   Canvas.Brush.Color:=clBlack;
   Form1.Canvas.Rectangle(0,0,Form1.Width,Form1.Height);
   MyRect:=Rect(85,1,216,93);
   MyOther:=Rect(94,92,225,184);
   Form1.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect); end else
 for I:=1 to 225 do
    begin
    MyOther := Rect(Tab1[I],Tab2[I],Tab1[I]+20,Tab2[I]+20);
    if TabA[I]=-1 then
    Form1.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect) else
    if TabA[I]=-2 then
    Form1.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect4) else
    if TabA[I]=-3 then
    Form1.Canvas.Copyrect(MyOther,Bitmapa.Canvas,MyRect3) else
    if TabA[I]=-4 then
    Form1.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect5) else
    if TabA[I]>0 then
    Form1.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect2);
    if TabA[i]=0 then
       begin
       Canvas.Pen.Color:=clBlack;
       Canvas.Brush.Color:=clBlack;
       Canvas.Brush.Style:=bsSolid;
       Form1.Canvas.Rectangle(Tab1[I],Tab2[I],Tab1[I]+20,Tab2[I]+20);
       end;
    end;
Bitmapa.Free;
end;

procedure TForm1.HighScores1Click(Sender: TObject);
begin
 if Timer1.Enabled=True then
    begin
    Pauza1Click(Sender);
    end;
Form3.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Plik: TINIFile;
    I: Byte;
    MyRect,MyOther: TRect;
    Bitmapa: TBitmap;
begin
Bitmapa:=TBitmap.Create;
Bitmapa.LoadFromFile(ExtractFilePath(ParamStr(0))+'grafika');
MyRect:=Rect(1,199,319,249);
MyOther:=Rect(0,0,Image2.Width,Image2.Height);
Image2.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect);
 try
 Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
  for I:=1 to 10 do
     begin
     Wynik1[I]:=Plik.ReadString('WYNIKI',IntToStr(I),'');
     Wynik2[I]:=Plik.ReadInteger('WYNIKI',IntToStr(I)+'a',0);
     Wynik3[I]:=Plik.ReadString('WYNIKI',IntToStr(I)+'b','');
     Wynik4[I]:=Plik.ReadInteger('WYNIKI',IntToStr(I)+'c',0);
     end;
  case Plik.ReadInteger('POZIOM','w',0) of
   0: Wall:=0;
   1: Wall:=1;
  end;
  Sciany1.Checked:=Plik.ReadBool('POZIOM','c',FALSE);
  Sciany1.Enabled:=Plik.ReadBool('POZIOM','e',FALSE);
  case Plik.ReadInteger('POZIOM','p',2) of
   1: begin atwy1.Checked:=True; Poziom:=1; Timer1.Interval:=150;  end;
   2: begin Normalny1.Checked:=True; Poziom:=2; Timer1.Interval:=100; end;
   3: begin Trudny1.Checked:=True; Poziom:=3; Timer1.Interval:=50; end;
  end;
  case Plik.ReadInteger('SOUND','s',1) of
   0: begin OdtwarzajDwiki1.Checked:=False; Sound:=0; end;
   1: begin OdtwarzajDwiki1.Checked:=True; Sound:=1; end;
  end;
 finally
 Plik.Free;
 end;
Bitmapa.Free;
end;

procedure TForm1.Pauza1Click(Sender: TObject);
begin
 If Pauza1.Caption='Pauza' then
    begin
    Pauza1.Caption:='Start';
    Timer1.Enabled:=False;
    Timer2.Enabled:=False;
    Form1.Caption:=title+'Pauza';
    end else
       begin
       Pauza1.Caption:='Pauza';
       Timer1.Enabled:=True;
       Timer2.Enabled:=True;
       Form1.Caption:=title;
       SetCursorPos(0,0);
       end;
end;

procedure TForm1.Credits1Click(Sender: TObject);
var P: PChar;
begin
 if Timer1.Enabled=True then
    begin
    Pauza1Click(Sender);
    end;
P:=PChar('Beta-Testy i Pomys�y:'+#13+'Tasak - bekanie, gra dwuosobowa na 1 planszy, nagrywanie d�wi�k�w'+#13+
'Pi�kny - przechodzenie przez �ciany, kupa w grze dwuosobowej na 1 planszy'+#13+
'Piela - gra dwuosobowa na 2 planszach'+#13+#13+
'TDFWLightEdites'+#13+'(c) Erol S. Uzuner'+#13+'Version: 1.0, 26.03.99'+#13+
'sarcon@tzi.de'+#13+#13+'TStringAlignGrid'+#13+'(c) Andreas H�rstemeier'+#13+
'Version 2.0 2000-02-12');
Application.MessageBox(P,'Podzi�kowania...',MB_OK);
end;

procedure TForm1.atwy1Click(Sender: TObject);
begin
Normalny1.Checked:=False;
Trudny1.Checked:=False;
atwy1.Checked:=True;
Poziom:=1;
Timer1.Interval:=150;
Sciany1.Enabled:=False;
Wall:=0;
end;

procedure TForm1.Normalny1Click(Sender: TObject);
begin
Normalny1.Checked:=True;
Trudny1.Checked:=False;
atwy1.Checked:=False;
Poziom:=2;
Timer1.Interval:=100;
Sciany1.Enabled:=False;
Wall:=0;
end;

procedure TForm1.Trudny1Click(Sender: TObject);
begin
Normalny1.Checked:=False;
Trudny1.Checked:=True;
atwy1.Checked:=False;
Poziom:=3;
Timer1.Interval:=50;
Sciany1.Enabled:=True;
if Sciany1.Checked=True then
Wall:=1 else Wall:=0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var Plik: TINIFile;
begin
Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
Plik.WriteInteger('POZIOM','p',Poziom);
Plik.WriteInteger('SOUND','s',Sound);
Plik.WriteInteger('POZIOM','w',Wall);
Plik.WriteBool('POZIOM','c',Sciany1.Checked);
Plik.WriteBool('POZIOM','e',Sciany1.Enabled);
Plik.Free;
end;

procedure TForm1.Informacje1Click(Sender: TObject);
begin
if Timer1.Enabled=True then
    begin
    Pauza1Click(Sender);
    end;
Form5.ShowModal;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
Inc(Bek);
 if Bek=9 then
    begin
    TabB[Za,Zb]:=-4;
    Timer2.Enabled:=False;
    end;
end;

procedure TForm1.OdtwarzajDwiki1Click(Sender: TObject);
begin
 If OdtwarzajDwiki1.Checked=True then
    begin
    OdtwarzajDwiki1.Checked:=False;
    Sound:=0;
    end else
       begin
       OdtwarzajDwiki1.Checked:=True;
       Sound:=1;
       end;
end;

procedure TForm1.Sciany1Click(Sender: TObject);
begin
 If Sciany1.Checked=True then
    begin
    Sciany1.Checked:=False;
    Wall:=0;
    end else
       begin
       Sciany1.Checked:=True;
       Wall:=1;
       end;
end;

procedure TForm1.Zakocz1Click(Sender: TObject);
begin
Koniec(Sender);
end;

procedure TForm1.OstatniWidok1Click(Sender: TObject);
begin
Form6.ShowModal;
end;

procedure TForm1.Na2planszach1Click(Sender: TObject);
begin
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Poziom1.Enabled:=True;
Kon:=True;
Bek:=0;
FormPaint(Sender);
Form7.ShowModal;
end;

procedure TForm1.Na1planszy1Click(Sender: TObject);
begin
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Poziom1.Enabled:=True;
Kon:=True;
Bek:=0;
FormPaint(Sender);
Form8.Showmodal;
end;

end.
    
