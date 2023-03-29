
Unit U_Proc_BOT;
  {$codepage UTF8}
{$mode objfpc}{$H+}

Interface

Uses 
CRT,U_Proc_Resp,U_Archivos,math;

Const 
  N = 16 ;

Type 
  t_datoV = integer;
  t_vector = array [1..N] Of t_datoV;

Procedure ingresapregunta (Var cad:String);
Procedure encontrarpalabra (Var V:t_vector ; Var cad:String);
Procedure respuestabot (Var archivop:t_archivop);
Procedure inicializarV(Var v:t_vector);
Procedure mostrarresp(Var archivop:t_archivop;Var p:integer);

Implementation
Procedure inicializarV(Var v:t_vector);

Var 
  i: byte;
Begin
  For i:= 1 To n Do
    v[i] := 0;
End;


Procedure ingresapregunta (Var cad:String);
Begin
  textcolor (14);
  window(17,18,75,19);
  clrscr;
  Readln (cad);
  window (17,3,99,6);
  clrscr;
  window (75,5,99,7);
  clrscr;
  writeln (cad);


End;
Procedure encontrarpalabra (Var V:t_vector ; Var cad:String);

Var 
  minuscula: string;

Begin
  InicializarV(v);
  minuscula := lowercase (cad);
  v[1] := pos('fumar',minuscula)+pos('cigarrillos',minuscula);
  // fumar
  v[2] := pos('hola',minuscula)+ pos('saludos',minuscula)+ pos('buenas',
          minuscula);
  // Saludo
  v[3] := pos('horarios',minuscula)+ pos('hora',minuscula)+ pos('abierto',
          minuscula)+ pos('cerrado',minuscula)+ pos('cierra',minuscula)+ pos(
          'abre',minuscula);
  // Horarios
  v[4] := pos('servicio',minuscula) + pos('limpieza',minuscula)+ pos('limpian',
          minuscula)+ pos('mucama',minuscula);
  // Servicio habitacion
  v[5] := pos('piscina',minuscula)+pos('pileta',minuscula)+pos('jacuzzi',
          minuscula)+pos('masaje',minuscula)+pos('masaje',minuscula)+pos('spa',
          minuscula);
  // Pileta
  v[6] := pos('comida',minuscula) + pos('comidas',minuscula)+ pos('restaurante',
          minuscula)+ pos('parrilla',minuscula)+ pos('desayuno',minuscula)+ pos(
          'merienda',minuscula)+ pos('cena',minuscula)+ pos('asado',minuscula)+
          pos('comer',minuscula);
  // Comidas
  v[7] := pos('disponibles',minuscula)+pos('libre',minuscula)+pos('libres',
          minuscula)+pos('disponible',minuscula)+pos('vacia',minuscula)+pos(
          'vacio',minuscula)+pos('desocupada',minuscula)+pos('desocupado',
          minuscula);
  // Habitaciones disponibles
  v[8] := pos('hay',minuscula)+ pos('tienen',minuscula)+ pos('poseen',minuscula)
  ;
  // Habitaciones
  v[9] := pos('documentacion',minuscula)+pos('documentos',minuscula)+pos(
          'presentar',minuscula)+pos('abonar',minuscula)+pos('pagar',minuscula)+
          pos('pago',minuscula)+pos('abono',minuscula)+pos('noche',minuscula)+
          pos('vale',minuscula);
  // Que debo presentar
  v[10] := pos('reservar',minuscula)+pos('alquilar',minuscula);
  // Quiero reservar
  v[11] := pos('gracias',minuscula) + pos('agradezco',minuscula);
  // Gracias
  v[12] := pos('chau',minuscula) + pos('nos vemos',minuscula)+pos('adios',
           minuscula)+pos('hasta pronto',minuscula);
  // Adios
  v[13] := pos('creador',minuscula) + pos('creo',minuscula) + pos('sos',
           minuscula)+ pos('llamas', minuscula)+ pos('nombre', minuscula);
  // Creadores
  v[14] := pos('habitacion',minuscula)+pos('pieza',minuscula)+pos('cuarto',
           minuscula)+pos('alojamiento',minuscula);
  //piezas
  v[15] := pos('/ar',minuscula);
  //comando de admin para agregar
  v[16] := pos('doble',minuscula) + pos('simple',minuscula)+ pos('triple',
           minuscula)+ pos('suite',minuscula)+ pos('venden',minuscula);
  //auxiliar para v8
End;


Procedure mostrarresp(Var archivop:t_archivop;Var p:integer);

Var 
  x: t_Dato;
Begin
  textmode(10);
  assign(archivop,ruta);
  reset(archivop);
  seek(archivop,p);
  read(archivop,x);
  window (17,8,60,15)  ;
  // RESPUESTA BOT
  clrscr;
  write(x.respuesta);
  window (17,24,60,25)  ;
  // TXT
  close(archivop);
End;


Procedure respuestabot (Var archivop:t_archivop);

Var 
  cad: string;
  v: t_vector;
  p: integer;
  res: string[2];

Begin
  Repeat
    ingresapregunta (cad);
    encontrarpalabra(v,cad);
    p := -1;
    If (v[1] > 0) Then //fumar
      Begin
        p := 0;
        mostrarresp(archivop,p);
      End;

    If (v[2] > 0) Then // saludos
      Begin
        p := 1;
        mostrarresp(archivop,p);
      End;

    If (v[3] > 0) Then // horarios
      Begin
        p := 2;
        mostrarresp(archivop,p);
      End;

    If (v[4] > 0) Then // limpieza
      Begin
        p := 3;
        mostrarresp(archivop,p);
      End;

    If (v[5] > 0) Then // pileta
      Begin
        p := 4;
        mostrarresp(archivop,p);
      End;

    If (v[6] > 0)Then // comida
      Begin
        p := 5;
        mostrarresp(archivop,p);
      End;

    If (v[7] > 0) Then // habitaciones disponibles
      Begin
        p := 6;
        mostrarresp(archivop,p);
      End;

    If (v[7] > 0) And (v[14] > 0) Then // habitaciones disponibles
      Begin
        p := 6;
        mostrarresp(archivop,p);
      End;

    If (v[16] > 0) Then // que habitaciones tienen
      Begin
        p := 9;
        mostrarresp(archivop,p);
      End;

    If (v[14] > 0) Then // que habitaciones tienen v1
      Begin
        p := 7;
        mostrarresp(archivop,p);
      End;

    If (v[8] > 0) And (v[14] > 0) Then // que habitaciones tienen
      Begin
        p := 7;
        mostrarresp(archivop,p);
      End;

    If (v[9] > 0)  Then // presentar documentacion
      Begin
        p := 8;
        mostrarresp(archivop,p);
      End;

    If (v[10] > 0)  Then // reservar habitacion
      Begin
        p := 9;
        mostrarresp(archivop,p);
      End;

    If (v[10] > 0) And (v[14] > 0) Then // reservar habitacion
      Begin
        p := 9;
        mostrarresp(archivop,p);
      End;

    If (v[11] > 0)Then  // agradecimiento
      Begin
        p := 10;
        mostrarresp(archivop,p);
        readln(res);
        clrscr;
      End;
    If res='no' Then
      Begin
        window (17,3,99,6);
        clrscr;
        window (75,5,99,7);
        clrscr;

        textcolor (14);
        window(17,18,75,19);
        clrscr;

        window (17,8,60,15)  ;
        p := 11;
        mostrarresp(archivop,p);

        Delay (2000);
        p := -2;
      End;


    If (v[13] > 0) Then  // quien sos
      Begin
        p := 12;
        mostrarresp(archivop,p);
      End;

    If (v[15] > 0) Then // agregar
      Begin
        agregarrespuesta(archivop);
      End;


    If (v[12]>0) Then          // despedida
      Begin
        window (17,8,60,15)  ;
        p := 11;
        mostrarresp(archivop,p);

        Delay (2000);
        p := -2;
      End;





    If p=-1 Then
      Begin
        window (17,8,60,15)  ;
        clrscr;
        writeln('No entendi, reformule la pregunta');
      End;

  Until p=-2;

End;

End.
