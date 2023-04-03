Program act_colavorativa;
uses crt;
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
      datos:reginfo;
      hi:arbol;
      hd:arbol;
    end;
        listaNivel = ^nodoN;
    nodoN = record
      info: arbol;
      sig: listaNivel;
    end;

procedure cargarventa (var v:regventa);
begin
    with v do begin
        writeln('codigo del producto (inserte "-1" para finalizar): ');
        readln(cod);
        if (cod<>-1) then begin
        writeln('cantidad de kilgramos: ');
        readln(kilos);
        writeln('dia del mes: ');
        readln(dia);
        writeln('numero del cliente: ');
        readln(nro);
        writeln('-------------');
        readkey();
        end;
    end;
end;

procedure cargararbol (var a:arbol; v:regventa);
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
        cargararbol(a^.HD,v)
      else //mismo codigo
        a^.datos.kilos:=a^.datos.kilos+v.kilos;
   end;
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
                    writeln ('Nivel ', nivel, ': ');readkey();
                    for i:= 1 to cant do begin
                      write ('codigo: ',l^.info^.datos.cod,', kilos: ', l^.info^.datos.kilos:2:2,'  -  ');
                      if (l^.info^.hi <> nil) then agregarAtras (l,ult,l^.info^.hi);
                      if (l^.info^.hd <> nil) then agregarAtras (l,ult,l^.info^.hd);
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
    if(a^.datos.kilos<kilomin)then begin
        kilomin:=a^.datos.kilos;
        codmin:=a^.datos.cod
    end;
    if(a^.datos.kilos>10)then
        writeln('codigo de producto con mas de 10 kilos: ',a^.datos.cod);
    recorrerarbol (a^.HI,codmin,kilomin);
    recorrerarbol (a^.HD,codmin,kilomin);
  end;
end;




var
    codmin:integer;
    kilomin:real;
    a:arbol;
    venta:regventa;
begin
    a:=nil;
    codmin:=0;
    kilomin:=9999;
    cargarventa(venta);

    while (venta.cod<>-1) do begin
      cargararbol(a,venta);//si repito el codigo de venta tengo que sumar
      cargarventa(venta);
    end;

    writeln();readkey();
    writeln('-------------');readkey();
    writeln('arbol por nivel: ');readkey();
    imprimirpornivel(a);

    writeln('-------------');readkey();
    recorrerarbol(a,codmin,kilomin);
    writeln('el codigo del producto menos vendido es: ',codmin);readkey();
end.
