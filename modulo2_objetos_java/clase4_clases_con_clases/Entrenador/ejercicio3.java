import java.util.Scanner;
public class  ejercicio3{
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN

        System.out.println("Ingrese el nombre del etrenador: ");
        String nom=in.nextLine();
        System.out.println("Ingrese el sueldo: ");
        Double suel=in.nextDouble();  
        System.out.println("Ingrese campeonatos: ");
        int camp=in.nextInt();      
        Entrenador entrenador= new Entrenador(nom, suel, camp);
        
        System.out.println("nombre del etrenador: "+(entrenador.getNombre()));
        in.close();
    }
}
