import java.util.Scanner;
public class OperarBalanza {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        double pesokg, preciokg;
        Balanza balanza=new Balanza();//inicializamos e instanciamos

        balanza.iniciarCompra();//balanza apunta a lo mismo, pero se modifico a lo que apunta


        System.out.println("Ingrese el peso en kilos del item: (cero para finalizar) ");
        pesokg=in.nextDouble();

        while(pesokg!=0){
            System.out.println("Ingrese el precio por kilo: ");
            preciokg=in.nextDouble();
            balanza.registrarProducto(pesokg, preciokg);

            System.out.println("Ingrese el peso en kilos del item: (cero para finalizar)");
            pesokg=in.nextDouble();
        }

        System.out.println(balanza.devolverResumenDeCompra());

        in.close();
    }
    
}