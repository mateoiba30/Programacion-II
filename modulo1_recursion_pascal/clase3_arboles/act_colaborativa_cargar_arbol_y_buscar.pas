Program act_colavorativa;
{
el ABO no hay repetidos

}
Type
    Tdia=1..31;
    regventa=record
      cod:integer;
      kilos:real;
      dia:Tdia;
      nro:integer;
    end;

    reginfo=record
      cod:integer;
      kilos:real;
    end;

    arbol=^nodo;
    nodo=record
      datos:info;
      hd:arbol;
      hd:arbol;
    end;

procedure cargarventa (var v:regventa);
begin
    with v do begin
        writeln('ingrese el codigo del producto: ');
        readln(cod);
        writeln('ingrese la cantidad de kilgramos: ');
        readln(kilos);
        writeln('ingrese el dia del mes: ');
        readln(dia);
        writlen('ingrese el numero del cliente: ');
        readln(nro);
    end;
end;

procedure cargararbol (var a:arbol; v:regventa); {cuando inserto un nuevo nodo en un ABO puedo pasar por referencia al puntero inicial y todos los punteros en la recursión porque en la recursión a medida que se
vuelve a llamar a la función se pasa el siguiente nodo     }
var
   nue:arbol;
begin

 if(a=nil)then begin   //no poner: (a^.HI=nil)and(a^.HD=nil)
   new(nue);
   nue^.datos.cod:=v.cod;
   nue^.datos.kilos:=v.kilos;  
   nue^.HI:=nil;
   nue^.HD:=nil;
   a:=nue;
 end
 else begin
   if(a^.datos.cod>v.cod)then begin
     cargararbol(a^.HI,v);
   end
   else begin
      if(a^.datos.cod<v.cod)then
        cargararbol(a^.HD,v);
   end;
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

procedure recorrerarbol (a:arbol; var codmin:integer; var kilomin:real);
begin
  if ( a <> nil ) then begin
    if(a^.datos.kilos<kilmin)then begin
        kilmin:=a^.datos.kilos;
        codmin:=a^.datos.cod;
    end;
    if(a^.datos.kilos<10)then
        writeln(a^.datos.cod);
    preOrden (a^.HI);
    preOrden (a^.HD);
  end;
end;




var
    codmin:integer;
    kilomin:real;
    a.arbol;
    venta:regventa;
begin
    a:=nil;
    codmin:=0;
    kilomin:=9999;

    cargarventa(venta);
    cargararbol(a,venta);//si repito el codigo de venta tengo que sumar
    imprimirpornivel(a);
    recorrerarbol(a);
end.
