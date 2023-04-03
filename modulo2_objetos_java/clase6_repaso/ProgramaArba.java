import java.util.Scanner;
public class ProgramaArba {
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //no olvidar

        int i,dimf=1000;//dimf representa la cant de elementos
        Vehiculo[] vectorV = new Vehiculo[dimf]; 
        Propietario propietario;
        int x,CIT,aniov,REY;
        String nombrep, apellidop, patente, descripcion, nombree, tipo;
        double imp_basico, imp_adicional, eslora, tonelaje, valor;
       // Vehiculo automotor, embarcacion; no necesario esto, directamente cargo en la posicion del vector

        System.out.println("--------------------------------");
        System.out.println("| Carga de vector de vehiculos |");
        System.out.println("--------------------------------");
        System.out.println("");
        System.out.println("");

        for(i=0;i<dimf;i++){
            System.out.println("Carga del vehiculo "+(i+1));
            System.out.println("----------------------");
            System.out.println("");

            System.out.println("CIT del propietario: ");
            CIT=in.nextInt();    
            System.out.println("nombre del propietario: ");
            nombrep=in.next();
            System.out.println("apellido del propietario: ");
            apellidop=in.next();          
            propietario=new Propietario(CIT,nombrep,apellidop);

            System.out.println("anio de fabricacion: ");
            aniov=in.nextInt();    
            System.out.println("importe basico: ");
            imp_basico=in.nextDouble();    

            System.out.println("ingrese '1' para automotor, u otro numero para embarcacion: ");
            x=in.nextInt();
            if(x==1){
                //carga automotor
                System.out.println("patente (sin espacios): ");
                patente=in.next();
                System.out.println("importe adicional: ");
                imp_adicional=in.nextDouble();
                System.out.println("descripcion (sin espacios): ");
                descripcion=in.next();

                vectorV[i]= new Automotor (aniov, imp_basico, propietario, patente, imp_adicional, descripcion);

            }
            else{
                //carga embarcacion
                System.out.println("registro especial de yates : ");
                REY=in.nextInt();
                System.out.println("nombre de la embarcacion : ");
                nombree=in.next();
                System.out.println("tipo (lancha, velero, etc): ");
                tipo=in.next();
                System.out.println("eslora (longitud de proa a popa): ");
                eslora=in.nextDouble();
                System.out.println("tonelaje (peso): ");
                tonelaje=in.nextDouble();
                System.out.println("valor de la embarcacion: ");
                valor=in.nextDouble();
                
                vectorV[i]= new Embarcacion (aniov, imp_basico, propietario, REY, nombree, tipo, eslora, tonelaje, valor);
            }

            System.out.println("");
            System.out.println("");


        }

        System.out.println("--------------------------------");
        System.out.println("| Muestra de impuestos totales |");
        System.out.println("--------------------------------");
        System.out.println("");
        System.out.println("");

        for(i=0;i<dimf;i++){
            //vectorV[i].toString();
            System.out.println("El impuesto para el vehiculo "+(i+1)+" es de: "+ vectorV[i].CalcularSueldo());
        }

        in.close();
    }
    
}