Program ej2_repaso;
Uses
     sysutils;
Type
     str10= string[10];

     regviaje=record
       cod:str10;
       millas:real;
       dni:longint;
       nomyap:string;
       clase:boolean; //true significa clase alta=ejecutiva
     end;

     lista=^nodo;
     nodo=record
       dato:regviaje;
       sig:lista;
     end;

     reglistita=record
       cod:str10;
       puntaje:real;
     end;

     lista_cod=^nodo_cod;
     nodo_cod=record
       dato:reglistita;
       sig:lista_cod;
     end;

     regarbol=record
       dni:longint;
       nomyap:string;
       listita:lista_cod;
     end;

     arbol=^nodoA;
     nodoA=record
       dato:regarbol;
       hi:arbol;
       hd:arbol;
     end;

     listaNivel = ^nodoN;
     nodoN = record
       info: arbol;
       sig: listaNivel;
     end;

//carga lista aleatoria
procedure InsertarOrdenado(var l: Lista; viaje: regviaje);

var
  aux,ant,act: lista;
begin
  new(aux);
  aux^.dato := viaje;
  ant:=l;
  act:=l;

  while(act<>nil)and(act^.dato.cod<viaje.cod)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    l:=aux
  else
    ant^.sig:=aux;

  aux^.sig := act;
end;

procedure cargarViaje(var v:regviaje);
var
  x:integer;
begin
  with v do begin
    clase:=False;
    writeln('codigo (inserte "0" para finalizar): ');
    readln(cod);
    if(cod<>'0')then begin
      writeln('millas: ');
      readln(millas);
      writeln('dni :');
      readln(dni);
      writeln('nombre y apellido: ');
      readln(nomyap);
      writeln('inserte "1" para clase ejecutiva y otro NUMERO para clase turista: ');
      readln(x);
      if(x=1)then
        clase:=True;
    end;
  end;
end;

procedure CargarLista(var l: Lista);
var
  v:regviaje;
begin
  cargarViaje(v);
  while(v.cod<>'0')do begin
    writeln();
    InsertarOrdenado(l,v);
    cargarViaje(v);
  end;
end;

procedure imprimirLista(l: Lista);
var
  x:str10;
begin
  While (l <> nil) do begin
    x:='turista';
    if(l^.dato.clase)then
    x:='ejecutiva';
    with l^.dato do begin
       writeln('Codigo: ', cod, '-  millas: ', millas:2:2,'- dni: ',dni,'- nombre: ',nomyap,'- clase: ', x);
       l:= l^.sig;
     End;
  end;
end;

//cargar ABO de listas
procedure cargarlistita(var l: lista_cod; v:regviaje);
var
  aux: lista_cod;
begin
  new(aux);
  aux^.dato.cod := v.cod;
  if(v.clase)then
    aux^.dato.puntaje := v.millas*100
  else
    aux^.dato.puntaje := v.millas*25;

  aux^.sig := l;
  l:= aux;
end;

procedure insertar_en_ABO (var a:arbol; v:regviaje);
//var
 //  nue:arbol;
begin
 if(a=nil)then begin   // no hace falta modularizar
   new(a);                //no hace falta usar nue, PERO HAY QUE HACER new(a)
   with a^.dato do begin
     dni:=v.dni;
     nomyap:=v.nomyap;
     listita:=nil;
     cargarlistita(listita,v);
     a^.HI:=nil;
     a^.HD:=nil;
   end;
   //a:=nue;
 end
 else begin
   if(a^.dato.dni>v.dni)then begin
     insertar_en_ABO(a^.HI,v);
   end
   else begin
      if(a^.dato.dni<v.dni)then
        insertar_en_ABO(a^.HD,v)
      else begin  //en el caso que el dni sea igual incrementamos la lista
        cargarlistita(a^.dato.listita,v);
      end;
   end;
 end;

end;

procedure cargar_ABO(var a:arbol; l:lista);

begin
  while(l<>nil)do begin
      insertar_en_ABO(a,l^.dato);
      l:=l^.sig;
  end;
end;
      {
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

function comparacion(max:real; puntaje:real):real;   //hace falta???
begin
 if(max<puntaje)then
   max:=puntaje;
 comparacion:=max;
end; }

function buscar_vuelo(l:lista_cod):real;
var
  max:real;
begin
 max:=-1; //no olvidar
 while(l<>nil)do begin
   if(max<l^.dato.puntaje)then  //seria mejor usar la funcion de arriba?
     max:=l^.dato.puntaje;
   l:=l^.sig;
 end;
 buscar_vuelo:=max;
end;

procedure recorrer_acotado (a:arbol; SUP,INF:longint);//con la funcion no voy a ir podiendo acumular un valor
begin
  if (a <> nil) then
    if (a^.dato.dni >= INF) then   //como hay iguales, incluye los límites. pero si el límite es ej:2 va a imprimirlo pero tmb va a analizar a su hijo por izquierda innecesariamente
      if (a^.dato.dni<= SUP) then begin
                                         //si pongo el write acá, me imprime pre orden
        recorrer_acotado(a^.hi,SUP,INF);
        writeln('max puntaje de ',a^.dato.dni,': ',buscar_vuelo(a^.dato.listita):2:2);
        recorrer_acotado (a^.hd,SUP,INF);
         //si pongo el write acá, me imprime post orden
      end
      else
        recorrer_acotado(a^.hi,SUP,INF)
    else
      recorrer_acotado(a^.hd,SUP,INF);
end;

function puntaje_cliente(l:lista_cod):real;
var
  cont:real;
begin
 cont:=0; //no olvidar
 while(l<>nil)do begin
   cont:=cont+l^.dato.puntaje;
   l:=l^.sig;
 end;
 puntaje_cliente:=cont;
end;

procedure buscar_max(a:arbol; var max:real);
var
  x:real;
begin
  if ( a <> nil ) then begin
    buscar_max (a^.HD,max);  //si acá podría HI y luego HD en la línea 197 me imprime la lista de Mayor  a Menor

    x:=puntaje_cliente(a^.dato.listita);
    if (x>max)then
      max:=x;

    buscar_max (a^.HI,max);
  end;
end;

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

var
   a:arbol;
   l: lista;
   max:real;
   SUP,INF:longint;
begin
     SUP:=50000000;
     INF:=40000000;
     max:=-1;
     a:=nil;
     l:= nil;

     cargarLista(l);
     writeln('lista de datos-->');
     imprimirLista(l);
     writeln('-------------------');
     writeln();

     cargar_ABO(a,l);
     writeln('arbol de listas-->');
     imprimirpornivel(a);
     writeln('-------------------');
     writeln();

     buscar_max(a,max);
     writeln('El pasajero con mas puntos hizo: ', max:2:2);
     writeln('-------------------');
     writeln();

     recorrer_acotado(a,SUP,INF);

     readln;
end.
