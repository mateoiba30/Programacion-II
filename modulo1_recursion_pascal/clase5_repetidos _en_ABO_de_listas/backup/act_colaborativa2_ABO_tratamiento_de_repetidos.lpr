Program act_colaborativa2_ABO_tratamiento_de_repetidos;
//simple eficiencia--> árbol de listas
//doble eficiencia--> árbol de árboles
const
  INICIO=1800;
  FIN=1900;
Type

  paciente=record
    DNI:integer;
    cod:integer;
    ciudad:string;
  end;

  info=record
    cod:integer;
    ciudad:string;
    cant_inf:integer;
  end;

  arbol=^nodo;
  nodo=record
    dato:info;
    hi:arbol;
    hd:arbol;
  end;

procedure insertar_paciente(var a:arbol; p:paciente);
var
   nue:arbol;
begin
 if(a=nil)then begin   //no poner: (a^.HI=nil)and(a^.HD=nil)
   new(nue);
   nue^.dato.cod:=p.cod;
   nue^.dato.ciudad:=p.ciudad;
   nue^.dato.cant_inf:=1;//apenas cargo el nodo es uno
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
        a^.dato.cant_inf:=a^.dato.cant_inf+1;
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

procedure Busqueda(a: arbol);
begin
  if(a <> nil)then begin
    if(a^.dato.cod>=INICIO)and(a^.dato.cod<=FIN)then begin
      write ('codigo postal: ',a^.dato.cod, '-- ciudad: ',a^.dato.ciudad,'-- infectados: ',a^.dato.cant_inf);
      writeln();
      Busqueda(a^.hi);
      BUsqueda(a^.hd);
    end
    else
       if(a^.dato.cod > FIN)then
          Busqueda(a^.hi)
       else
          Busqueda(a^.hd); //no pasa nada si es igual porque eso nunca va a pasar (si era igual incrementabamos la cant_inf
  end;
end;

Var
 a:arbol;

begin
 cargar_arbol(a);
 writeln('------------');
 Busqueda(a);

 readln;
end.
