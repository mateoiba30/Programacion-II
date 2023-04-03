import java.util.Scanner;  //informo que voy a usar scanner
public class ej4_factoriales {  //declaro la clase
    public static void main(String[] args) { //metodo de la clase
        Scanner in = new Scanner(System.in);   //abro scan  

        int i;
        for(i=1;i<10;i++)
            System.out.println("Factorial de "+i+": "+ (Factorial(i)));

        in.close();  //cierro scan
   }

    public static int Factorial (int numero){//no me modifica el valor de "numero" en el método principal
        int j;
        if(numero>2)//el factorial de 2 es 2, el de 1 es 1, y el de cero es cero
            for(j=numero-1; j>=1; j--){
                numero=numero*j;
            }
        return numero;
   }
}