Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

  lista_cod=^nodo_cod;
  nodo_cod=record
    dato:integer;
    sig:lista_cod;
  end;

  info=record
    peso:integer;
    puntero:lista_cod;
  end;

  arbol=^nodoA;
  nodoA=record
    dato:info;
    hi:arbol;
    hd:arbol;
  end;


//---------
//para la lista aleatoria
procedure agregarAdelante(var l: Lista; enc: encomienda);

var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;

procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;

procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

//---------
//carga de la lista al arbol de listas
procedure cargarlista_cod(var l: lista_cod; cod: integer);
var
  aux: lista_cod;
begin
  new(aux);
  aux^.dato := cod;
  aux^.sig := l;
  l:= aux;
end;

procedure insertar_encomienda (var a:arbol; e:encomienda);
var
   nue:arbol;
begin
 if(a=nil)then begin   //no poner: (a^.HI=nil)and(a^.HD=nil)
   new(nue);
   nue^.dato.peso:=e.peso;
   cargarlista_cod(nue^.dato.puntero,e.codigo); //usamos el carga adelante, aunque es solo cargar al inicio //nue^.dato.puntero es una lista_cod
   nue^.HI:=nil;
   nue^.HD:=nil;
   a:=nue;
 end
 else begin
   if(a^.dato.peso>e.peso)then begin
     insertar_encomienda(a^.HI,e);
   end
   else begin
      if(a^.dato.peso<e.peso)then
        insertar_encomienda(a^.HD,e)
      else begin  //en el caso que el peso sea igual incrementamos la lista
        cargarlista_cod(a^.dato.puntero,e.codigo);
      end;
   end;
 end;

end;

procedure recorrer_e_insertar_lista(l:lista; var a:arbol);
begin
 while(l<>nil)do begin
    insertar_encomienda(a,l^.dato);
    l:=l^.sig;
 end;
end;

//----------
//mostrar el arbol de listas
procedure imprimirlista_cod(l:lista_cod);
begin
  while (l <> nil) do begin
   write(l^.dato, '  ');
   l:= l^.sig;
 end;
end;

procedure imrpimir_arbol_de_listas(a:arbol);   //si el recorrido en orden quedó impreso ordenado significa que está bien cargado el árbol
begin
  if ( a <> nil ) then begin
    imrpimir_arbol_de_listas (a^.HD);

    write (a^.dato.peso, '-->   ');
    imprimirlista_cod(a^.dato.puntero);
    writeln();

    imrpimir_arbol_de_listas (a^.HI);
  end;
end;

Var
 a:arbol;
 l: lista;

begin
 Randomize;
 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 writeln();
 imprimirLista(l);
 writeln('------------------------');

 a:=nil;
 recorrer_e_insertar_lista(l,a);
 writeln('Peso |  Lista de codigos ');
 imrpimir_arbol_de_listas(a);

 readln;
end.

