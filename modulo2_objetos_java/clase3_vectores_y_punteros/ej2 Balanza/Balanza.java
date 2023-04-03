public class Balanza {
    private double monto;
    private int cantidad;

    public Balanza(){

    }
    public Balanza iniciarCompra(){
        Balanza balanza=new Balanza();

        balanza.monto=0;
        balanza.cantidad=0;

        return balanza;
    }

    public Balanza registrarProducto(double pesokg, double preciokg){
        Balanza balanza=new Balanza();

        monto=monto+pesokg*preciokg;
        cantidad++;

        return balanza;
    }

    public double devolverMontoAPagar(){
        return monto;
    }

    public String devolverResumenDeCompra(){
        String frase="";

        frase=("Total a pagar "+monto+" por la compra de "+cantidad+" producto/s");

        return frase;
    }
    

}