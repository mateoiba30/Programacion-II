Program arbol_ABO;
Uses
     sysutils;
const
  INF=100;
  SUP=700;//se guarda como integer
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


  {
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;   }

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
//var
 //  nue:arbol;
begin
 if(a=nil)then begin   // no hace falta modularizar
   new(a);                //no hace falta usar nue, PERO HAY QUE HACER new(a)
   with a^.dato do begin
     a^.dato:=l;
     a^.HI:=nil;
     a^.HD:=nil;
   end;
   //a:=nue;
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

function recorrer_acotado (a:arbol; ISBN:longint): boolean;  //recibe datos complejos

var
   encontro:boolean;
begin
 encontro:=False;
  if (a <> nil)and(encontro=False) then   //si ya encontro no hay que seguir buscando
    if (a^.dato.ISBN > ISBN) then
      recorrer_acotado:=recorrer_acotado(a^.hi,ISBN) //no olvidar de que se llame a si misma
    else
      if (a^.dato.ISBN < ISBN) then
        recorrer_acotado:=recorrer_acotado(a^.hd,ISBN)
      else
       // if(a^.dato.ISBN = ISBN )then
          encontro:=True;

   recorrer_acotado:=encontro; {SE PUEDE LA RECURSION PARA DEVOLVER BOOLEANOS, NO CONTADORES}
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
end; { NO SE PUEDE USAR UNA FUNCION PARA CONTAR, QUEDA IGUALADO A 1}
}

procedure recorrer_entero( a: arbol; clase:string; var cant:integer);//se procesa 1ro algún hijo, tiende  air a la izquierda imprimiendo de abajo para arriba, dejando todo en orden
begin
  if ( a <> nil ) then begin
    recorrer_entero (a^.HD, clase, cant);
    if (a^.dato.clase=clase)then
      cant:=cant+1;
    recorrer_entero (a^.HI, clase, cant);
  end;
end;


function encontrar_titulo( a: arbol; titulo:string):boolean;//se procesa 1ro algún hijo, tiende  air a la izquierda imprimiendo de abajo para arriba, dejando todo en orden
var
  encontro:boolean;
begin
  encontro:=False;
  if ( a <> nil )and(encontro=False) then begin
    if(a^.dato.titulo=titulo)then
      encontro:=True
    else begin
    encontrar_titulo:=encontrar_titulo (a^.HD, titulo);
    encontrar_titulo:=encontrar_titulo (a^.HI, titulo);
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
     readln(clase);
     recorrer_entero(a,clase,cant);
     writeln('la cantidad de libros de esa clase es de: ',cant);
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
