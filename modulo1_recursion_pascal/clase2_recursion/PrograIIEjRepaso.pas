Program productos;
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
     
     
     listaM1 = ^nodoM1;
     
     nodoM1 = record
			marca: string;
			lista: listaProductos;
			sig: listaM1;
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


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;





procedure AgregarFinal(var L: listaProductos; d: producto);
var aux,nue: listaProductos;
begin
	new(nue);
	nue^.dato:= d;
	nue^.sig:=nil;

	if (l=nil) then l:=nue
	else begin
		aux:=l;
		while (aux^.sig<>nil)do begin
			aux:=aux^.sig;
		end;
	
		aux^.sig:=nue;
	end;
end;

procedure IniciarListita(var Lm: listaM1; marAct:string;var NodoAct:listaM1);
var aux,nue: listaM1;
begin
	{nue es nodo gde}
	new(nue);
	nue^.marca:= maract;
	nue^.lista:=nil;
	nue^.sig:=nil;
	
	NodoAct:=nue;

	if (lm=nil) then lm:=nue
	else begin
		aux:=lm;
		while (aux^.sig<>nil)do begin
			aux:=aux^.sig;
		end;
	
		aux^.sig:=nue;
	end;
end;


procedure GenerarEstructura(l:listaProductos; var Lm: listaM1);
var marAct:string;
	NodoAct:listaM1;
	ListitaAux:listaProductos;
Begin
	Lm:=nil;
	while (l<>nil) do begin
		marAct:=l^.dato.marca;			{maract = Aluminium}
		IniciarListita(lm,marAct,NodoAct);
		ListitaAux:=nil;
		while ((l<>nil)and(maract=l^.dato.marca))do begin
			AgregarFinal(listitaAux,l^.dato);
			l:=l^.sig;
		end;
		NodoAct^.lista:=ListitaAux;
	end;
end;



procedure PuntoB(lm:listaM1);
{b.	Informar la cantidad de productos, de la marca “Abercom”, fabricados 
entre los años 2018 y 2020 inclusive y cuyo precio supero los 100000$.}
var cant:integer;
	listitaAux:listaProductos;
Begin
	cant:=0;
	while ((lm<>nil)and(lm^.marca<>'Abercom')) do
		lm:=lm^.sig;
	if (lm<>nil) then begin
		listitaAux:=lm^.lista;
		
		while((listitaAux<>nil)and(listitaAux^.dato.anio<=2020))do begin
			if ((listitaaux^.dato.anio>=2018)and(listitaaux^.dato.precio>100000))then
				cant:=cant+1;
			ListitaAux:=listitaAux^.sig;
		end;
	end;
	writeln('cant: ',cant);
End;


procedure PuntoC(lm:listaM1);
var listitaAux:listaProductos; cantA,cantM,AnioAct:integer;
begin
	while (lm<>nil) do begin
		writeln('Marca: ',lm^.marca);
		cantM:=0;
		listitaAux:=lm^.lista;
		while (listitaAux<>nil) do begin
			cantA:=0;
			AnioAct:=listitaAux^.dato.anio;
			writeln('  Anio: ',anioact);
			while ((ListitaAux<>nil)and(AnioAct=listitaAux^.dato.anio)) do begin
				with listitaaux^.dato do
					writeln('		',codigo,' ',nombre,' ',precio:2:2,'$');
				cantM:=cantM+1; cantA:=cantA+1;
				listitaAux:=listitaAux^.sig;
			end;
			writeln('	  Total productos anio: ',cantA);
		end;
		writeln('Total productos ',lm^.marca,': ',cantM);
		writeln('-----------------------------------');
		lm:=lm^.sig; 
	end;
end;


var
   l: listaProductos;
   lm: listaM1;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     readln;
     
     GenerarEstructura(l,lm);
     
     writeln('');
     writeln('--------------------------------');
     writeln('');
     
     PuntoB(lm);
     
     readln;
     
     writeln('');
     writeln('--------------------------------');
     writeln('');
     
     PuntoC(lm);
end.






