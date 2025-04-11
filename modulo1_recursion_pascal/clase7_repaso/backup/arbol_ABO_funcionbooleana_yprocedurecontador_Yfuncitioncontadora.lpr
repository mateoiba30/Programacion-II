Program arbol_ABO;
Type
     libro=record
       titulo:string;
       ISBN:longint;
       clase:string;
     end;

     arbol=^nodoA;
     nodoA=record
       dato:libro;
       hi:arbol;
       hd:arbol;
     end;

procedure cargarLibro (var l:libro);
begin
  with l do begin
    writeln('ISBN (ingrese "0" para finalizar): ');
    readln(ISBN);
    if(ISBN<>0)then begin
      writeln('titulo: ');
      readln(titulo);
      writeln('clase bibliografica: ');
      readln(clase);
    end;
  end;
end;

procedure insertar_en_ABO (var a:arbol; l:libro);
begin
 if(a=nil)then begin
   new(a);
   with a^.dato do begin
     a^.dato:=l;
     a^.HI:=nil;
     a^.HD:=nil;
   end;
 end
 else
   if(a^.dato.ISBN>l.ISBN)then begin
     insertar_en_ABO(a^.HI,l);
   end
   else
      if(a^.dato.ISBN<l.ISBN)then
        insertar_en_ABO(a^.HD,l)
 end;


procedure cargar_ABO(var a:arbol);
var
   l:libro;
begin
  cargarLibro(l);
  while(l.ISBN<>0)do begin
      insertar_en_ABO(a,l);
      writeln('--------------------');
      writeln();
      cargarLibro(l);
  end;
end;

function recorrer_acotado (a:arbol; ISBN:longint): boolean;

var
   encontro:boolean;
begin
 encontro:=False;
  if (a <> nil)and(encontro=False) then
    if (a^.dato.ISBN > ISBN) then
      encontro:=recorrer_acotado(a^.hi,ISBN)
    else
      if (a^.dato.ISBN < ISBN) then
        encontro:=recorrer_acotado(a^.hd,ISBN)  //USAR ENCONTRO, NO IGUALAR AL PROCEDURE
      else
       // if(a^.dato.ISBN = ISBN )then
          encontro:=True;

   recorrer_acotado:=encontro; {SE PUEDE LA RECURSION PARA DEVOLVER BOOLEANOS, Y CONTADORES}
end;

         {
function recorrer_entero( a: arbol; clase:string):integer;//se procesa 1ro algún hijo, tiende  air a la izquierda imprimiendo de abajo para arriba, dejando todo en orden
var
   cant:integer;
begin
  cant:=0;
  if ( a <> nil ) then begin
    recorrer_entero (a^.HD, clase);
    if (a^.dato.clase=clase)then
      cant:=cant+1;
    recorrer_entero (a^.HI, clase);
  end;
  recorrer_entero:=cant;
end; { SI SE PUEDE USAR UNA FUNCION PARA CONTAR, QUEDA IGUALADO A 1 PORQUE LO HICIMOS MAL}


procedure recorrer_entero( a: arbol; clase:string; var cant:integer);
begin
  if ( a <> nil ) then begin
    recorrer_entero (a^.HD, clase, cant);
    if (a^.dato.clase=clase)then
      cant:=cant+1;
    recorrer_entero (a^.HI, clase, cant);
  end;
end;
       COMO PROCEDURE FUNCIONA PERO NO ES LO MAS OPTIMO}
function recorrer_entero2(a: arbol; clase: string): Integer;
var
   cant: Integer;
begin
  cant:=0;
  if (a<>nil) then begin
    if (a^.dato.clase = clase) then
      cant:=cant+1;
    cant:=cant+recorrer_entero2(a^.HD,clase);  //no olvidar de igualar a cant
    cant:=cant+recorrer_entero2(a^.HI,clase);
  end;

  recorrer_entero2:=cant; //siempre al final
end;


function encontrar_titulo( a: arbol; titulo:string):boolean;
var
  encontro:boolean;
begin
  encontro:=False;
  if ( a <> nil )and(encontro=False) then begin
    if(a^.dato.titulo=titulo)then
      encontro:=True
    else begin
    encontro:=encontrar_titulo (a^.HD, titulo);
    encontro:=encontrar_titulo (a^.HI, titulo); //hacerlo con encontro
    end;
  end;
  encontrar_titulo:=encontro;
end;

var
   a:arbol;
   ISBN:longint;
   cant:integer;
   clase,titulo:string;
begin
     cant:=0;
     a:=nil;
     cargar_ABO(a);
     writeln('--------------');
     writeln();

     writeln('Ingrese un ISBN para buscar: ');
     readln(ISBN);
     if(recorrer_acotado(a,ISBN))then
       writeln('se encontro el libro')
     else
       writeln('NO se encontro el libro');
     writeln('--------------');
     writeln();

     writeln('ingrese una clase para buscar: ');
     readln(clase);  {
     recorrer_entero(a,clase,cant);
     writeln('la cantidad de libros de esa clase es de: ',cant);
     writeln('---------------------');
     writeln();   }
     writeln('la cantidad de libros de esa clase es de: ',recorrer_entero2(a,clase));
     writeln('---------------------');
     writeln();

     writeln('Ingrese un titulo para buscar: ');
     readln(titulo);
     if(encontrar_titulo(a,titulo))then
       writeln('se encontro el libro')
     else
       writeln('NO se encontro el libro');
     readln;
end.
