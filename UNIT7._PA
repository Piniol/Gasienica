unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, INIFiles, StdCtrls, MMSystem;

type
  TForm7 = class(TForm)
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
    Timer2: TTimer;
    Ustawienia1: TMenuItem;
    OdtwarzajDwiki1: TMenuItem;
    Sciany1: TMenuItem;
    Zakocz1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer3: TTimer;
    Timer4: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Wyjcie1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
    procedure Timer2Timer(Sender: TObject);
    procedure OdtwarzajDwiki1Click(Sender: TObject);
    procedure Sciany1Click(Sender: TObject);
    procedure Zakocz1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Koniec0(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  X1,Y1,Kierunek1,Kulki1,Za1,Zb1,Poziom0,Bek1,Sound0,Wall0,X2,Y2,Kierunek2,Kulki2,Za2,Zb2,Bek2: Byte;
  Punkty1,Punkty2,Punkty1a,Punkty2a: Integer;
  Kon1,Kon2,Zje1,Zje2: Boolean;
  Tab0: array[1..225] of Integer = (-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
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
  TabA1, TabA2: array[1..225] of Integer;
  TabB1, TabB2: array[1..15,1..15] of Integer;
  Tab10: array[1..225] of Word = (10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,
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
  Tab20: array[1..225] of Word = (10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
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
const title='Gra Dwuosobowa ';

implementation

{$R *.DFM}

procedure TForm7.Koniec0(Sender: TObject);
begin
NowaGra1.Enabled:=True;
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Timer3.Enabled:=False;
Timer4.Enabled:=False;
Kon1:=True;
Bek1:=0;
Kon2:=True;
Bek2:=0;
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
FormPaint(Sender);
end;

procedure TForm7.Koniec1(Sender: TObject);
begin
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Kon1:=True;
if Kon2=True then
begin
 if Punkty1>Punkty2 then begin Punkty1a:=Punkty1a+1;end;
 if Punkty1<Punkty2 then begin Punkty2a:=Punkty2a+1;end;
 if Punkty1=Punkty2 then begin Punkty1a:=Punkty1a+1;end;
Label8.Caption:=IntToStr(Punkty1a);
Label7.Caption:=IntToStr(Punkty2a);
Poziom1.Enabled:=True;
NowaGra1.Enabled:=True;
end;
Bek1:=0;
if Sound0=1 then begin
if Kon2=True then
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'flawles'),0,snd_ASync) else
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'nie'),0,snd_ASync);end;
FormPaint(Sender);
end;

procedure TForm7.Koniec2(Sender: TObject);
begin
Kon2:=True;
Timer4.Enabled:=False;
Timer3.Enabled:=False;
if Kon1=True then begin
 if Punkty2>Punkty1 then begin Punkty2a:=Punkty2a+1;end;
 if Punkty2<Punkty1 then begin Punkty1a:=Punkty1a+1;end;
 if Punkty1=Punkty2 then begin Punkty2a:=Punkty2a+1;end;
label7.Caption:=IntToStr(Punkty2a);
label8.Caption:=IntToStr(Punkty1a);
Poziom1.Enabled:=True;
NowaGra1.Enabled:=True;end;
Bek2:=0;
if Sound0=1 then begin
if Kon1=True then
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'flawles'),0,snd_ASync) else
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'nie'),0,snd_ASync);end;
FormPaint(Sender);
end;

procedure TForm7.NowaGra0(Sender: TObject);
var I,J,Z: Byte;
    Ciag: String;
    Bitmapa: TBitmap;
    MyRect,MyOther: TRect;
begin
NowaGra1.Enabled:=False;;
Label1.Caption:='';
Label4.Caption:='';
Label2.Caption:='';
Label3.Caption:='';
if Sound0=1 then begin
PlaySound(PChar(ExtractFilePath(ParamStr(0))+'fight'),0,snd_ASync);end;
Form7.Caption:=title;
Poziom1.Enabled:=False;
Kon1:=False;
Kon2:=False;
X1:=8;
Y1:=8;
X2:=8;
Y2:=8;
Kulki1:=0;
Punkty1:=0;
Kulki2:=0;
Punkty2:=0;
Kierunek1:=(Random(4))+1;
Kierunek2:=(Random(4))+1;
 for I:=1 to 225 do
    begin
    TabA1[I]:=Tab0[I];
    TabA2[I]:=Tab0[I]
    end;
Z:=1;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       TabB1[I,J]:=TabA1[Z];
       TabB2[I,J]:=TabA2[Z];
       Inc(Z);
       end;
    end;
 repeat
  Za1:=(Random(12))+1; Zb1:=(Random(12))+1;
   if TabB1[Za1,Zb1]=0 then TabB1[Za1,Zb1]:=-3;
 until TabB1[Za1,Zb1]=-3;
repeat
  Za2:=(Random(12))+1; Zb2:=(Random(12))+1;
   if TabB2[Za2,Zb2]=0 then TabB2[Za2,Zb2]:=-3;
 until TabB2[Za2,Zb2]=-3;
FormPaint(Sender);
SetCursorPos(0,0);
Sleep(2000);
Timer1.Enabled:=True;
Timer2.Enabled:=True;
Timer3.Enabled:=True;
Timer4.Enabled:=True;
end;

procedure TForm7.Zjedzone1(Sender: TObject);
var I,J: Byte;
begin
Timer1.Enabled:=False;
Zje1:=False;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       if TabB1[I,J]>0 then Inc(TabB1[I,J]);
       end;
    end;
 repeat
  Za1:=(Random(12))+1; Zb1:=(Random(12))+1;
  if TabB1[Za1,Zb1]=0 then
     begin
     TabB1[Za1,Zb1]:=-3;
     Zje1:=True;
     end;
 until Zje1=True;
 if Zje1=True then
    begin
   Inc(Kulki1);
    if Wall0=0 then
       begin
        if Bek1<9 then begin
        Punkty1:=Punkty1+Poziom0;
        Bek1:=0;
        if Sound0=1 then begin
        PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);end; end else
         if Bek1=9 then
            begin
            Punkty1:=Punkty1-1;
            Bek1:=0;
            if Sound0=1 then begin
            PlaySound(PChar(ExtractFilePath(ParamStr(0))+'Bek'),0,snd_ASync);end;
            Timer2.Enabled:=True;
            end;
       end else
        if Wall0=1 then
           begin
            if Bek1<9 then begin
            Punkty1:=Punkty1+2;
            Bek1:=0;
            if Sound0=1 then begin
             PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);end; end else
             if Bek1=9 then
                begin
                Punkty1:=Punkty1-1;
                Bek1:=0;
                if Sound0=1 then begin
                PlaySound(PChar(ExtractFilePath(ParamStr(0))+'Bek'),0,snd_ASync);end;
                Timer2.Enabled:=True;
                end;
           end;
    Label2.Caption:=IntToStr(Punkty1);
    Label3.Caption:=IntToStr(Kulki1);
    Obliczenia1(Sender);
    Timer1.Enabled:=True;
    end else Zjedzone1(Sender);
end;

procedure TForm7.Zjedzone2(Sender: TObject);
var I,J: Byte;
begin
Timer4.Enabled:=False;
Zje2:=False;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       if TabB2[I,J]>0 then Inc(TabB2[I,J]);
       end;
    end;
 repeat
  Za2:=(Random(12))+1; Zb2:=(Random(12))+1;
  if TabB2[Za2,Zb2]=0 then
     begin
     TabB2[Za2,Zb2]:=-3;
     Zje2:=True;
     end;
 until Zje2=True;
 if Zje2=True then
    begin
   Inc(Kulki2);
    if Wall0=0 then
       begin
        if Bek2<9 then begin
        Punkty2:=Punkty2+Poziom0;
        Bek2:=0;
        if Sound0=1 then begin
        PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);end; end else
         if Bek2=9 then
            begin
            Punkty2:=Punkty2-1;
            Bek2:=0;
            if Sound0=1 then begin
            PlaySound(PChar(ExtractFilePath(ParamStr(0))+'Bek'),0,snd_ASync);end;
            Timer3.Enabled:=True;
            end;
       end else
        if Wall0=1 then
           begin
            if Bek2<9 then begin
            Punkty2:=Punkty2+2;
            Bek2:=0;
            if Sound0=1 then begin
             PlaySound(PChar(ExtractFilePath(ParamStr(0))+'mlask'),0,snd_ASync);end; end else
             if Bek2=9 then
                begin
                Punkty2:=Punkty2-1;
                Bek2:=0;
                if Sound0=1 then begin
                PlaySound(PChar(ExtractFilePath(ParamStr(0))+'Bek'),0,snd_ASync);end;
                Timer3.Enabled:=True;
                end;
           end;
    Label1.Caption:=IntToStr(Punkty2);
    Label4.Caption:=IntToStr(Kulki2);
    Obliczenia2(Sender);
    Timer4.Enabled:=True;
    end else Zjedzone2(Sender);
end;

procedure TForm7.Obliczenia1(Sender: TObject);
var I,J,A,B,C: Byte;
begin
C:= 1;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       if TabB1[I,J]>0 then TabB1[I,J]:=(TabB1[I,J])-1 else
       if TabB1[I,J]=-2 then TabB1[I,J]:=Kulki1;
       end;
    end;
TabB1[Y1,X1]:=-2;
 for A:=1 to 15 do
    begin
    for B:=1 to 15 do
       begin
       TabA1[C]:=TabB1[A,B];
       Inc(C);
       end;
    end;
FormPaint(Sender);
end;

procedure TForm7.Obliczenia2(Sender: TObject);
var I,J,A,B,C: Byte;
begin
C:= 1;
 for I:=1 to 15 do
    begin
    for J:=1 to 15 do
       begin
       if TabB2[I,J]>0 then TabB2[I,J]:=(TabB2[I,J])-1 else
       if TabB2[I,J]=-2 then TabB2[I,J]:=Kulki2;
       end;
    end;
TabB2[Y2,X2]:=-2;
 for A:=1 to 15 do
    begin
    for B:=1 to 15 do
       begin
       TabA2[C]:=TabB2[A,B];
       Inc(C);
       end;
    end;
FormPaint(Sender);
end;

procedure TForm7.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Timer1.Enabled=True then begin
  if (Key=VK_LEFT) and (Kulki1=0) then Kierunek1:=1;
  if (Key=VK_LEFT) and (Kulki1>0) and (Kierunek1=2) then Kierunek1:=2;
  if (Key=VK_LEFT) and (Kierunek1<>2) then Kierunek1:=1;
  if (Key=VK_RIGHT) and (Kulki1=0) then Kierunek1:=2;
  if (Key=VK_RIGHT) and (Kulki1>0) and (Kierunek1=1) then Kierunek1:=1;
  if (Key=VK_RIGHT) and (Kierunek1<>1) then Kierunek1:=2;
  if (Key=VK_UP) and (Kulki1=0) then Kierunek1:=3;
  if (Key=VK_UP) and (Kulki1>0) and (Kierunek1=4) then Kierunek1:=4;
  if (Key=VK_UP) and (Kierunek1<>4) then Kierunek1:=3;
  if (Key=VK_DOWN) and (Kulki1=0) then Kierunek1:=4;
  if (Key=VK_DOWN) and (Kulki1>0) and (Kierunek1=3) then Kierunek1:=3;
  if (Key=VK_DOWN) and (Kierunek1<>3) then Kierunek1:=4;
 end;
if Timer4.Enabled=True then begin
  if (Key=65) and (Kulki2=0) then Kierunek2:=1;
  if (Key=65) and (Kulki2>0) and (Kierunek2=2) then Kierunek2:=2;
  if (Key=65) and (Kierunek2<>2) then Kierunek2:=1;
  if (Key=68) and (Kulki2=0) then Kierunek2:=2;
  if (Key=68) and (Kulki2>0) and (Kierunek2=1) then Kierunek2:=1;
  if (Key=68) and (Kierunek2<>1) then Kierunek2:=2;
  if (Key=87) and (Kulki2=0) then Kierunek2:=3;
  if (Key=87) and (Kulki2>0) and (Kierunek2=4) then Kierunek2:=4;
  if (Key=87) and (Kierunek2<>4) then Kierunek2:=3;
  if (Key=83) and (Kulki2=0) then Kierunek2:=4;
  if (Key=83) and (Kulki2>0) and (Kierunek2=3) then Kierunek2:=3;
  if (Key=83) and (Kierunek2<>3) then Kierunek2:=4;
 end;
end;

procedure TForm7.Wyjcie1Click(Sender: TObject);
begin
Form7.Close;
end;

procedure TForm7.Timer1Timer(Sender: TObject);
var I,J: Integer;
begin

 if Kierunek1=1 then
 if Wall0=0 then BEGIN
    begin
     if (TabB1[Y1,X1-1]=0) or (TabB1[Y1,X1-1]=1) then
        begin
        X1:=X1-1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1,X1-1]<=-3 then
            begin
            X1:=X1-1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1,X1-1]>1) or (TabB1[Y1,X1-1]=-1) then Koniec1(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB1[Y1,X1-1]=0) or (TabB1[Y1,X1-1]=1) then
         begin
         X1:=X1-1;
         Obliczenia1(Sender);
         end else
          if TabB1[Y1,X1-1]<=-3 then
             begin
             X1:=X1-1;
             Zjedzone1(Sender);
             end else
             if (TabB1[Y1,X1-1]=-1) and (TabB1[Y1,X1+12]<=-3) then begin
             X1:=x1+12;
             Zjedzone1(Sender); end else
              if (TabB1[Y1,X1-1]>1) or (TabB1[Y1,X1+12]>1) then Koniec1(Sender) else
              if TabB1[Y1,X1-1]=-1 then begin
              X1:=X1+12;
             Obliczenia1(Sender);
             end;
          END;

 if Kierunek1=2 then
 if Wall0=0 then BEGIN
    begin
     if (TabB1[Y1,X1+1]=0) or (TabB1[Y1,X1+1]=1) then
        begin
        X1:=X1+1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1,X1+1]<=-3 then
            begin
            X1:=X1+1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1,X1+1]>1) or (TabB1[Y1,X1+1]=-1) then Koniec1(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB1[Y1,X1+1]=0) or (TabB1[Y1,X1+1]=1) then
         begin
         X1:=X1+1;
         Obliczenia1(Sender);
         end else
          if TabB1[Y1,X1+1]<=-3 then
             begin
             X1:=X1+1;
             Zjedzone1(Sender);
             end else
             if (TabB1[Y1,X1+1]=-1) and (TabB1[Y1,X1-12]<=-3) then begin
             X1:=x1-12;
             Zjedzone1(Sender); end else
              if (TabB1[Y1,X1+1]>1) or (TabB1[Y1,X1-12]>1) then Koniec1(Sender) else
              if TabB1[Y1,X1+1]=-1 then begin
              X1:=X1-12;
             Obliczenia1(Sender);
             end;
          END;

 if Kierunek1=3 then
 if Wall0=0 then BEGIN
    begin
     if (TabB1[Y1-1,X1]=0) or (TabB1[Y1-1,X1]=1) then
        begin
        Y1:=Y1-1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1-1,X1]<=-3 then
            begin
            Y1:=Y1-1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1-1,X1]>1) or (TabB1[Y1-1,X1]=-1) then Koniec1(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB1[Y1-1,X1]=0) or (TabB1[Y1-1,X1]=1) then
         begin
         Y1:=Y1-1;
         Obliczenia1(Sender);
         end else
          if TabB1[Y1-1,X1]<=-3 then
             begin
             Y1:=Y1-1;
             Zjedzone1(Sender);
             end else
             if (TabB1[Y1-1,X1]=-1) and (TabB1[Y1+12,X1]<=-3) then begin
             y1:=y1+12;
             Zjedzone1(Sender); end else
              if (TabB1[Y1-1,X1]>1) or (TabB1[Y1+12,X1]>1) then Koniec1(Sender) else
              if TabB1[Y1-1,X1]=-1 then begin
              Y1:=Y1+12;
             Obliczenia1(Sender);
             end;
          END;

 if Kierunek1=4 then
 if Wall0=0 then BEGIN
    begin
     if (TabB1[Y1+1,X1]=0) or (TabB1[Y1+1,X1]=1) then
        begin
        Y1:=Y1+1;
        Obliczenia1(Sender);
        end else
         if TabB1[Y1+1,X1]<=-3 then
            begin
            Y1:=Y1+1;
            Zjedzone1(Sender);
            end else
             if (TabB1[Y1+1,X1]>1) or (TabB1[Y1+1,X1]=-1) then Koniec1(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB1[Y1+1,X1]=0) or (TabB1[Y1+1,X1]=1) then
         begin
         Y1:=Y1+1;
         Obliczenia1(Sender);
         end else
          if TabB1[Y1+1,X1]<=-3 then
             begin
             Y1:=Y1+1;
             Zjedzone1(Sender);
             end else
             if (TabB1[Y1+1,X1]=-1) and (TabB1[Y1-12,X1]<=-3) then begin
             y1:=y1-12;
             Zjedzone1(Sender); end else
              if (TabB1[Y1+1,X1]>1) or (TabB1[Y1-12,X1]>1) then Koniec1(Sender) else
              if TabB1[Y1+1,X1]=-1 then begin
              Y1:=Y1-12;
             Obliczenia1(Sender);
             end;
          END;
end;

procedure TForm7.NowaGra1Click(Sender: TObject);
begin
NowaGra0(Sender);
end;

procedure TForm7.FormPaint(Sender: TObject);
var I,J:integer;
    MyRect,MyRect2,MyRect3,MyRect4,MyRect5,MyOther, MyOther2: TRect;
    Bitmapa: TBitmap;
begin
MyRect:=Rect(43,1,63,21);
MyRect2:=Rect(1,1,21,21);
MyRect3:=Rect(22,1,42,21);
MyRect4:=Rect(64,1,84,21);
MyRect5:=Rect(22,22,42,42);
Bitmapa:=TBitmap.Create;
Bitmapa.LoadFromFile(ExtractFilePath(ParamStr(0))+'grafika');
if Kon1=True then
   begin
   Canvas.Pen.Color:=clBlack;
   Canvas.Brush.Style:=bsSolid;
   Canvas.Brush.Color:=clBlack;
   Form7.Canvas.Rectangle(320,0,650,Form7.Height);
end else
 for I:=1 to 225 do
    begin
    MyOther := Rect(Tab10[I]+310,Tab20[I],Tab10[I]+330,Tab20[I]+20);
    if TabA1[I]=-1 then
    Form7.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect) else
    if TabA1[I]=-2 then
    Form7.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect4) else
    if TabA1[I]=-3 then
    Form7.Canvas.Copyrect(MyOther,Bitmapa.Canvas,MyRect3) else
    if TabA1[I]=-4 then
    Form7.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect5) else
    if TabA1[I]>0 then
    Form7.Canvas.CopyRect(MyOther,Bitmapa.Canvas,MyRect2);
    if TabA1[i]=0 then
       begin
       Canvas.Pen.Color:=clBlack;
       Canvas.Brush.Color:=clBlack;
       Canvas.Brush.Style:=bsSolid;
       Form7.Canvas.Rectangle(Tab10[I]+310,Tab20[I],Tab10[I]+330,Tab20[I]+20);
       end
     end;

if Kon2=True then
   begin
   Canvas.Brush.Style:=bsSolid;
   Canvas.Brush.Color:=clBlack;
   Form7.Canvas.Rectangle(0,0,310,Form7.Height);
end else
   for J:=1 to 225 do
    begin
    MyOther2 := Rect(Tab10[j],Tab20[j],Tab10[j]+20,Tab20[j]+20);
    MyRect4:=Rect(64,22,84,42);
    MyRect2:=Rect(1,22,21,42);
    if TabA2[j]=-1 then
    Form7.Canvas.CopyRect(MyOther2,Bitmapa.Canvas,MyRect) else
    if TabA2[j]=-2 then
    Form7.Canvas.CopyRect(MyOther2,Bitmapa.Canvas,MyRect4) else
    if TabA2[j]=-3 then
    Form7.Canvas.Copyrect(MyOther2,Bitmapa.Canvas,MyRect3) else
    if TabA2[j]=-4 then
    Form7.Canvas.CopyRect(MyOther2,Bitmapa.Canvas,MyRect5) else
    if TabA2[j]>0 then
    Form7.Canvas.CopyRect(MyOther2,Bitmapa.Canvas,MyRect2);
    if TabA2[j]=0 then
       begin
       Canvas.Brush.Color:=clBlack;
       Canvas.Brush.Style:=bsSolid;
       Form7.Canvas.Rectangle(Tab10[j],Tab20[j],Tab10[j]+20,Tab20[j]+20);
       end;
    end;
Bitmapa.Free;
end;

procedure TForm7.FormCreate(Sender: TObject);
var Plik: TINIFile;
    I: Byte;
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
  case Plik.ReadInteger('POZIOM','w1',0) of
   0: Wall0:=0;
   1: Wall0:=1;
  end;
  Sciany1.Checked:=Plik.ReadBool('POZIOM','c1',FALSE);
  Sciany1.Enabled:=Plik.ReadBool('POZIOM','e1',FALSE);
  case Plik.ReadInteger('POZIOM','p1',2) of
   1: begin atwy1.Checked:=True; Poziom0:=1; Timer1.Interval:=150;  Timer4.Interval:=150;end;
   2: begin Normalny1.Checked:=True; Poziom0:=2; Timer1.Interval:=100; Timer4.Interval:=100;end;
   3: begin Trudny1.Checked:=True; Poziom0:=3; Timer1.Interval:=50; Timer4.Interval:=50;end;
  end;
  case Plik.ReadInteger('SOUND','s1',1) of
   0: begin OdtwarzajDwiki1.Checked:=False; Sound0:=0; end;
   1: begin OdtwarzajDwiki1.Checked:=True; Sound0:=1; end;
  end;
 finally
 Plik.Free;
 end;
Bitmapa.Free;
end;

procedure TForm7.Pauza1Click(Sender: TObject);
begin
 If Pauza1.Caption='Pauza' then
    begin
    Pauza1.Caption:='Start';
    Timer1.Enabled:=False;
    Timer2.Enabled:=False;
    Timer3.Enabled:=False;
    Timer4.Enabled:=False;
    Form7.Caption:=title+'Pauza';
    end else
       begin
       Pauza1.Caption:='Pauza';
       Timer1.Enabled:=True;
       Timer2.Enabled:=True;
       Timer3.Enabled:=True;
       Timer4.Enabled:=True;
       Form7.Caption:=title;
       SetCursorPos(0,0);
       end;
end;

procedure TForm7.atwy1Click(Sender: TObject);
begin
Normalny1.Checked:=False;
Trudny1.Checked:=False;
atwy1.Checked:=True;
Poziom0:=1;
Timer1.Interval:=150;
Timer4.Interval:=150;
Sciany1.Enabled:=False;
Wall0:=0;
end;

procedure TForm7.Normalny1Click(Sender: TObject);
begin
Normalny1.Checked:=True;
Trudny1.Checked:=False;
atwy1.Checked:=False;
Poziom0:=2;
Timer1.Interval:=100;
Timer4.Interval:=100;
Sciany1.Enabled:=False;
Wall0:=0;
end;

procedure TForm7.Trudny1Click(Sender: TObject);
begin
Normalny1.Checked:=False;
Trudny1.Checked:=True;
atwy1.Checked:=False;
Poziom0:=3;
Timer1.Interval:=50;
Timer4.Interval:=50;
Sciany1.Enabled:=True;
if Sciany1.Checked=True then
Wall0:=1 else Wall0:=0;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
var Plik: TINIFile;
text: PChar;
begin
Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
Plik.WriteInteger('POZIOM','p1',Poziom0);
Plik.WriteInteger('SOUND','s1',Sound0);
Plik.WriteInteger('POZIOM','w1',Wall0);
Plik.WriteBool('POZIOM','c1',Sciany1.Checked);
Plik.WriteBool('POZIOM','e1',Sciany1.Enabled);
Plik.Free;
if Punkty1a>Punkty2a then begin
text:=PChar('Zawody wygra³ Gracz 2'); end else
if Punkty1a<Punkty2a then begin
text:=PChar('Zawody wygra³ Gracz 1'); end else
if Punkty1a=Punkty2a then begin
text:=PChar('Gracze zremisowali'); end;
application.messagebox(text,'Zwyciêzca',mb_ok);
end;

procedure TForm7.Timer2Timer(Sender: TObject);
begin
Inc(Bek1);
 if Bek1=9 then
    begin
    TabB1[Za1,Zb1]:=-4;
    Timer2.Enabled:=False;
    end;
end;

procedure TForm7.OdtwarzajDwiki1Click(Sender: TObject);
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

procedure TForm7.Sciany1Click(Sender: TObject);
begin
 If Sciany1.Checked=True then
    begin
    Sciany1.Checked:=False;
    Wall0:=0;
    end else
       begin
       Sciany1.Checked:=True;
       Wall0:=1;
       end;
end;

procedure TForm7.Zakocz1Click(Sender: TObject);
begin
Koniec0(Sender);
end;

procedure TForm7.Timer3Timer(Sender: TObject);
begin
Inc(Bek2);
 if Bek2=9 then
    begin
    TabB2[Za2,Zb2]:=-4;
    Timer3.Enabled:=False;
    end;
end;

procedure TForm7.Timer4Timer(Sender: TObject);
var I,J: Integer;
begin

 if Kierunek2=1 then
 if Wall0=0 then BEGIN
    begin
     if (TabB2[Y2,X2-1]=0) or (TabB2[Y2,X2-1]=1) then
        begin
        X2:=X2-1;
        Obliczenia2(Sender);
        end else
         if TabB2[Y2,X2-1]<=-3 then
            begin
            X2:=X2-1;
            Zjedzone2(Sender);
            end else
             if (TabB2[Y2,X2-1]>1) or (TabB2[Y2,X2-1]=-1) then Koniec2(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB2[Y2,X2-1]=0) or (TabB2[Y2,X2-1]=1) then
         begin
         X2:=X2-1;
         Obliczenia2(Sender);
         end else
          if TabB2[Y2,X2-1]<=-3 then
             begin
             X2:=X2-1;
             Zjedzone2(Sender);
             end else
             if (TabB2[Y2,X2-1]=-1) and (TabB2[Y2,X2+12]<=-3) then begin
             x2:=x2+12;
             Zjedzone2(Sender); end else
              if (TabB2[Y2,X2-1]>1) or (TabB2[Y2,X2+12]>1) then Koniec2(Sender) else
              if TabB2[Y2,X2-1]=-1 then begin
              X2:=X2+12;
             Obliczenia2(Sender);
             end;
          END;

 if Kierunek2=2 then
 if Wall0=0 then BEGIN
    begin
     if (TabB2[Y2,X2+1]=0) or (TabB2[Y2,X2+1]=1) then
        begin
        X2:=X2+1;
        Obliczenia2(Sender);
        end else
         if TabB2[Y2,X2+1]<=-3 then
            begin
            X2:=X2+1;
            Zjedzone2(Sender);
            end else
             if (TabB2[Y2,X2+1]>1) or (TabB2[Y2,X2+1]=-1) then Koniec2(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB2[Y2,X2+1]=0) or (TabB2[Y2,X2+1]=1) then
         begin
         X2:=X2+1;
         Obliczenia2(Sender);
         end else
          if TabB2[Y2,X2+1]<=-3 then
             begin
             X2:=X2+1;
             Zjedzone2(Sender);
             end else
             if (TabB2[Y2,X2+1]=-1) and (TabB2[Y2,X2-12]<=-3) then begin
             x2:=x2-12;
             Zjedzone2(Sender); end else
              if (TabB2[Y2,X2+1]>1) or (TabB2[Y2,X2-12]>1) then Koniec2(Sender) else
              if TabB2[Y2,X2+1]=-1 then begin
              X2:=X2-12;
             Obliczenia2(Sender);
             end;
          END;

 if Kierunek2=3 then
 if Wall0=0 then BEGIN
    begin
     if (TabB2[Y2-1,X2]=0) or (TabB2[Y2-1,X2]=1) then
        begin
        Y2:=Y2-1;
        Obliczenia2(Sender);
        end else
         if TabB2[Y2-1,X2]<=-3 then
            begin
            Y2:=Y2-1;
            Zjedzone2(Sender);
            end else
             if (TabB2[Y2-1,X2]>1) or (TabB2[Y2-1,X2]=-1) then Koniec2(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB2[Y2-1,X2]=0) or (TabB2[Y2-1,X2]=1) then
         begin
         Y2:=Y2-1;
         Obliczenia2(Sender);
         end else
          if TabB2[Y2-1,X2]<=-3 then
             begin
             Y2:=Y2-1;
             Zjedzone2(Sender);
             end else
             if (TabB2[Y2-1,X2]=-1) and (TabB2[Y2+12,X2]<=-3) then begin
             y2:=y2-12;
             Zjedzone2(Sender); end else
              if (TabB2[Y2-1,X2]>1) or (TabB2[Y2+12,X2]>1) then Koniec2(Sender) else
              if TabB2[Y2-1,X2]=-1 then begin
              Y2:=Y2+12;
             Obliczenia2(Sender);
             end;
          END;

 if Kierunek2=4 then
 if Wall0=0 then BEGIN
    begin
     if (TabB2[Y2+1,X2]=0) or (TabB2[Y2+1,X2]=1) then
        begin
        Y2:=Y2+1;
        Obliczenia2(Sender);
        end else
         if TabB2[Y2+1,X2]<=-3 then
            begin
            Y2:=Y2+1;
            Zjedzone2(Sender);
            end else
             if (TabB2[Y2+1,X2]>1) or (TabB2[Y2+1,X2]=-1) then Koniec2(Sender);
    end;
    END ELSE
   if Wall0=1 then BEGIN
    if (TabB2[Y2+1,X2]=0) or (TabB2[Y2+1,X2]=1) then
         begin
         Y2:=Y2+1;
         Obliczenia2(Sender);
         end else
          if TabB2[Y2+1,X2]<=-3 then
             begin
             Y2:=Y2+1;
             Zjedzone2(Sender);
             end else
             if (TabB2[Y2+1,X2]=-1) and (TabB2[Y2-12,X2]<=-3) then begin
             y2:=y2-12;
             Zjedzone2(Sender); end else
              if (TabB2[Y2+1,X2]>1) or (TabB2[Y2-12,X2]>1) then Koniec2(Sender) else
              if TabB2[Y2+1,X2]=-1 then begin
              Y2:=Y2-12;
             Obliczenia2(Sender);
             end;
          END;
end;

procedure TForm7.FormShow(Sender: TObject);
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

end.
