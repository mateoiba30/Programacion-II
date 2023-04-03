import java.util.Scanner;
public class OperarEmpleado {
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); 

        String nombre;
        double sueldo;
        int edad, DNI, partidos, goles, campeonatos;
        Empleado jugador;
        Empleado entrenador= new Entrenador();

        System.out.println("Carga de datos ");
        System.out.println("nombre: ");
        nombre=in.next();
        System.out.println("sueldo: ");
        sueldo=in.nextDouble();
        System.out.println("edad: ");
        edad=in.nextInt();        
        System.out.println("DNI: ");
        DNI=in.nextInt();        
        System.out.println("partidos: ");
        partidos=in.nextInt();        
        System.out.println("goles: ");
        goles=in.nextInt();
        System.out.println("campeonatos: ");
        campeonatos=in.nextInt();
        jugador= new Jugador(nombre,sueldo,edad,DNI,partidos,goles);
        entrenador= new Entrenador(nombre,sueldo,edad,DNI,campeonatos);

        System.out.println("el sueldo del jugador es de: "+jugador.CalcularSueldo());
        System.out.println("el sueldo del entrenador es de: "+entrenador.CalcularSueldo());

        in.close();
    }
    
}