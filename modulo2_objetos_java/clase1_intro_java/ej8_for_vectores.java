import java.util.Scanner;  //informo que voy a usar scanner
public class ej8_for_vectores {  //declaro la clase


    public static void main(String[] args) { //metodo de la clase     
        Scanner in = new Scanner(System.in);   //abro scan PARA LEER, NO PARA ESCRIBIR

        int []puntos = new int[5];
        String []nombres = new String[5];
        int j,i,x=0,aux;

        for(i=0;i<5;i++){
            puntos[i]=0;
        }

        nombres[0]="Atencion al cliente";
        nombres[1]="Calidad de la comida";
        nombres[2]="Precio";
        nombres[3]="Ambiente";

        for(j=0;j<5;j++){
            System.out.println("cliente "+(x+1));
            for( i=0;i<4;i++){
                System.out.println("Ingrese la puntuacion de "+(nombres[i])+": ");
                aux= in.nextInt();
                puntos[i]=puntos[i]+aux;

            }
            x++;
            System.out.println("----------------------");
        }

        for( i=0;i<4;i++)
            System.out.println("la calificacion promedio de "+nombres[i]+"es de "+puntos[i]/5.0);

        in.close();  //cierro scan
        }
    }