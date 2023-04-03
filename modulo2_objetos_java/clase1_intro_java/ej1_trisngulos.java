import java.util.Scanner;  //informo que voy a usar scanner

public class ej1_trisngulos {  //declaro la clase
    public static void main(String[] args) { //metodo de la clase

        Scanner in = new Scanner(System.in);   //abro scan  

        System.out.println("Ingrese el lado a: ");
        double a = in.nextDouble();
        System.out.println("Ingrese el lado b: ");
        double b = in.nextDouble();
        System.out.println("Ingrese el lado c: ");
        double c = in.nextDouble();
        
        
        if((a<b+c)&&(b<c+a)&&(c<a+b))
            System.out.print("Triangulo valido, su perimetro es: "+ (a+b+c));//no olvidar de ponerle parentesis a las operaciones
        else                                                                 //si no le pongo los paréntesis me los une commo strings
            System.out.print("Triangulo NO valido");

        in.close();  //cierro scan
   }

}
