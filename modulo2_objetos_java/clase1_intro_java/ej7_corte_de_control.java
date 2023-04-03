import java.util.Scanner;  //informo que voy a usar scanner
public class ej7_corte_de_control {  //declaro la clase


    public static void main(String[] args) { //metodo de la clase     
        Scanner in = new Scanner(System.in);   //abro scan PARA LEER, NO PARA ESCRIBIR
        int i, personas=0, x, max=-1;
        int []vector=new int[5];

        for(i=0;i<5;i++){
            vector[i]=0;
        }
        System.out.println("Ingrese un numero (999 para finalizar)");
        System.out.println("0: cobro de cheque 1: depósito/ extracción en cuenta 2: pago de impuestos o servicios 3: cobro de jubilación 4: cobro de planes");
        x=in.nextInt();

        while(x!=999){

            if(x<5)//por la operacion de corte
              vector[x]++;

            System.out.println("Ingrese un numero (999 para finalizar)");
            System.out.println("0: cobro de cheque 1: depósito/ extracción en cuenta 2: pago de impuestos o servicios 3: cobro de jubilación 4: cobro de planes");
            x=in.nextInt();

            personas++;
        }

        for(i=0;i<5;i++){
            System.out.println("la cantidad que se solicito la operacion "+i+" es de: "+(vector[i]));
            if(vector[i]>max)
              max=i;

        }

        System.out.println("la operacion mas solicitada es "+max);
        in.close();  //cierro scan
        }
    }