program autoev3_ej2;
type

  arbol = ^nodoA;  { El puntero al tipo base }
  nodoA = record     { El tipo base en sí: }
    dato:    integer;  {   - un dato }
    hijoIzq: arbol;   {   - puntero a su hijo izquierdo }
    hijoDer: arbol;   {   - puntero a su hijo derecho }
  end;
procedure eliminar(a: arbol);
begin
  if a <> nil then
  begin
    eliminar(a^.hijoIzq);
    eliminar(a^.hijoDer);
    dispose(a);
  end;
end;
var
  a:arbol;
begin


end.

