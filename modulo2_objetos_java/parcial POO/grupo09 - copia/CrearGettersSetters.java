import java.util.Scanner;
public class CrearGettersSetters {
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //no olvidar

        System.out.println("Ingrese cantidad de atributos: ");
        int x=in.nextInt();

        for(int i=0;i<x;i++){
            System.out.println("Ingrese nombre de la varable "+(i+1));
            String nombre=in.next();
            System.out.println("Ingrese tipo de la varable "+(i+1));
            String tipo=in.next();
            
            String set="set"+capitalize(nombre)+"(){}";
            
        }


        in.close();
       
    }

    public static String capitalize(String str)
    {
        if (str == null || str.length() == 0) {
            return str;
        }
 
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

}