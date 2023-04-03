import java.util.Scanner; 
public class ej1 {
    public static void main (String[] args) {
        String nombre1="",texto;//hace falta darle un valor inicial AL STRING en BlueJ y visual
        int DNI1,edad1;
        Persona p=new Persona();//la inicializamos sin valores
        texto=p.toString();//NO imprime nada

        Scanner in = new Scanner(System.in);
        DNI1=in.nextInt();
        nombre1=in.next();
        edad1=in.nextInt();
        in.close(); 

        p.setNombre(nombre1);
        p.setDNI(DNI1);
        p.setEdad(edad1);

        texto=p.toString();
        System.out.println(texto);



    }
}