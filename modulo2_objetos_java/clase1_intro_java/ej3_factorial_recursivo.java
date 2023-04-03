import java.util.Scanner;  //informo que voy a usar scanner

public class ej3_factorial_recursivo {  //declaro la clase
    public static void main(String[] args) { //metodo de la clase

        Scanner in = new Scanner(System.in);   //abro scan  
        System.out.println("Ingrese un numero: ");
        int numero=in.nextInt();

        System.out.println("El factorial de "+numero+" es: "+ (Factorial(numero)));

        in.close();  //cierro scan
   }

    public static int Factorial (int x){
        if (x <= 1) 
            return 1;//escribimos solo return en vez del nombre de la funcion
        else
            return x*Factorial(x-1);            
        
   }
}

