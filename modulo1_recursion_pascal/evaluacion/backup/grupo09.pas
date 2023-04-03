Program grupo09;
Uses
     sysutils;
const
  ANIO=2022;
  SUP=32000000;
  INF=28000000;
  DNI_Borrar=34807474;
Type
     str70= string[70];

     jugador = record
        DNI: longint;
	nombre_apellido: str70;
        equipo: str70;
	goles: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
       dato: jugador;
       sig: lista;
     end;

	fecha=record
	  dia:1..31;
	  mes:1..12;
	  anio:integer;
	end;

    partido= record
		identificador: longint;
		local: str70;
		visitante: str70;
		fecha_partido: fecha;
                estadio: str70;
		goleadores: lista;
     end;

     listaPartidos = ^nodoPartidos;

     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end;

     nombres= array [1..20] of str70;

     infoL=record
       fecha_goles:fecha;
       goles:integer;
     end;

     listita=^nodoL;
     nodoL=record
       dato:infoL;
       sig:listita;
     end;

     infoA=record
       dni:longint;
       nomyap:str70;
       equipo:str70;
       listita_goles:listita;
     end;

     arbol=^nodoA;
     nodoA=record
       dato:infoA;
       hd:arbol;
       hi:arbol;
     end;

     listaNivel = ^nodoN;
     nodoN = record
       info: arbol;
       sig: listaNivel;
     end;

//carga de dTOS ALEATORIOS

procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(12)+1;
  if(f.mes = 2) and (f.dia > 28)then
	f.dia := 28
  else
	if((f.mes = 4) or (f.mes = 6) or (f.mes =9) or (f.mes = 11)) and (f.dia = 31)then
		f.dia := 30;
  f.anio:=ANIO;
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

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Atletico Tucuman';
     v[2]:='Huracan';
     v[3]:='Gimnasia LP';
     v[4]:='Godoy Cruz';
     v[5]:='Argentino Juniors';
     v[6]:='River';
     v[7]:='Boca';
     v[8]:='Racing';
     v[9]:='Platense';
     v[10]:='San Lorenzo';
     v[11]:='Patronato';
     v[12]:='Estudiantes';
     v[13]:='Union';
     v[14]:='Newells';
     v[15]:='Barracas';
     v[16]:='Tigre';
     v[17]:='Arsenal';
     v[18]:='Sarmiento';
     v[19]:='Central';
     v[20]:='Colon';
end;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(2);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Colon')or(visitante='Colon'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   equipo:='Colon';
		   goles:=random(3)+1;
        end;
        agregarJugador(l, j);
     end;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            equipo:=local
          else
            equipo:=visitante;
	      goles:=random(3)+1;
       end;
       agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(20)+1;
     v[1]:= 'Antonio Vespucio Liberti';
     v[2]:= 'Mario Alberto Kempes';
     v[3]:= 'Alberto Armando';
     v[4]:= 'Ciudad de La Plata';
     v[5]:= 'Presidente Peron';
     v[6]:= 'Jose Amalfitani';
     v[7]:= 'Tomas Adolfo Duco';
     v[8]:= 'Libertadores de America';
     v[9]:= 'Pedro Bidegain';
     v[10]:= 'Nestor Diaz Perez';
     v[11]:= 'Marcelo Bielsa';
     v[12]:= 'Gigante de Arroyito';
     v[13]:= 'Malvinas Argentinas';
     v[14]:= 'Brigadier General Estanislao Lopez';
     v[15]:= 'Eduardo Gallardon';
     v[16]:= 'Jose Maria Minella';
     v[17]:= 'Florencio Sola';
     v[18]:= 'Monumental Jose Fierro';
     v[19]:= 'Nueva España';
     v[20]:= 'Nuevo Francisco Urbano';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               identificador:= random (100000)+1;
               pos:= random(20)+1;
               estadio:= v[pos];
               loc:= random(20)+1;
               local:=v2[loc];
               vis:= random(20)+1;
               visitante:=v2[vis];
               while(local=visitante)do
               begin
                   vis:= random(20)+1;
                   visitante:=v2[vis];
               end;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, local, visitante);
          end;
          agregar(l, p);
       end;
end;

//---------------------------------
// impresion de datos
procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ', equipo, ' | GOLES: ', goles);
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
          writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local, ' | EQ. VISITANTE: ', visitante, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;
//---------------------------------
//carga de datos
procedure cargarlistita_goles(var l: listita; f:fecha; g:integer); //carga de listita en caso de repetido o inicial
var
  aux: listita;
begin
  new(aux);
  aux^.dato.fecha_goles := f;
  aux^.dato.goles := g;
  aux^.sig := l;
  l:= aux;
end;

procedure insertar_jugadores (var a:arbol; f:fecha; j:jugador); //con la info de la lista de listas vamos cargando el arbol
begin
 if(a=nil)then begin
   new(a);

   a^.dato.dni:=j.dni;
   a^.dato.nomyap:=j.nombre_apellido;
   a^.dato.equipo:=j.equipo;
   a^.dato.listita_goles:=nil;
   cargarlistita_goles(a^.dato.listita_goles,f,j.goles);

   a^.HI:=nil;
   a^.HD:=nil;
 end
 else begin
   if(a^.dato.dni>j.DNI)then begin
     insertar_jugadores(a^.HI,f,j);
   end
   else begin
      if(a^.dato.dni<j.DNI)then
        insertar_jugadores(a^.HD,f,j)
      else begin
        cargarlistita_goles(a^.dato.listita_goles,f,j.goles);
      end;
   end;
 end;

end;

procedure recorrer_goleadores (var a:arbol; l:lista; f:fecha); //recorremos sublista y llamamos al cargar arbol
begin
 while(l<>nil)do begin
    insertar_jugadores(a,f,l^.dato);
    l:=l^.sig;
 end;
end;

procedure recorrer_ListaPartidos(l:listaPartidos; var a:arbol); //recorrermos lista principal y llamamos al recorrer sublista
begin
 while(l<>nil)do begin
    recorrer_goleadores(a,l^.dato.goleadores,l^.dato.fecha_partido);
    l:=l^.sig;
 end;
end;
//------------------
//busqueda de equipo con el mayor goleador del torneo
function recorrer_listita_goles(l:listita):integer;
var
   cant:integer;
begin
 cant:=0;
 while(l<>nil)do begin
    cant:=cant+l^.dato.goles;
    l:=l^.sig;
 end;

 recorrer_listita_goles:=cant;
end;

Procedure equipo_max( a: arbol; var max:integer; var equipomax:str70);
var
   cant:integer;
begin
  if ( a <> nil ) then begin
    equipo_max (a^.HD,max,equipomax);

    cant:=recorrer_listita_goles(a^.dato.listita_goles);
    if(cant>max)then begin
      max:=cant;
      equipomax:=a^.dato.equipo;
    end;

    equipo_max (a^.HI,max,equipomax);
  end;
end;
//informar jugadores dentro del rango

procedure recorrer_acotado (a:arbol);
begin
  if (a <> nil) then
    if (a^.dato.dni >= INF) then
      if (a^.dato.dni <= SUP) then begin

        recorrer_acotado(a^.hd);
        writeln('DNI: ',a^.dato.dni,'- Nombre y Apellido: ',a^.dato.nomyap);
        recorrer_acotado (a^.hi);

      end
      else
        recorrer_acotado(a^.hi)
    else
      recorrer_acotado(a^.hd);
end;
//----------------------------------
//borrar jugador del arbol
function buscar_cercano(a:arbol):longint;
begin
  if(a=nil)then
    buscar_cercano:=-1
  else begin
    if(a^.HI<>nil)then
      buscar_cercano:=buscar_cercano(a^.HI)
    else
      buscar_cercano:=a^.dato.dni;
  end;
end;

procedure borrar_elemento (var a:arbol; dni:longint);
var
   aux:arbol;
begin
    if(a<>nil)then begin         //está mal discriminado el caso por hoja, anda bien pero podría discrimiar mejor
      if(a^.dato.dni>dni)then begin
        borrar_elemento (a^.hi, dni);  //repito en subarbol izquierdo
      end
      else
        if(a^.dato.dni<dni)then
          borrar_elemento (a^.hd, dni)  //repito en sub arbol derecho
        else begin //encontre

          //debería hacer un if no tiene hijos y no copiar nada de ningún hijo

          if(a^.hi=nil)then begin//si tiene hijo derecho nomás  (o no tiene ningun hijo ) le copio todos los datos del hijo al padre
            aux:=a;
            a:=a^.HD; //si este hijo tmb estaba vacío estoy haciendo que apunte a nil
            dispose(aux);
          end
          else begin
            if(a^.hd=nil)then begin//lo mismo pero con el hijo izquierdo
              aux:=a;
              a:=a^.Hi;
              dispose(aux);
            end
              else begin
                  a^.dato.dni:=buscar_cercano(a^.hd);
                  borrar_elemento (a^.hd,a^.dato.dni);
              end;
          end;
        end;
    end;
end;
//---------------------------
//imprimir arbol


  function ContarElementos (l: listaNivel): integer;

    var c: integer;
  begin
   c:= 0;
   While (l <> nil) do begin
     c:= c+1;
     l:= l^.sig;
   End;
   contarElementos := c;
  end;

  Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);

   var nue:listaNivel;

   begin
   new (nue);
   nue^.info := a;
   nue^.sig := nil;
   if l= nil then l:= nue
             else ult^.sig:= nue;
   ult:= nue;
   end;


Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato.dni, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
//--------------------------------------
var
   l: listaPartidos;
   a:arbol;
   max:integer;
   equipomax:str70;
  { x:longint; }
begin
     Randomize;
     l:= nil;
     crearLista(l);
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);
     writeln('-------------------------');
     writeln();
//---------
     a:=nil;
     max:=-1;
     equipomax:='ninguno, no hubieron goles';
     recorrer_ListaPartidos(l,a);

     equipo_max(a,max,equipomax);
     writeln('el equipo con el goleador del torneo es: ',equipomax);
     writeln('-------------------------');
     writeln();

     writeln('Los jugadores con dni entre ',INF,' y ',SUP,' son: ');
     recorrer_acotado(a);
     writeln('-------------------------');
     writeln();

     writeln('arbol de datos: ');
     imprimirpornivel(a);
     writeln();
    { writeln('Ingrese un dni a borrar: ');
     readln(x);}
     borrar_elemento(a,DNI_Borrar);
     writeln('arbol de datos con el elemento borrado: ');
     imprimirpornivel(a);
     writeln('-------------------------');
     writeln();

     //FALTÓ: VACIAR LA LISTITA DEL NODO A BORRAR E INFORMAR LOS DNIs DENTRO DEL RANGO DE MANERA ASCENDENTE ( NO DESCENDEBTE)
     readln;
end.
