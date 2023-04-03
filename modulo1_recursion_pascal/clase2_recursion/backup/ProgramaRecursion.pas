program Recursion;

var 
  num, maximo: integer;

procedure digitoMaximo(n: integer;  max: integer);  //si n estaria por referencia cuando hago el ultimo wirte de la linea 24 me diria cero
var           //si max estaria por referencia (igual se hace , adema´s al programa principal no se le devuelve ningun valor
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  //caso base cuando n=0, entonces no hay que analizar nada más, se va acercadno cuando hace el div
  writeln ('max: ', max);//se hace cuando se terminen las recursiones, y se muestran cuando se hace el backtrack, ya con el resultado final
end;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  readln;
End.

