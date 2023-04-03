program CalculoDePotencia;
uses crt;

Function potencia1 (x,n: integer): real;
begin
  if(n=0)then
    potencia1:=1
  else
    potencia1 := x * potencia1(x,n-1);
end;
{function potencia(x,n:integer):real;
	begin
	if (n=0) then
		potencia:=1
		else
	potencia:=x * potencia(x,n-1);
end;


var
	x:integer;
	n:integer;
begin
	writeln('Ingrese un numero: ');
	readln(x);
	writeln('Ahora ingrese la potencia: ');
	readln(n);
	writeln('El numero resultante es: ',potencia(x,n):2:2);
end.
}

{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln('La potencia de ',n,' elevado a ',x,' es de: ',potencia1(x,n):2:3);
     readkey();
     readln;
end.
