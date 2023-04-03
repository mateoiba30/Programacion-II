import java.util.Scanner;
public class  ejercicio3{
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN

        Entrenador entrenador= new Entrenador();
        System.out.println("Ingrese el nombre del etrenador: ");
        entrenador.setNombre(in.nextLine());//usamos Line para que es siguiente read no tome el enter
        System.out.println("Ingrese el sueldo: ");
        entrenador.setSueldo(in.nextDouble());  
        System.out.println("Ingrese campeonatos: ");
        entrenador.setCampeonatos(in.nextInt());      

        entrenador.setSueldo( entrenador.calcularSueldoACobrar() );//no olvidar de modificar el sueldo
        System.out.println("El sueldo del entrandor con los campeonatos ganados es de: "+(entrenador.getSueldo()));

        System.out.println("nombre del etrenador: "+(entrenador.getNombre()));
        System.out.println("sueldo del etrenador: "+(entrenador.getSueldo()));
        System.out.println("campeonatos del etrenador: "+(entrenador.getCampeonatos()));

        in.close();
    }
}
