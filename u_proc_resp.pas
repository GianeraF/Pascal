
Unit U_Proc_Resp;
{$codepage UTF8}
{$mode objfpc}{$H+}

Interface

Uses 
crt,U_Archivos;

Var 
  archivop: t_archivop;
Procedure Agregarrespuesta (Var archivop:t_archivop);
Procedure mostrarrespuestas (Var archivop:t_archivop);

Implementation


Procedure Agregarrespuesta(Var archivop:t_archivop);
//agregar respuestas

Var 
  i: t_dato;
  tecla: char;
Begin

  clrscr;
  write('Desea agregar respuesta? N para salir. ');
  readln (tecla);
  While tecla<> 'N' Do
    Begin
      writeln('Ingrese respuestas:') ;
      readln(i.respuesta);
      agregardato (archivop,i);
      write ('¿Continúa? Presione N para salir: ');
      readln (tecla);
    End;

End;
Procedure mostrarrespuestas (Var archivop:t_archivop);

Var 
  x: t_dato;
Begin
  assign(archivop,ruta);
  reset(archivop);
  While Not(eof(archivop)) Do
    Begin
      read(archivop,x);
      write (x.respuesta);
    End;
  close (archivop);
  readkey;
End;

End.
