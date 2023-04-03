import java.util.Scanner;  //informo que voy a usar scanner

public class ej2_patente {  //declaro la clase
    public static void main(String[] args) { //metodo de la clase

        Scanner in = new Scanner(System.in);   //abro scan  
        
        int patente,cont=0,autos=0;//prefiero declarar al inicio

        System.out.println("Ingrese una patente ('0' para finalizar): ");
        patente = in.nextInt();

        while(patente!=0){
            if(patente%2==0){
                System.out.println("Tiene permitido el paso");
                autos++;}
            else
                System.out.println("NO tiene permitido el paso");
            cont++;

            System.out.println("Ingrese otra patente ('0' para finalizar): ");
            patente = in.nextInt();
        }

       // double porcentaje= ((double)autos/cont)*100;
        //porcentaje=porcentaje*100;

        System.out.println("El porcentaje de autos que pasaron es de: "+ (((double)autos/cont)*100));//las opraciones en un writeln va entre corchetes
        in.close();  //cierro scan
   }

}