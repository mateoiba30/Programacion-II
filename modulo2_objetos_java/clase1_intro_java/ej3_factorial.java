import java.util.Scanner;  //informo que voy a usar scanner

public class ej3_factorial {  //declaro la clase
    public static void main(String[] args) { //metodo de la clase

        Scanner in = new Scanner(System.in);   //abro scan  
        System.out.println("Ingrese un numero: ");
        int numero=in.nextInt();

        System.out.println("El factorial de "+numero+" es: "+ (Factorial(numero)));

        in.close();  //cierro scan
   }

    public static int Factorial (int numero){
        int i;
        if(numero>2)//el factorial de 2 es 2, el de 1 es 1, y el de cero es cero
            for(i=numero-1; i>=1; i--){
                numero=numero*i;
            }
        return numero;
   }
}


