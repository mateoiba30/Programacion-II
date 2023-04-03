import java.util.Scanner;
public class  OperarFlotadeMicros{
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); 
        FlotadeMicros flota=new FlotadeMicros();
        String patente="",destino="";
        Micros micro;

        System.out.println("Ingrese una patente (ZZZ000 para finalizar): ");
        patente=in.next();
        while((!flota.FlotaCompleta())&&(!patente.equals("ZZZ000"))){
            
            micro=new Micros();
            LiberarMicro(micro);

            micro.setPatente(patente);            //cargar un micro
            System.out.println("ingrese destino: ");
            micro.setDestino(in.next());
            System.out.println("ingrese la hora de salida: ");
            micro.setHora_salida(in.next());

            flota.AgregarMicro(micro); //agregamos el micro

            if(!flota.FlotaCompleta()){
                System.out.println("Ingrese una patente (ZZZ000 para finalizar): ");//repetimos bucle
                patente=in.next();
            }
            else
                System.out.println("flota completa");
        }

        //flota.MostrarFlota();

        System.out.println("Ingrese una patente para eliminar el micro: ");
        patente=in.next();
        if(flota.buscarMicroPatente(patente)!=null){
            flota.EliminarMicro(patente);
            System.out.println("micro eliminado");
        }
        else
            System.out.println("patente inexistente");



        System.out.println("Ingrese un destino para buscar un micro: ");
        destino=in.next();
        if(flota.buscarMicroDestino(destino)!=null){
            System.out.println("Hay un micro de patente: "+flota.buscarMicroDestino(destino).getPatente()+", con hora de salida: "+flota.buscarMicroDestino(destino).getHora_salida());
        }
        else
            System.out.println("No hay un micro hacia ese destino");



        in.close();
    }

    public static void LiberarMicro(Micros micro){
        int i;
        for(i=0;i<20;i++){
            micro.LiberarAsiento(i);
        }
    }
}