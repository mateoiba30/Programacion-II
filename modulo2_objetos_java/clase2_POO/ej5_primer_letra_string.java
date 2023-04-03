import java.util.Scanner; 

public class ej5_primer_letra_string {
    final int T=10;
    public static void main (String[] args) {
        Scanner in = new Scanner(System.in);


        String []vector= new  String[T];
        //T-=1;// ESTO SE PUEDE HACER al igual que T-=1;
  
        vector=CargarVector(vector, in);
        System.out.println("El mensaje escondido es: "+(Mensaje(vector)));

        in.close();
    }

    public static String Mensaje (String[] vector){
        int i;
        String mensaje="";

        for(i=0;i<T;i++){
            mensaje=mensaje+vector[i].charAt(0);

        }
        return mensaje;
    }

    public static String[] CargarVector (String[] vector, Scanner in){
        int i;

        for(i=0;i<T;i++){
            System.out.println("Ingrese el string numero "+(i+1)+": ");
            vector[i]=in.next();
        }
        return vector;
    }
}