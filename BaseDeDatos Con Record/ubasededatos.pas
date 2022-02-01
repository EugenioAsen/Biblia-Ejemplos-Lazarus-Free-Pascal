unit uBaseDeDatos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TBaseDatos }

  TBaseDatos = class(TForm)
    btn_Anadir_Reg: TButton;
    btn_Insertar_Reg: TButton;
    btn_Borrar_Reg: TButton;
    btn_Guardar_Reg: TButton;
    btn_Borrar_BaseReg: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit_IrA: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Lb_NumRegActual: TLabel;
    Panel1: TPanel;
    sbtn_Primero: TSpeedButton;
    sbtn_Anterior: TSpeedButton;
    sbtn_Siguiente: TSpeedButton;
    sbtn_Ultimo: TSpeedButton;
    sbtn_IrAlReg: TSpeedButton;
    procedure btn_Anadir_RegClick(Sender: TObject);
    procedure btn_Borrar_BaseRegClick(Sender: TObject);
    procedure btn_Borrar_RegClick(Sender: TObject);
    procedure btn_Guardar_RegClick(Sender: TObject);
    procedure btn_Insertar_RegClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtn_AnteriorClick(Sender: TObject);
    procedure sbtn_IrAlRegClick(Sender: TObject);
    procedure sbtn_PrimeroClick(Sender: TObject);
    procedure sbtn_SiguienteClick(Sender: TObject);
    procedure sbtn_UltimoClick(Sender: TObject);
  private

  public
    procedure CogerReg(Index: integer);
    procedure GuardarReg(Index: integer);
    procedure DejarHuecoReg(index: integer);
    procedure BorrarReg(Index: integer);


  end;

type
  TAgenda = record
    Nombre: string[15];
    Apellido: string[30];
    Telefono: string[15];
    Domicilio: string[40];
  end;

var
  BaseDatos: TBaseDatos;

  agenda: Tagenda;
  Fagenda: file of TAgenda;
  fname: string;
  NrA, NrAc: integer;     // Numero max.de Registros y registro en el que esta

implementation

{$R *.lfm}

{ TBaseDatos }
//----------------------------------------------------------------
//       Crea y abre el Archivo de datos    (Agenda)
//----------------------------------------------------------------
procedure TBaseDatos.FormCreate(Sender: TObject);
begin
 //  Application.OnException:= Application.ShowException(E);
  fname := 'agenda.dat';
  assignfile(Fagenda, fname);
  FileMode := 2; // =0 solo lectura   2 Read/write

   Try
      Reset(Fagenda);
      NrA:= filesize(Fagenda);
    Except
      rewrite(Fagenda);
      reset(Fagenda);
      NrA:=0
    end;
    if NrA=0 then ShowMessage('La Agenda está vacia, Introduce Datos.');
   Lb_NumRegActual.Caption := IntToStr(NrAc) + ' de ' + IntToStr(NrA);
end;

//----------------------------------------------------------------
//       Cierra el Archivo de datos  (Agenda)
//----------------------------------------------------------------
procedure TBaseDatos.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closefile(fagenda);
end;

procedure TBaseDatos.btn_Borrar_BaseRegClick(Sender: TObject);
begin
  {
   rewrite(fagenda);
 closefile(fagenda);
  close ;
  }
end;

//-------------------------------------
//-----  Edición de registros   -----
//-------------------------------------

{Lee el Registro index(1-x)}
procedure TBaseDatos.CogerReg(Index: integer);
begin
  seek(fagenda, Index - 1);
  Read(fagenda, agenda);
  with agenda do
  begin
    Edit1.Text := Nombre;
    Edit2.Text := Apellido;
    Edit3.Text := telefono;
    Edit4.Text := Domicilio;
  end;
  Lb_NumRegActual.Caption := IntToStr(Nrac) + ' de ' + IntToStr(Nra);
end;

{Guarda el registro en la posicion index }
procedure TBaseDatos.GuardarReg(Index: integer);
begin
 if Nra=0 then Exit;
  seek(fagenda, Index - 1);
  with agenda do
  begin
    Nombre := Edit1.Text;
    Apellido := Edit2.Text;
    telefono := Edit3.Text;
    Domicilio := edit4.Text;
  end;
  Write(fagenda, agenda);
  Lb_NumRegActual.Caption := IntToStr(FilePos(fagenda)) + ' de ' + IntToStr(Nra);
end;

{Deja un Hueco en la posicion index para colocarlo en orden ascendente-descendente}
procedure TBaseDatos.DejarHuecoReg(index: integer);
var
  n: integer;
begin
  { Mueve el ultimo registro NrA a NrA +1 para dejar el registro Index libre para meter el NrAc  }
  for n := Nra downto Index do
  begin
    seek(fagenda, n - 1);
    Read(fagenda, agenda);
    seek(fagenda, n);
    Write(fagenda, agenda);
  end;
  seek(fagenda, index - 1);
end;

{Borra el Reg. Index Y recorta la base en un reg.}
procedure TBaseDatos.BorrarReg(Index: integer);
var
  n: integer;
begin
  for n := Index to Nra - 1 do
  begin
    seek(fagenda, n); //+1-1
    Read(fagenda, agenda);
    seek(fagenda, n - 1);
    Write(fagenda, agenda);
  end;
  seek(fagenda, Nra - 1);  {Quita el ultimo Registro}
  truncate(fagenda);
  seek(fagenda, Index - 1);
  if Nra = Nrac then
    Nrac := Nrac - 1;

  //Lb_NumRegActual.Caption:=IntToStr(FilePos(fagenda))+' de '+ IntToStr(Nra);
end;


//-------------------------------------
//-----  Botones de Edición de registros   -----
//-------------------------------------
procedure TBaseDatos.btn_Anadir_RegClick(Sender: TObject);
begin
  Nra := Nra + 1;
  NrAc := NrA;
  GuardarReg(Nrac);
end;


procedure TBaseDatos.btn_Borrar_RegClick(Sender: TObject);
begin
  if Nrac > 0 then
  begin   { Nra(1-x), seek(0-x),Nra=pos, seek=nra-1 }
    BorrarReg(Nrac);
    Nra := Nra - 1;  //  Nra:=filesize(fagenda);
    //  Las dos expresiones son iguales
    CogerReg(Nrac);
  end;
end;

procedure TBaseDatos.btn_Guardar_RegClick(Sender: TObject);
begin
  GuardarReg(Nrac);
end;

procedure TBaseDatos.btn_Insertar_RegClick(Sender: TObject);
begin
  DejarHuecoReg(Nrac);
  Nra := Nra + 1;
  GuardarReg(Nrac);
end;

//-------------------------------------
//-----  Botones de movimiento   -----
//-------------------------------------
procedure TBaseDatos.sbtn_AnteriorClick(Sender: TObject);
begin
  if Nrac > 1 then
  begin
    Nrac := Nrac - 1;
    CogerReg(Nrac);
  end;
end;


procedure TBaseDatos.sbtn_PrimeroClick(Sender: TObject);
begin
  NrAc := 1;
  CogerReg(1);
end;

procedure TBaseDatos.sbtn_SiguienteClick(Sender: TObject);
begin
  if Nrac < Nra then
  begin
    Nrac := Nrac + 1;
    CogerReg(Nrac);
  end;
end;

procedure TBaseDatos.sbtn_UltimoClick(Sender: TObject);
begin
  Nrac := Nra;
  CogerReg(Nrac);
end;

procedure TBaseDatos.sbtn_IrAlRegClick(Sender: TObject);
var
  i: integer;
begin
  i := StrToInt(Edit_IrA.Text);
  if (i > 0) and (i <= Nra) then
  begin
    Nrac := i;
    CogerReg(Nrac);
  end;
end;

end.
