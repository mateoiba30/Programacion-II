program VectorOrdenado;
uses crt;
{ en la recusri�n si la hago mal se puede generar un bucle infinito
la principal ventaja de la recursi�n es que facilita la escritur, que en secuencial es m�s dificil
se resuelve un problema con invocaciones a instancias reducidas del mismo
tiene un caso base que resuelve el problema que me libera de la recursi�n y me lleva al backtracking (va realizando distintas operacioners hasta llegar a la del llamado inical
volver a llamar ala funcion pide mas memoria ram que se acumula en la pila de activaci�n
en la pila de activaci�n de un m�dulo se guarda:
  parametros recibidos por referencia
  punto de retorno
  par�metros recibidos por valor en el m�dulo
  variables locales al m�dulo

}
const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

function encontro(x:integer; v:vector; inicio,fin:dim):boolean;
var
   medio:integer;
begin
  encontro:=false;

  if(fin-inicio>=0)then begin
    medio:=(fin+inicio)div 2;

    if(v[medio]=x)then
      encontro:=True
    else
      if(x<v[medio])then begin
        fin:=medio-1;
        encontro:=encontro(x,v,inicio,fin);
      end
      else begin
         inicio:=medio+1;
         encontro:=encontro(x,v,inicio,fin);
      end;
  end;
end;



{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   inicio,fin : dim;
   x:integer;

begin
     inicio:=1;
     cargarVectorOrdenado(v,fin);
     writeln('Nros almacenados: ');
     imprimirVector(v, fin);
     writeln('Ingrese un numero a buscar: ');
     readln(x);
     if(encontro(x,v,inicio,fin))then begin
         writeln('Encontro el numero');
         readkey();
     end
     else
         writeln('NO encontro el numero');
         readkey();

     readln;
end.
