Program tweets_ABO_de_listas;
Uses
     sysutils;
const
  INF=100;
  SUP=700;//se guarda como integer
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;
     info=record
       cont:integer;
       cod:integer;
     end;

     arbol=^nodoA;
     nodoA=record
       dato:info;
       hi:arbol;
       hd:arbol;
     end;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(2000);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(2000);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


procedure insertar_en_ABO (var a:arbol; code:integer);
//var
 //  nue:arbol;
begin
 if(a=nil)then begin   // no hace falta modularizar
   new(a);                //no hace falta usar nue, PERO HAY QUE HACER new(a)
   with a^.dato do begin
     cod:=code;
     cont:=1;
     a^.HI:=nil;
     a^.HD:=nil;
   end;
   //a:=nue;
 end
 else begin
   if(a^.dato.cod>code)then begin
     insertar_en_ABO(a^.HI,code);
   end
   else begin
      if(a^.dato.cod<code)then
        insertar_en_ABO(a^.HD,code)
      else  //en el caso que el dni sea igual incrementamos la lista y el total
        a^.dato.cont:=a^.dato.cont+1;
   end;
 end;

end;

procedure cargar_ABO(var a:arbol; l:listaTweets);

begin
  while(l<>nil)do begin
      insertar_en_ABO(a,l^.dato.codigoUsuario);
      l:=l^.sig;
  end;
end;

procedure recorrer_e_imprimir (a:arbol);//con la funcion no voy a ir podiendo acumular un valor
begin
  if (a <> nil) then
    if (a^.dato.cod >= INF) then   //como hay iguales, incluye los límites. pero si el límite es ej:2 va a imprimirlo pero tmb va a analizar a su hijo por izquierda innecesariamente
      if (a^.dato.cod<= SUP) then begin
                                         //si pongo el write acá, me imprime pre orden
        recorrer_e_imprimir(a^.hi);
        writeln(a^.dato.cod,' cant de tweets: ',a^.dato.cont);
        writeln();
        recorrer_e_imprimir (a^.hd);
         //si pongo el write acá, me imprime post orden
      end
      else
        recorrer_e_imprimir(a^.hi)
    else
      recorrer_e_imprimir(a^.hd);
end;

Procedure recorrer_ABO( a: arbol; var max,codmax:integer); //se procesa 1ro algún hijo, tiende  air a la izquierda imprimiendo de abajo para arriba, dejando todo en orden
begin
  if ( a <> nil ) then begin
    recorrer_ABO (a^.HD, max,codmax);  //si acá podría HI y luego HD en la línea 197 me imprime la lista de Mayor  a Menor
    if (a^.dato.cont>max)then  begin
      max:=a^.dato.cont;
      codmax:=a^.dato.cod;
    end;
    recorrer_ABO (a^.HI, max,codmax);
  end;
end;

procedure informar_nombre(l:listaTweets; codmax:integer);
begin
  while (l<>nil)and(l^.dato.codigoUsuario<>codmax) do
      l:=l^.sig;
  if(l<>nil)then
    writeln('El usuario con mayor cantidad de Tweets es: ',l^.dato.nombreUsuario);
end;

var
   l: listaTweets;
   a:arbol;
   max,codmax:integer;
begin
     max:=-1;
     Randomize;
     a:=nil;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     writeln('----------------');
     writeln();

     cargar_ABO(a,l);

     recorrer_e_imprimir(a);//no hace falta poner if(l<>nil) porq eso se hace en cada modulo
     recorrer_ABO(a, max, codmax);
     informar_nombre(l,codmax);

     readln;
end.
