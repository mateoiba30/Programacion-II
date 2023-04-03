import java.util.Scanner;

/*conjunto de Strings
enum subrang{ 
    azul, rojo
}*/

public class OperarTriangulo {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Triangulo triangulo;

        //INSTANCIAMOS CON EL CONSTRUCTOR VACÍO
        triangulo=new Triangulo();
        System.out.println("Ingrese el lado 1");
        triangulo.setLado1(in.nextDouble());
        System.out.println("Ingrese el lado 2");
        triangulo.setLado2(in.nextDouble()); 
        System.out.println("Ingrese el lado 3");
        triangulo.setLado3(in.nextDouble());
        System.out.println(triangulo.getPerimetro());

        System.out.println("Ingrese el lado 1");
        double lado1=in.nextDouble();
        System.out.println("Ingrese el lado 2");
        double lado2=in.nextDouble();
        System.out.println("Ingrese el lado 3");
        double lado3=in.nextDouble();
        System.out.println("Ingrese el color de los lados");
        String colorLado=in.next();
        System.out.println("Ingrese el color de relleno");
        String colorRelleno=in.next();
        triangulo=new Triangulo(lado1,lado2,lado3,colorLado,colorRelleno);
        System.out.println(triangulo.getPerimetro());

        

        in.close();
    }
    
}
