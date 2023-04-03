program Arreglos;
uses crt;
const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


function Maximo(v:vector;dimL:dim;max,pos:integer):integer;//tengo el max acá para poder trasladar valores en el backtracking
begin          //maximo es la comunicacion en el backtracking, al igual que pos (se le hacen copias constantemente)
   //si pongo aca pos:=1 pierde sentido la liena 19
   if(pos<=dimL)then begin
       if(v[pos]>max)then
           max:=v[pos];
       pos:=pos+1;
       max:=Maximo(v,dimL,max,pos);
   end;
   Maximo:=max; //asignarle el valor a la funcion al final
end;

function Sumar(v:vector; dimL:dim; suma,pos:integer):integer;
begin
   if(pos<=dimL)then begin
          suma:=suma+v[pos];
          pos:=pos+1;
          suma:=Sumar(v,dimL,suma,pos);
      end;
      Sumar:=suma; //asignarle el valor a la funcion al final
end;

{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



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
   dimL : dim;
   max,pos,suma:integer;

begin
     max:=-1;
     pos:=1;
     suma:=0;
     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);

     writeln('El maximo numero es: ',maximo(v,dimL,max,pos));
     readkey();
     writeln('La suma de los elemntos es de: ',Sumar(v,dimL,sum,pos);
     readkey();
end.
