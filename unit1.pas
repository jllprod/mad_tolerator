unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Grids,
  StdCtrls, StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    AffITInfArb1: TEdit;
    AffITInf2: TEdit;
    AffITInfArb2: TEdit;
    AffITSupArb1: TEdit;
    AffITSup2: TEdit;
    AffITSupArb2: TEdit;
    ajustementsAL: TStringGrid;
    AffITSup: TEdit;
    AffITInf: TEdit;
    ajustementsArbre: TStringGrid;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TolAlesage: TComboBox;
    Diametre: TEdit;
    TolArbre: TComboBox;
    procedure Calcul(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;
  Dianominal: double;
  ValTolAl:integer;
  ValTolArb:integer;
  ITSup: integer;
  ITInf: integer;
  ITSupArb: integer;
  ITInfArb: integer;
  ValITSup: integer;
  ValITInf: integer;
  ValITSupArb: integer;
  ValITInfArb: integer;
  TolRange: array [1..14] of integer=(0,3,6,10,18,30,50,80,120,180,250,315,400,500);
  col: integer;

implementation

{$R *.lfm}

{ TForm1 }





procedure TForm1.Calcul(Sender: TObject);


begin

       if (Diametre.text<>'') and (DelSpace(Diametre.text)<>'' ) then
       begin


                     col:=1;
                     Try
                  Dianominal := Strtofloat(DelSpace(Diametre.text));
                     except
                      On Dianominal : Exception do
                         begin
                      showmessage ('Seuls les caractères numériques sont autorisés !');
                        Diametre.text :='';

                        end;

                      end;



                  if Dianominal>Tolrange[14]  then
                       begin
                       showmessage ('valeur trop grande, calcul impossible');
                       Diametre.text :='';
                       exit;
                        end;
                  ValTolAl := TolAlesage.ItemIndex;
                  ValTolArb := TolArbre.ItemIndex;

                  ITSup:= (ValTolAl*2);
                  ITInf:= (ValTolAl*2)+1;
                  ITSupArb:= (ValTolArb*2);
                  ITInfArb:= (ValTolArb*2)+1;

                    while DiaNominal > TolRange[col+1] do
                    begin
                      Inc(col);
                    end;
                    Dec(col);

                     ValITSup:= strtoint(ajustementsAL.Cells[col,ITSup]);
                     ValITInf:= strtoint(ajustementsAL.Cells[col,ITInf]);
                     AffITSup.Text:=inttostr(ValITSup);
                     AffITSup2.Text:=floattostr(DiaNominal+ValITSup/1000);
                     AffITInf.Text:=inttostr(ValITInf);
                     AffITInf2.Text:=floattostr(DiaNominal+ValITInf/1000);

                     ValITSupArb:= strtoint(ajustementsArbre.Cells[col,ITSupArb]);
                     ValITInfArb:= strtoint(ajustementsArbre.Cells[col,ITInfArb]);
                     AffITSupArb1.Text:=inttostr(ValITSupArb);
                     AffITSupArb2.Text:=floattostr(DiaNominal+ValITSupArb/1000);
                     AffITInfArb1.Text:=inttostr(ValITInfArb);
                     AffITInfArb2.Text:=floattostr(DiaNominal+ValITInfArb/1000);
           end;


  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DefaultFormatSettings.DecimalSeparator := '.' ;
  diametre.SelectAll;
end;




end.

