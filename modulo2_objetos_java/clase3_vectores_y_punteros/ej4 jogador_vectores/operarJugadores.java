import java.util.Scanner;

public class operarJugadores {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in); // EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN
        int i;
        int T = 2;
        Jugador[] vectorJ = new Jugador[T];
        System.out.println("Comienza la carga del vector");
        System.out.println("---------------------------------------------");
        for (i = 0; i < T; i++) {
            //vectorJ[i] = cargarJugador(in);
            cargarVector(vectorJ, in, i);//PUEDO CARGAR UN VECTOR CON UN VOID PORQUE EL VECTOR ES UN OBJETO, ES UN PUNTERO
            System.out.println(vectorJ[i].toString());
        }
        System.out.println("La cantidad de jugadores con mas de 100 partidos es de: " + (ContarPartidos(vectorJ, T)));
        in.close();
    }

    public static int ContarPartidos(Jugador[] vectorJ, int T) {
        int i, contador = 0;
        for (i = 0; i < T; i++) {
            if ((vectorJ[i].getPartidos()) > 100) {
                contador++;

            }

        }
        return contador;

    }

    public static Jugador cargarJugador(Scanner in) {
        String z = " ";
        Jugador j = new Jugador();
        {
            System.out.println("Ingrese el nombre del jugador: ");
            z = in.next();
            j.setNombre(z);
            System.out.println("Ingrese partidos del jugador: ");
            j.setPartidos(in.nextInt());
            System.out.println("Ingrese el DNI del jugador: ");
            j.setDNI(in.nextInt());
            System.out.println("Ingrese la edad del jugador: ");
            j.setEdad(in.nextInt());
            System.out.println("Ingrese los goles del jugador: ");
            j.setGoles(in.nextInt());
        }
        return j;
    }

    public static void cargarVector(Jugador[] vectorJ, Scanner in, int i) {
        String z = " ";
        Jugador j = new Jugador();
        {
            System.out.println("Ingrese el nombre del jugador: ");
            z = in.next();
            j.setNombre(z);
            System.out.println("Ingrese partidos del jugador: ");
            j.setPartidos(in.nextInt());
            System.out.println("Ingrese el DNI del jugador: ");
            j.setDNI(in.nextInt());
            System.out.println("Ingrese la edad del jugador: ");
            j.setEdad(in.nextInt());
            System.out.println("Ingrese los goles del jugador: ");
            j.setGoles(in.nextInt());
        }
        vectorJ[i]=j;
    }

}