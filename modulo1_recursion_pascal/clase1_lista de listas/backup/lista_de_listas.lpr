Program ejrepaso_lista_de_listas;
Uses
     sysutils, crt;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
	      precio: real;
     end;

     listasimple = ^nodosimple;
     nodosimple = record
               dato: producto;
               sig: listasimple;
     end;

     regpunteros=record
       marca:string;
       puntero:listasimple;
     end;

     listacompleja=^nodocomplejo;
     nodocomplejo=record
       datos:regpunteros;
       sig:listacompleja;
     end;


Procedure agregarAdelante(var l: listasimple; p: producto);

var
   aux: listasimple;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarAdelanteComplejo(var lc: listacompleja; ls:listasimple);

var
  aux: listacompleja;
begin
    new(aux);
    aux^.datos.puntero := ls;
    aux^.datos.marca:=ls^.dato.marca;
    aux^.sig := lc;
    lc:= aux;

end;

procedure crearLista(var l: listasimple);
var
   i,j:integer;
   p: producto;

   v : array [1..5] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';

	 for i:=random(5) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;

procedure imprimir(p: producto);

begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;

procedure imprimirLista(l: listasimple);

begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure cargarlistacompleja(ls:listasimple; var lc:listacompleja);
var
  marcaact:string;
begin
  while(ls<>nil)do begin
     agregarAdelanteComplejo(lc,ls);
     marcaact:=ls^.dato.marca;
     lc^.datos.puntero:=nil;   {}

     while(ls<>nil)and(marcaact=ls^.dato.marca)do begin
       agregarAdelante(lc^.datos.puntero, ls^.dato);
       ls:=ls^.sig;
     end;
  end;
end;

function contarcondicion(lc:listacompleja):integer;

var cont:integer;
begin
  cont:=0;
  while(lc<>nil)and(lc^.datos.marca<'Abercom')do
    lc:=lc^.sig;
  if(lc<>nil)and(lc^.datos.marca='Abercom')then begin
    while(lc^.datos.puntero<>nil)and(lc^.datos.puntero^.dato.anio>2018) do begin
      if (lc^.datos.puntero^.dato.anio>2017)and(lc^.datos.puntero^.dato.anio<2021)and(lc^.datos.puntero^.dato.precio>100000)then
        cont:=cont+1;{}
      lc^.datos.puntero:=lc^.datos.puntero^.sig;
    end;
  end;
  contarcondicion:=cont;
end;

procedure imprimirproducto(info:producto);
begin
  writeln(info.codigo,' ',info.nombre,' ',info.precio:2:2);readkey();
end;

procedure informarMarca(lc:listacompleja);
var
  TOT,cont:integer; info:producto; anioact:2000..2022;
begin
  cont:=0;
  TOT:=0;
  info:=lc^.datos.puntero^.dato;
  writeln('Marca: ',info.marca);readkey();
  writeln('----');readkey();

  while(lc^.datos.puntero<>nil)do begin

    anioact:=info.anio;
    writeln('Anio:', info.anio);readkey();
    writeln();readkey();

    while(lc^.datos.puntero<>nil)and(anioact=info.anio)do begin
      imprimirproducto(info);
      cont:=cont+1;
      info:=lc^.datos.puntero^.dato;
      lc^.datos.puntero:=lc^.datos.puntero^.sig;
    end;

    TOT:=TOT+cont;
    writeln();readkey();
    writeln('Total productos anio ',anioact,':',cont);
    writeln('----');readkey();
  end;

  writeln('Total de productos de la marca: ',TOT);readkey();

end;

procedure reportes(lc:listacompleja);

begin
  while(lc<>nil)do begin
    writeln('------------------------------');readkey();
    writeln();readkey();
    informarMarca(lc);
    lc:=lc^.sig;
  end;
end;

var
  ls: listasimple;
  lc:listacompleja;
begin
     Randomize;
     ls:= nil;
     crearLista(ls);
     writeln ('Lista generada: ');
     readkey();
     imprimirLista(ls);
     lc:=nil;
     cargarlistacompleja(ls,lc);
     writeln('La cantidad de veces que se cumple la condicion es de: ', contarcondicion(lc));
     readkey();
     reportes(lc);
end.
