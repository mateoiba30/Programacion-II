import java.util.Scanner;
public class OperarTriangulo {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        Triangulo triangulo=new Triangulo();//inicializamos e instanciamos

        System.out.println("Ingrese el lado 1");
        triangulo.setLado1(in.nextDouble());
        System.out.println("Ingrese el lado 2");
        triangulo.setLado2(in.nextDouble()); 
        System.out.println("Ingrese el lado 3");
        triangulo.setLado3(in.nextDouble());

        System.out.println("El area del triangulo es de: "+(triangulo.getArea()));
        System.out.println("El perimetro del triangulo es de: "+(triangulo.getPerimetro()));

        in.close();
    }
    
}
