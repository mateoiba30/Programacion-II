public class Producto2 {
    private int codigo;
    private String nombre;
    private String descripcion;
    private String marca;
    private int stock;

    public Producto2() {

    }

    public int getCodigo() {
        return codigo;
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

    public void setMarca(String unaMarca) {
        marca = unaMarca;
    }

    public void setDecripcion(String unaDescripcion) {
        descripcion = unaDescripcion;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public void setCodigo(int unCodigo) {
        codigo = unCodigo;
    }

    public void setStock(int unStock) {
        stock = unStock;
    }

    public String devolverDatos() {
        String frase = "";

        frase = ("El producto " + codigo + " de nombre " + nombre + " (" + descripcion + ") de la marca " + marca
                + " se encuentra disponible en un total de " + stock + " unidad/es");

        return frase;
    }

    public String modificarstock(int stockAdicional, int codigoProducto) {
        String frase = "";
        stock = stock + stockAdicional;

        frase = ("El producto con codigo " + codigoProducto
                + " se incremento recientemente en stock, y ahora se encuentra disponible en un total de " + stock
                + " unidad/es");

        return frase;
    }
}