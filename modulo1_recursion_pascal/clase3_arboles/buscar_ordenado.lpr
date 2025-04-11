Program buscar_ordenado;
uses crt;
Type
  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;
  {-----------------------------------------------------------------------------
  CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

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

  {-----------------------------------------------------------------------------
  AGREGARATRAS - Agrega un elemento atrás en l}

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

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;


procedure agregarOrdenado(var pri:lista; t:integer);
var
   nuevo, anterior, actual: lista;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato < nuevo^.dato) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nuevo
          else
               anterior^.sig := nuevo;
          nuevo^.sig := actual;
     end;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista ordenada con números aleatorios }
procedure crearLista(var l: Lista);

var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

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
                      write (l^.info^.dato, ' - ');
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

procedure insertar_entero (var a:arbol; e:integer);
var
   nue:arbol;
begin
 if(a=nil)then begin   //no poner: (a^.HI=nil)and(a^.HD=nil)
   new(nue);
   nue^.dato:=e;
   nue^.HI:=nil;
   nue^.HD:=nil;
   a:=nue;
 end
 else begin
   if(a^.dato>e)then begin
     insertar_entero(a^.HI,e);
   end
   else begin
      if(a^.dato<e)then
        insertar_entero(a^.HD,e);
   end;
 end;

end;

procedure recorrer_e_insertar_lista(l:lista; var a:arbol);
begin
 while(l<>nil)do begin
    insertar_entero(a,l^.dato);
    l:=l^.sig;
 end;
end;

 {
Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    write (a^.dato, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD);
  end;
end;
}
Procedure enOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    write (a^.dato, '   ');
    enOrden (a^.HD);
  end;
end;
     {
Procedure postOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    postOrden (a^.HI);
    postOrden (a^.HD);
    write (a^.dato, '   ');
  end;
end;    }

function buscar (a:arbol;e:integer):arbol;
begin
 {if(a^.dato>e)then begin
   p:=buscar(a^.HI,e);
 end
 else begin
   if(a^.dato<e)then
     p:=buscar(a^.HD,e);
   else
     p:=a^.dato;
   end;
end;  }
 if(a<>nil)then begin
   if(a^.dato=e)then begin
       buscar:=a;
    end
    else begin
      if(a^.dato<e)then
        buscar:=buscar(a^.HD,e)
      else
        buscar:=buscar(a^.HI,e);
    end;
  end
  else
    buscar:=nil;

end;

Var
  a:arbol;
 l: lista;
 e:integer;
 punt:arbol;  //arbol ya es un puntero a un nodo

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 recorrer_e_insertar_lista(l,a);
 writeln('arbol: ');
 readkey();
 enOrden(a);
  {writeln('ingrese un dato a insertar (inserte "0" para finalizar): ');
 readln(e);
 while(e<>0)do begin
   insertar_entero(a,e);
   writeln('ingrese otro dato a insertar (inserte "0" para finalizar): ');
   readln(e);
 end;

     writeln('preOrden');readkey();
  preOrden(a);
  writeln('enOrden');readkey();
  enOrden(a);
  writeln('postOrden');readkey();
  postOrden(a);

  writeln('ingrese un entero del nodo a buscar: ');
  readln(e);
  punt:=buscar(a,e);

  if(punt<>nil)then begin
    writeln(punt^.dato);
    readkey();
  end
  else begin
     writeln('no se encontro');
     readkey();
  end;
   }
 readln;
end.

