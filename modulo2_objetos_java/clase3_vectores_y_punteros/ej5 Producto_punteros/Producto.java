public class Producto {
    private int cod;
    private String nombre;
    private String descripcion;
    private String marca;
    private int stock;

    /* NUNCA LO USÉ
    public Producto(int unCod, String unNombre, String unaDescripcion, String unaMarca, int unStock) {
        cod= unCod;
        nombre=unNombre;
        descripcion = unaDescripcion;
        marca = unaMarca;
        stock = unStock;
    }*/
    public Producto() {

    }
    public int getCod() {
        return cod;
    }
    public String getNombre() {
        return nombre;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public String getMarca() {
        return marca;
    }
    public int getStock() {
        return stock;
    }

    public void setCod(int unCod) {
        cod = unCod;
    }
    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public void setDescripcion(String unaDescripcion) {
        descripcion = unaDescripcion;
    }
    public void setMarca(String unaMarca) {
        marca = unaMarca;
    }
    public void setStock(int unStock) {
        stock = unStock;
    }
}