Program listas;
uses crt;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;
Var
 L: Lista;
 n, min: integer;


function Minimo(l:Lista;min:integer):integer;
 begin
    if(l<>nil)then begin
        if(l^.datos<min)then
            min:=l^.datos;
        l:=l^.sig;
        min:=Minimo(l,min);
    end;
    Minimo:=min; //asignarle el valor a la funcion al final
 end;

Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;

{Procedure Imprimir (pri:lista);

Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;
 }
procedure ImprimirRecursivo (l:lista);

begin
  if(l<>nil)then begin
    write(l^.Datos,' ');
    l:=l^.sig;
    ImprimirRecursivo(l);
  end;
end;

begin
 L:=nil;
 min:=9999;
 randomize;
 n := random (100);
 While (n<>0) do Begin
   AgregarAdelante (L, n);
   n := random (100);
 End;
 writeln ('Imprimir Recursivo: ');
 ImprimirRecursivo (L);

 writeln();
 writeln('El minimo es: ',Minimo(l,min));
 readkey();

 readln
end.
