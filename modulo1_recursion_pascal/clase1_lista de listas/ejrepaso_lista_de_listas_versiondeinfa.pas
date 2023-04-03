Program ejrepaso_lista_de_listas_versiondeinfa;
Uses
     sysutils;
Type



     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;

Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;

   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
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


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;

procedure imprimir2(p: producto; var contador:integer;var contadorT:integer);
begin
	writeln(p.codigo,' ',p.nombre,' ',p.precio:2:2,'$');
	          contador:=contador+1;
          contadorT:=contadorT+1;

     end;


procedure agregarOrdenado(var pri:listaProductos; t:producto);
var
   nuevo, anterior, actual: listaProductos;
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
          while (actual<>nil) and (actual^.dato.anio < nuevo^.dato .anio) do begin
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


procedure OrdLista(var LOrd:listaProductos;l:listaProductos);
begin
LOrd:=nil;
	while (l<>nil) do begin
		agregarOrdenado(LOrd, l^.dato);
		l:=l^.sig;
	end;
end;







{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimirReporte(LOrd:listaProductos);
	var
	contador:integer;
	contadorT:integer;
	anioActual:integer;
	begin
				contadorT:=0;
		while(LOrd<>nil) do begin
			while(LOrd^.dato.marca='Abercom') do begin
				anioActual:=LOrd^.dato.anio;
				contador:=0;;
				while(LOrd^.dato.anio=anioActual) do begin
					if (LOrd^.dato.precio>100000) then
					imprimir2(LOrd^.dato,contador,contadorT);
					LOrd:=LOrd^.sig;
				end;
				writeln ('Total productos ',anioActual,' ',contador);
		end;
		LOrd:=LOrd^.sig;
	end;
			writeln('Cantidad productos vendidos por Abercom: ',contadorT);
end;

var
   l,LOrd: listaProductos;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     readln;
     OrdLista(LOrd,l);
     writeln ('Nueva Lista: ');
     imprimirLista(LOrd);
     writeln('///////////////////////////////');

     imprimirReporte(LOrd);
     readln;
end.
