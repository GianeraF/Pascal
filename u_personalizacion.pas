
Unit U_Personalizacion;
{$codepage UTF8}
{$mode objfpc}{$H+}

Interface

Uses 
CRT, U_Proc_Resp,U_Archivos,U_Proc_BOT;

Procedure vista;

Implementation
Procedure vista;

Var 
  i: byte;
Begin
  textcolor (6);
  gotoxy(43,1);
  writeln('=== Los Hoteles Hermanos ===');
  textcolor (5);
  For i:=15 To 100 Do
    Begin
      gotoxy(i,2);
      If i=15 Then
        Begin
          write('#')
        End;
      write('-');
    End;
  write('#');


  For i:=3 To 19 Do
    Begin
      gotoxy(15,i);
      write('|');
    End;

  For i:=15 To 100 Do
    Begin
      gotoxy(i,20);
      If i=15 Then
        Begin
          write('#')
        End;
      write('-');
    End;
  write('#');

  For i:=3 To 19 Do
    Begin
      gotoxy(101,i);
      write('|');
    End;

  For i:=15 To 100 Do
    Begin
      gotoxy(i,16);
      If i=15 Then
        Begin
          write('#')
        End;
      write('-');
    End;
  write('#');
  window (17,3,99,6);
  textcolor (9);
  writeln(
'¡Hola y bienvenido a los Hoteles Hermanos Family! Me llamo Gustavo, pero puedes    llamarme Gus.'
  );
  respuestabot(archivop);

End;

End.
