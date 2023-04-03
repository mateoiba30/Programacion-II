import java.util.Scanner;  //informo que voy a usar scanner
public class ej5_vectorAlturas {  //declaro la clase
    public static void main(String[] args) { //metodo de la clase
        Scanner in = new Scanner(System.in);   //abro scan  

        double []vectorAlturas=new double[15]; //en esta linea es para vecotores
        int i,contador=0;
        double promedio,suma=0;//si el contador no esta incializado lo marca como error

        for(i=0;i<15;i++){
            System.out.println("Altura jugador "+(i+1)+": ");
            vectorAlturas[i] = in.nextDouble();
            suma=suma+vectorAlturas[i];
        }
        promedio=suma/15.0;
        System.out.println("El promedio de alturas es de "+promedio);
        
        for(i=0;i<15;i++){
            if(vectorAlturas[i]>promedio){
                contador++;
            }
        }
        System.out.println("La cantidad de jugadores por encima del promedio es de: "+contador);
        in.close();  //cierro scan
   }
}
