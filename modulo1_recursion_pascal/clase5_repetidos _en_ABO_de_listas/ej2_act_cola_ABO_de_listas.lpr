Program ej2_act_cola_ABO_de_listas; //a diferencia del ej 1, se usa un arbol de listas, con lo cual es distintp el tratamiento de repetidos
//en el caso anterior, si se repite se aumenta un contador, en cambio ahora alargamos una lista
const
  INICIO=1800;
  FIN=1900;
Type
  lista=^nodoL;
  nodoL=record
    dato:integer; //dni
    sig:lista;
  end;

  paciente=record
    DNI:integer;
    cod:integer;
    ciudad:string;
  end;

  info=record
    cod:integer;
    puntero:lista;
  end;

  arbol=^nodoA;
  nodoA=record
    dato:info;
    hi:arbol;
    hd:arbol;
  end;

procedure cargarlista(var l: lista; dni: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := dni;
  aux^.sig := l;
  l:= aux;
end;

procedure insertar_paciente(var a:arbol; p:paciente);
var
   nue:arbol;
begin
 if(a=nil)then begin   //no poner: (a^.HI=nil)and(a^.HD=nil)
   new(nue);
   nue^.dato.cod:=p.cod;
   cargarlista(nue^.dato.puntero,p.DNI);
   nue^.HI:=nil;
   nue^.HD:=nil;
   a:=nue;
 end
 else begin
   if(a^.dato.cod>p.cod)then begin
     insertar_paciente(a^.HI,p);
   end
   else begin
      if(a^.dato.cod<p.cod)then
        insertar_paciente(a^.HD,p)
      else begin  //en el caso que el peso sea igual incrementamos el contador
        cargarlista(a^.dato.puntero,p.DNI);
      end;
   end;
 end;

end;

procedure cargar_paciente(var p:paciente);
begin
 with p do begin
   writeln('ingrese DNI ("0" para finalizar): ');
   readln(DNI);
   if (DNI<>0)then begin
     writeln('codigo postal: ');
     readln(cod);
     writeln('ciudad: ');
     readln(ciudad);
     writeln('------');
   end;
 end;
end;

procedure cargar_arbol(var a:arbol);
var
   p:paciente;
begin
 cargar_paciente(p);
 while(p.DNI<>0)do begin
   insertar_paciente(a,p);
   cargar_paciente(p);
 end;
end;

procedure imprimir_lista (l:lista);
begin
  while (l<>nil) do begin
    write(l^.dato,' ');
    l:=l^.sig;
  end;
end;

procedure informar_lista (a: arbol);
begin
  if(a <> nil)then begin
    if(a^.dato.cod>=INICIO)and(a^.dato.cod<=FIN)then begin
      write (a^.dato.cod, '          | ');
      imprimir_lista(a^.dato.puntero); //tuvimos que llamar un módulo, antes no era necesario para el ej 1
      writeln();
      informar_lista(a^.hi);
      informar_lista(a^.hd);
    end
    else
       if(a^.dato.cod > FIN)then
          informar_lista(a^.hi)
       else
          informar_lista(a^.hd); //no pasa nada si es igual porque eso nunca va a pasar (si era igual incrementabamos la cant_inf
  end;
end;

Var
 a:arbol;

begin
 cargar_arbol(a);
 writeln('------------');
 writeln('Codigo Postal | Lista de DNIs ');
 informar_lista(a);

 readln;
end.
