Program borrar_elemn_ABO_v2;
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

function buscar_minimo(a:arbol):integer;
begin
  if(a=nil)then //si a=nil no hay ningun dato guardado, si a^.HI es nil no apunta a nada
    buscar_minimo:=-1
  else begin
    if(a^.HI<>nil)then
      buscar_minimo:=buscar_minimo(a^.HI)
    else
      buscar_minimo:=a^.dato;
  end;
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

function buscar (a:arbol;e:integer):arbol;
begin

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

procedure recorrer_acotado (a:arbol; inf,sup:integer);
begin
  if (a <> nil) then
    if (a^.dato >= inf) then   //como hay iguales, incluye los límites. pero si el límite es ej:2 va a imprimirlo pero tmb va a analizar a su hijo por izquierda innecesariamente
      if (a^.dato<= sup) then begin
                                         //si pongo el write acá, me imprime pre orden
        recorrer_acotado(a^.hi, inf, sup);
        write(a^.dato,' ');       //si pongo el write acá, me imprime en orden
        recorrer_acotado (a^.hd, inf, sup);
         //si pongo el write acá, me imprime post orden
      end
      else
        recorrer_acotado(a^.hi, inf, sup)
    else
      recorrer_acotado(a^.hd, inf, sup);
end;

procedure borrar_elemento (var a:arbol; dato:integer; var resultado:boolean);//no se puede usar funcion porque necesitamos pasar el arbol y resultado por referencia
var    //podemos recorrer con a porque en realidad no se pierde el valor de a (recorremos gracias ala recursion en realidad)
   aux:arbol;
begin
  if(a=nil)then
      resultado:=False  //si está vacío no encontré
    else begin
      if(a^.dato>dato)then begin
        resultado:=True;
        borrar_elemento (a^.hi, dato, resultado);  //repito en subarbol izquierdo
      end
      else
        if(a^.dato<dato)then
          borrar_elemento (a^.hd, dato, resultado)  //repito en sub arbol derecho
        else begin
          resultado:=True;  //encontre

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
              else begin//tiene 2 hijos, quiero llegar al dato hoja buscar el mínimo del hijo derecho
                  a^.dato:=buscar_minimo(a^.hd);//los punteros los dejamos intactos en este caso, ahora me quedo repetido el dato por haberlo copiado, encontes lo quiero borrar
                  borrar_elemento (a^.hd,a^.dato,resultado);  //es la forma de hacer el dispose reutilizando codigo. el dato copiado está en el subarbol derecho porque busqué el menor en el subarbol derecho (tmb puedo buscar el mayor del subarbol izq, pero no es lo que hacemos en esta materia
                                       //no sirve si el dato que ingreso es "dato" en vez de =a^.dato" porque dato es lo inicial que quería borrar, mientras que a^.dato es el dato que superpuse y que ahora se encuentra repetido
               end;
              end;
            end;
          end;

end;
  {
procedure eliminar(a: arbol);
begin
  if a <> nil then
  begin
    eliminar(a^.hi);
    eliminar(a^.hd);
    dispose(a);

  end;     NO FUNCIONA POR VARIOS MOTIVOS, UNO ES PORQUE NO USAMOS VARIABLES AUXILIARES O "a" NO ESTÁ PASADO POR REFERENCIA

end;   }

//el dispose es el caso base

Var
 resultado:boolean;
  a:arbol;
 l: lista;
 dato:integer;
  //arbol ya es un puntero a un nodo

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 recorrer_e_insertar_lista(l,a);
 writeln('arbol: ');
 readkey();
 imprimirpornivel(a);

 writeln('---------------------- ');
 readkey();
 writeln('ingrese dato a borrar: ');
 readln(dato);

 borrar_elemento(a,dato,resultado);
 if(resultado)then begin
   writeln('dato borrado, nuevo arbol: ');
   readkey();
   imprimirpornivel(a);
 end
 else begin
    writeln('dato no encontrado');
    readkey();
 end;

{ writeln('--------');
 eliminar(a);
 imprimirpornivel(a);   no se puede borrar con ese modulo}

 readln;
end.

