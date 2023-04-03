import java.util.Scanner;
public class  OperarMicros{//asiento tiene el valor del índice del vector
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN
        Micros micro;
        int asiento;


        micro= new Micros("ABC123", "Mar del Plata", "5:00am");
        LiberarMicro(micro);

        System.out.println("ingrese un asiento a ocupar (-1 para finalizar)");
        asiento=in.nextInt();
        while((!micro.MicroLLeno())&&(asiento!=-1)){
            if (micro.AsientoValido(asiento)){
                micro.OcuparAsiento(asiento);
                System.out.println("operacion exitosa");
            }
            else{
                System.out.println("asiento ocupado o inexistente, el primer asiento libre es: "+(micro.PrimerAsientoLibre()));
            }
            System.out.println("ingrese otro asiento a ocupar (-1 para finalizar)");
            asiento=in.nextInt();
        }

        System.out.println("carga de datos finalizada ---------------------");
        System.out.println("La cantidad de asientos ocupados del micro es de: "+(micro.CantAsientosOcupados()));

        in.close();
    }

    public static void LiberarMicro(Micros micro){
        int i;
        for(i=0;i<20;i++){
            micro.LiberarAsiento(i);
        }
    }
}