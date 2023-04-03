import java.util.Scanner;
public class ProgramaRASE {
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //no olvidar
        
        int i,dimf=1;

        Solicitud[] vectorS = new Solicitud[dimf]; 

        System.out.println("---------------------------------");
        System.out.println("| Carga de vector de solicitudes |");
        System.out.println("---------------------------------");
        System.out.println("");
        System.out.println("");

        for(i=0;i<dimf;i++){

            System.out.println("");
            System.out.println("Carga de la solicitud "+(i+1));
            System.out.println("----------------------");
            System.out.println("");
            
            vectorS[i]=cargarAtributos(in, i);
            
            }
            

            System.out.println("");
            System.out.println("");

        
        System.out.println("--------------------------");
        System.out.println("| Muestra de solicitudes |");
        System.out.println("--------------------------");
        System.out.println("");
        System.out.println("");

        for(i=0;i<dimf;i++){
            System.out.println(vectorS[i].toString());
        }
        
        in.close();
    }
    
    public static Persona cargarPersona(Persona persona, Scanner in, int i){
         
        String nombre,apellido;
        int cuit;
        System.out.println("");
        System.out.println("Carga de la persona "+(i+1));
        System.out.println("----------------------");
        System.out.println("");

        System.out.println("CUIT del propietario: ");
        cuit=in.nextInt();    
        System.out.println("nombre de la persona: ");
        nombre=in.next();
        System.out.println("apellido de la persona: ");
        apellido=in.next();          
        persona=new Persona(cuit,nombre,apellido);

        return persona;
        
    }
    
    public static Solicitud cargarAtributos (Scanner in, int i){

                    
        //para cargar atributos de solicitud
         String nro_de_gestion;
         String fecha_solicitud;
         double ingresos_mensuales;
         int integrantes, x;
         String region;
         Persona persona;

         //para gas natural
          int nro_medidor;
          double m2_hogar;
          int cant_estufas;

        // para energia electrica
         int nis;
         int cant_electro;
         
         Solicitud solicitud;
         
            persona=new Persona();
            persona=cargarPersona(persona, in, i);
            
            System.out.println("numero: ");
            nro_de_gestion=in.next();
            System.out.println("fecha: ");
            fecha_solicitud=in.next(); 
            System.out.println("ingreso mensual: ");
            ingresos_mensuales=in.nextDouble();  
            System.out.println("integrantes de la familia: ");
            integrantes=in.nextInt();    
            System.out.println("region: ");
            region=in.next();    
    
            System.out.println("ingrese '1' para Gas Natural, u otro numero para Energia Electrica: ");
            x=in.nextInt();
            if(x==1){
                //carga gas natural
                System.out.println("numero de medidor: ");
                nro_medidor=in.nextInt();
                System.out.println("metros cuadrados del hogar: ");
                m2_hogar=in.nextDouble();
                System.out.println("cantidad de estufas: ");
                cant_estufas=in.nextInt();
                

                solicitud= new GasNatural ( nro_de_gestion, fecha_solicitud, ingresos_mensuales, integrantes, region, persona, nro_medidor, m2_hogar, cant_estufas);

            }
            else{
                //carga energia electrica
                System.out.println("nis: ");
                nis=in.nextInt();
                System.out.println("cantidad de electrodomesticos: ");
                cant_electro=in.nextInt();

                    
                solicitud= new EnergiaElectrica ( nro_de_gestion, fecha_solicitud, ingresos_mensuales, integrantes, region, persona, nis, cant_electro);
            }
            
        return solicitud;
    }

    
       
}