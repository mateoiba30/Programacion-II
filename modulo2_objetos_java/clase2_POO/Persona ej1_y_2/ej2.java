import java.util.Scanner; 
public class ej2 {
    public static void main (String[] args) {
        Scanner in = new Scanner(System.in); //EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN
        int i,T=3;
        Persona [] vectorP= new Persona[T];

        for( i=0;i<T;i++)//si lo declaro acá al "i" lo voy a tener que declarar siempre que lo use    
            vectorP[i]=CargarPersona(in);//mandamos por referencia el scanner

        for( i=0;i<T;i++)
            System.out.println(vectorP[i].toString());


        System.out.println("la cantidad de personas mayores a 65 años es de: "+ contar(vectorP,T));

        System.out.println("La persona asociada al menor DNI: "+((PersonaMin(vectorP,T)).toString()));
        in.close();


    }


    public static Persona CargarPersona (Scanner in){
        String z="";//los strings los debemos inicializar
        Persona p=new Persona(); //inicializamos e instanciamos

        System.out.println("Ingrese DNI");
        p.setDNI(in.nextInt());//se puede hacer de esta manera

        System.out.println("Ingrese edad");
        int y=in.nextInt();
        p.setEdad(y);//o de esta

        System.out.println("Ingrese nombre");
        z= in.next();
        p.setNombre(z);

        return p;
    }

    
    
    public static int contar (Persona[] vectorP, int T){
        int i,contador=0;
        for (i=0;i<T;i++){
         if ((vectorP[i].getEdad())>65)
             contador++;
 
        }
 
         return contador;
     }
    public static Persona PersonaMin(Persona [] vectorP, int T){
        int i,min=9999;
        Persona personita=new Persona();
        for (i=0;i<T;i++){
            if ((vectorP[i].getDNI())<min){
                min=vectorP[i].getDNI();
                personita=vectorP[i];

            }
        }
        return personita;



    }
}