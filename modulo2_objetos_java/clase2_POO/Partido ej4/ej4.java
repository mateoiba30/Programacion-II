import java.util.Scanner; 
public class ej4 {
    public static void main (String[] args) {
        Scanner in = new Scanner(System.in);

        int i,T=2;
        Partido [] vectorP= new Partido[T];//325 dice la consigna
        
        for(i=0;i<T;i++){
            vectorP[i]=CargarPartido(in);
        }

        in.close();

    }

    public static Partido CargarPartido (Scanner in){
        Partido p=new Partido(); //inicializamos e instanciamos

        System.out.println("Ingrese el local ");
        p.setLocal(in.next());//se puede hacer de esta manera

        System.out.println("Ingrese el visitante ");
        p.setVisitante(in.next());

        System.out.println("Ingrese goles del local ");
        p.setGolesLocal(in.nextInt());//se puede hacer de esta manera

        System.out.println("Ingrese goles del visitante ");
        p.setGolesVisitante(in.nextInt());

        return p;
    }
}