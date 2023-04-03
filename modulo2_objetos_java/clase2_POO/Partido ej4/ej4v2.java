import java.util.Scanner; 
public class ej4v2 {
    public static void main (String[] args) {
        Scanner in = new Scanner(System.in);

        int T=325;//tamaño del vector
        double porcentaje;
        Partido [] vectorP= new Partido[T];//325 dice la consigna
        
        vectorP=CargarVector(vectorP,in,T);
        System.out.println("partidos ganados de River: "+(PartidosGanadosRiver(vectorP,T)));
        System.out.println("goles de local de Boca: "+(GolesLocalBoca(vectorP,T)));
        porcentaje =(double) Empates(vectorP,T)/T;
        System.out.println("El porcentaje de partidos que terminaron en empate es de: "+(porcentaje*100)+ "%");

        in.close();
    }
    public static int Empates (Partido[] vectorP, int T){
        int i,contador=0;
        for(i=0;i<T;i++){
            if(vectorP[i].hayEmpate())
              contador++;
        }
        return contador;
    }
    public static int GolesLocalBoca (Partido[] vectorP, int T){
        int contador=0,i;

        for (i=0;i<T;i++){
            if((vectorP[i].getLocal().equals("Boca")))//entra al for pero nunca al if por verdadero
                contador=contador+vectorP[i].getGolesLocal();                   
        }
        return contador;
    }

    public static int PartidosGanadosRiver (Partido[] vectorP, int T){
        int contador=0,i;

        for (i=0;i<T;i++){//entra al for pero nunca al if por verdadero
            if(vectorP[i].getGanador().equals("River"))//(((vectorP[i].getLocal()=="River")&&(vectorP[i].getGolesLocal()>vectorP[i].getGolesVisitante()))||((vectorP[i].getVisitante()=="River")&&(vectorP[i].getGolesLocal()<vectorP[i].getGolesVisitante())) )
              contador++;    //usar equals, no el == !!!!!!!!!!!       
        }
        return contador;
    }

    public static Partido[] CargarVector (Partido[] vectorP, Scanner in, int T){
        int i;

        for(i=0;i<T;i++){
            Partido p=new Partido(); //inicializamos e instanciamos

            System.out.println("Ingrese el local ");
            p.setLocal(in.next());//se puede hacer de esta manera

            System.out.println("Ingrese el visitante ");
            p.setVisitante(in.next());

            System.out.println("Ingrese goles del local ");
            p.setGolesLocal(in.nextInt());//se puede hacer de esta manera

            System.out.println("Ingrese goles del visitante ");
            p.setGolesVisitante(in.nextInt());

            vectorP[i]=p;
        }
        return vectorP;
    }
}