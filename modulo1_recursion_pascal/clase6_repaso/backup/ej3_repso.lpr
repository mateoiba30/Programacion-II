Program ej3_repso;
Uses
     sysutils;
const
  SUP=2000;
  INF=1000;
Type
     pedido= record
	      codSeg: integer;
	      fechaYhora: string;
	      dni: integer;
	      cod: integer;
          domicilio: string;
          tel: string;
     end;

     listaPedidos = ^nodoLista;
     nodoLista = record
               dato: pedido;
               sig: listaPedidos;
     end;

     lista_dni=^nodoL;
     nodoL=record
       dato:integer;//dni
       sig:lista_dni;
     end;

     regarbol=record
       cod:integer;
       total:integer;
       listita:lista_dni;
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

procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig := nil;
    if (pri = nil) then
         pri := nuevo
    else
    begin
         actual := pri;
         anterior := pri;
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
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

function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure cargamanual(var p:pedido);
begin
  writeln('codigo de seguridad: ');
  readln(p.codSeg);
  writeln('fecha y hora: ');
  readln(p.fechaYhora);
  writeln('dni: ');
  readln(p.dni);
  writeln('codigo de area: ');
  readln(p.cod);
  writeln('domicilio: ');
  readln(p.domicilio);
  writeln('telefono: ');
  readln(p.tel);
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10); {genera hasta 100 elementos}
     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(60000000);  {dni}
          p.cod := (random(4000)); {codigo de área}
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do
         writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', cod, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;
//cargar arbol de listas

procedure cargarlistita(var l: lista_dni; p:pedido);
var
  aux: lista_dni;
begin
  new(aux);
  aux^.dato := p.dni;
  aux^.sig := l;
  l:= aux;
end;

procedure insertar_en_ABO (var a:arbol; p:pedido);
//var
 //  nue:arbol;
begin
 if(a=nil)then begin   // no hace falta modularizar
   new(a);                //no hace falta usar nue, PERO HAY QUE HACER new(a)
   with a^.dato do begin
     cod:=p.cod;
     total:=1;
     listita:=nil;
     cargarlistita(listita,p);
     a^.HI:=nil;
     a^.HD:=nil;
   end;
   //a:=nue;
 end
 else begin
   if(a^.dato.cod>p.cod)then begin
     insertar_en_ABO(a^.HI,p);
   end
   else begin
      if(a^.dato.cod<p.cod)then
        insertar_en_ABO(a^.HD,p)
      else begin  //en el caso que el dni sea igual incrementamos la lista y el total
        a^.dato.total:=a^.dato.total+1;
        cargarlistita(a^.dato.listita,p);
      end;
   end;
 end;

end;

procedure cargar_ABO(var a:arbol; l:listaPedidos);

begin
  while(l<>nil)do begin
      insertar_en_ABO(a,l^.dato);
      l:=l^.sig;
  end;
end;


procedure buscar_min(a:arbol; var codmin:integer;var min:integer);
begin
 //min:=9999;  no nos sirve

  if ( a <> nil ) then begin
    buscar_min (a^.HD,codmin,min);  //si acá podría HI y luego HD en la línea 197 me imprime la lista de Mayor  a Menor

    if (a^.dato.total<min)then begin
      min:=a^.dato.total;
      codmin:=a^.dato.cod;
    end;

    buscar_min (a^.HI,codmin,min);
  end;
end;
//para imprimir por nivel

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
                      write (l^.info^.dato.cod, ' - ');
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

procedure informar_listita(l:lista_dni);
begin
  while(l<>nil)do begin
    write(l^.dato,' - ');
    l:=l^.sig;
  end;
end;

procedure recorrer_e_imprimir_dnis (a:arbol);//con la funcion no voy a ir podiendo acumular un valor
begin
  if (a <> nil) then
    if (a^.dato.cod >= INF) then   //como hay iguales, incluye los límites. pero si el límite es ej:2 va a imprimirlo pero tmb va a analizar a su hijo por izquierda innecesariamente
      if (a^.dato.cod<= SUP) then begin
                                         //si pongo el write acá, me imprime pre orden
        recorrer_e_imprimir_dnis(a^.hi);
        write(a^.dato.cod,'-->');
        informar_listita(a^.dato.listita);
        writeln();
        recorrer_e_imprimir_dnis (a^.hd);
         //si pongo el write acá, me imprime post orden
      end
      else
        recorrer_e_imprimir_dnis(a^.hi)
    else
      recorrer_e_imprimir_dnis(a^.hd);
end;

procedure buscar_cod (a:arbol; cod:integer);//con la funcion no voy a ir podiendo acumular un valor
begin
  if (a <> nil) then
    if (a^.dato.cod > cod) then //como hay iguales, incluye los límites. pero si el límite es ej:2 va a imprimirlo pero tmb va a analizar a su hijo por izquierda innecesariamente
      buscar_cod(a^.hi,cod)
    else begin
      if (a^.dato.cod< cod) then
        buscar_cod(a^.hd,cod)//si pongo el write acá, me imprime pre orde
      else begin
        write(cod,'-->');
        informar_listita(a^.dato.listita);
        writeln();
         //si pongo el write acá, me imprime post orden
      end;
    end;
end;

var
   l_inicial: listaPedidos;
   min,codmin,cod:integer;
   a:arbol;
   p:pedido;

begin
     codmin:=0;
     a:=nil;
     min:=9999;
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;

     crearLista(l_inicial);
     writeln ('Lista--> ');
     imprimirLista(l_inicial);

     writeln('carga de un dato mas: ');
 //    cargamanual(p);
 //    agregarLista(l_inicial, p);
     writeln('-----------');
     writeln();

     cargar_ABO(a,l_inicial);
     writeln ('Arbol--> ');
     imprimirpornivel(a);
     writeln('-----------');
     writeln();

     buscar_min(a,codmin,min);
     writeln('El codigo con menor cantidad de pedidos es de: ',codmin);
     writeln('-----------');
     writeln();

     writeln('listas de dnis por cod de area: ');
     recorrer_e_imprimir_dnis(a);
     writeln('-----------');
     writeln();

     writeln('ingrese un codigo de area para buscar: ');
     readln(cod);
     buscar_cod(a,cod);
     writeln('-----------');
     writeln();
     readln;

end.
