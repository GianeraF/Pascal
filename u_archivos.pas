
Unit U_Archivos;
{$codepage UTF8}
{$mode objfpc}{$H+}

Interface

Const 
  ruta = 
   'C:\Users\feder\Desktop\Pascal\Chatbot final\Chatbot owo\Archivos\respuestas'
  ;

Type 
  T_DATO = Record
    respuesta: string[255];
  End;
  t_archivop = file Of t_Dato ;

Procedure agregardato(Var archivop:t_archivop;x:t_dato);
Procedure limpiararchivo(Var archivop:t_archivop);

Implementation
Procedure agregardato(Var archivop:t_archivop;x:t_dato);

Begin
  ASSIGN(archivop,ruta);
  reset(archivop);
  seek(archivop,filesize(archivop));
  write(archivop,x);
  close(archivop)
End;

Procedure limpiararchivo(Var archivop:t_archivop);
Begin
  assign(archivop,ruta);
  rewrite(archivop);
  close(archivop);
End;


End.
