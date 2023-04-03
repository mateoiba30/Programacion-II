Program lista_de_listas_y_arbol_de_listas;
Uses
     sysutils;
Type
     str10= string[10];
     jugador = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;
     jugadorcito=record
               fecha:str10;
               puntaje:integer;
     end;

     lista_pj=^nodoLPJ;
     nodoLPJ=record
               dato:jugadorcito;
               sig:lista_pj;
     end;

     jugador_fecha=record
                   dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              listita:lista_pj;

     end;

     arbol=^nodoA;
     nodoA=record
       dato:jugador_fecha;
       hi:arbol;
       hd:arbol;
     end;

procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(36000000)+20000000;
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;

procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

//cargar ABO de listas
procedure cargarlistita(var l: lista_pj; f:str10; p:integer);
var
  aux: lista_pj;
begin
  new(aux);
  aux^.dato.fecha := f;
  aux^.dato.puntaje := p;
  aux^.sig := l;
  l:= aux;
end;

procedure insertar_en_ABO (var a:arbol; j:jugador; f:str10);
//var
 //  nue:arbol;
begin
 if(a=nil)then begin   // no hace falta modularizar
   new(a);                //no hace falta usar nue???
   a^.dato.dni:=j.dni;
   a^.dato.nombreApellido:=j.nombreApellido;
   a^.dato.posicion:=j.posicion;
   a^.dato.listita:=nil;
   cargarlistita(a^.dato.listita,f,j.puntaje);
   a^.HI:=nil;
   a^.HD:=nil;
   //a:=nue;
 end
 else begin
   if(a^.dato.dni>j.dni)then begin
     insertar_en_ABO(a^.HI,j,f);
   end
   else begin
      if(a^.dato.dni<j.dni)then
        insertar_en_ABO(a^.HD,j,f)
      else begin  //en el caso que el dni sea igual incrementamos la lista
        cargarlistita(a^.dato.listita,f,j.puntaje);
      end;
   end;
 end;

end;

procedure recorrer_lista_jugadores(var a:arbol; l:lista; f:str10);
begin
  while(l<>nil)do begin
      insertar_en_ABO(a,l^.dato,f);
      l:=l^.sig;
  end;
end;

procedure Recorrer_lista_de_listas (var a:arbol; l:listaPartidos);

begin
  while (l<>nil)do begin
      recorrer_lista_jugadores(a,l^.dato.jugadores,l^.dato.fecha);
      l:=l^.sig;
  end;
end;

//informar arbol de listas
function recorrer_y_sumar (l:lista_pj):integer;
var
   sumaP:integer;
begin
 sumaP:=0;
 while (l<>nil)do begin
     sumaP:=sumaP+l^.dato.puntaje;
     l:=l^.sig;
 end;
 recorrer_y_sumar:=sumaP;
end;

Procedure imprimir_enOrden( a: arbol ); //se procesa 1ro algún hijo, tiende  air a la izquierda imprimiendo de abajo para arriba, dejando todo en orden
begin
  if ( a <> nil ) then begin
    imprimir_enOrden (a^.HD);  //si acá podría HI y luego HD en la línea 197 me imprime la lista de Mayor  a Menor

    with a^.dato do
      writeln(dni,'    ',recorrer_y_sumar(a^.dato.listita),'      ',posicion,'     ',nombreApellido);

    imprimir_enOrden (a^.HI);
  end;
end;

procedure recorrer_acotado (a:arbol; MAX,MIN:longint; var cant:integer);//con la funcion no voy a ir podiendo acumular un valor
begin
  if (a <> nil) then
    if (a^.dato.dni >= MIN) then   //como hay iguales, incluye los límites. pero si el límite es ej:2 va a imprimirlo pero tmb va a analizar a su hijo por izquierda innecesariamente
      if (a^.dato.dni<= MAX) then begin
                                         //si pongo el write acá, me imprime pre orden
        recorrer_acotado(a^.hi,MAX,MIN,cant);
        cant:=cant+1;      //si pongo el write acá, me imprime en orden
        recorrer_acotado (a^.hd,MAX,MIN,cant);
         //si pongo el write acá, me imprime post orden
      end
      else
        recorrer_acotado(a^.hi,MAX,MIN,cant)
    else
      recorrer_acotado(a^.hd,MAX,MIN,cant);
end;

procedure recorrer_ABO(a:arbol; var cantPos:integer; pos:str10);
begin
  if ( a <> nil ) then begin
    recorrer_ABO (a^.HD,cantPos,pos);  //si acá podría HI y luego HD en la línea 197 me imprime la lista de Mayor  a Menor

    if (a^.dato.posicion=pos)then
      cantPos:=cantPos+1;

    recorrer_ABO (a^.HI,cantPos,pos);
  end;
end;

procedure preguntar_pos_a_buscar (var pos:str10);
var
   num:integer;
begin
     writeln('ingrese la posicion a buscar');
     writeln('1: arquero - 2:defensor - 3:mediocampista - 4:delantero');
     readln(num);
     case num of
                1: pos:= 'arquero';
                2: pos:= 'defensa';
                3: pos:= 'mediocampo';
                4: pos:= 'delantero';
              end;
end;


var
   a:arbol;
   l: listaPartidos;
   MIN,MAX:longint;
   cant,cantPos:integer;
   pos:str10;
begin
     Randomize;
     cant:=0;
     cantPos:=0;
     MIN:=30000000;
     MAX:=40000000;
     a:=nil;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     Recorrer_lista_de_listas(a,l);
     writeln('-----------------------');
     writeln('DNI     | puntaje | posicion      | nombre ');
     imprimir_enOrden(a);
     writeln('-----------------------');
     recorrer_acotado(a,MAX,MIN,cant);
     writeln('cantidad de DNI dentro del rango: ',cant);
     writeln('-----------------------');
     preguntar_pos_a_buscar(pos);//no hacer falta inicializarlo
     recorrer_ABO(a,cantPos,pos);
     writeln('la cantidad de ',pos,'s es de: ',cantPos);

     readln;
end.
