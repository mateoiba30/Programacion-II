program prueba;

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

procedure digitoMaximo(n:integer;var max:integer);
	var
		dig:integer;
	begin
		dig:=n mod 10;
		if (dig>max) then
			max:=dig;
		n:=n div 10;
		if (n<>0) then
			digitoMaximo(n,max);
	end;
	
var
	n:integer;
	max:integer;
	
	
	begin
	writeln('Ingrese un numero: ');
	readln(n);
	digitoMaximo(n,max);
	writeln('El digito maximo del numero ',n,' es: ',max);
end.
	
