import java.util.Scanner;
public class ProgramaEditorial {
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //no olvidar

        String apellidor,nombrer, resumen, nombre_rev, titulo;
        Responsable responsable;
        int i,dimf=1000, DNI, codigo, cant_pags, anio, cant_articulos, cant_cap, x, r, w;
        boolean bolsillo;//true para "de bolsillo"

        Ejemplar[] vectorE = new Ejemplar[dimf]; 
        
       // Vehiculo automotor, embarcacion; no necesario esto, directamente cargo en la posicion del vector

        System.out.println("---------------------------------");
        System.out.println("| Carga de vector de ejemplares |");
        System.out.println("---------------------------------");
        System.out.println("");
        System.out.println("");

        for(i=0;i<dimf;i++){
            System.out.println("");
            System.out.println("Carga del responsable "+(i+1));
            System.out.println("----------------------");
            System.out.println("");

            System.out.println("DNI del propietario: ");
            DNI=in.nextInt();    
            System.out.println("nombre del propietario: ");
            nombrer=in.next();
            System.out.println("apellido del propietario: ");
            apellidor=in.next();          
            responsable=new Responsable(DNI,nombrer,apellidor);

            System.out.println("");
            System.out.println("Carga del ejemplar "+(i+1));
            System.out.println("----------------------");
            System.out.println("");
            
            System.out.println("codigo: ");
            codigo=in.nextInt();
            System.out.println("cantidad de paginas: ");
            cant_pags=in.nextInt(); 
            System.out.println("resumen (sin espacios): ");
            resumen=in.next();   
    
            System.out.println("ingrese '1' para revista, u otro numero para libro: ");
            x=in.nextInt();
            if(x==1){
                //carga revista
                System.out.println("nombre (sin espacios): ");
                nombre_rev=in.next();
                System.out.println("cantidad de articulos: ");
                cant_articulos=in.nextInt();

                vectorE[i]= new Revista (codigo, cant_pags, resumen, responsable, nombrer, cant_articulos);

            }
            else{
                //carga Libro
                System.out.println("titulo (sin espacios): ");
                titulo=in.next();
                System.out.println("cantidad de capitulos : ");
                cant_cap=in.nextInt();
                System.out.println("de bolsillo? (ingrese 1 para decir que si, u otro numero para no):");
                r=in.nextInt();
                if(r==1)
                    bolsillo=true;
                else
                    bolsillo=false;
                    
                vectorE[i]= new Libro (codigo, cant_pags, resumen, responsable, titulo, cant_cap, bolsillo);
            }
            
            System.out.println("Esta publicado? (ingrese 1 para decir que si, u otro numero para no):");
            w=in.nextInt();
            if(w==1){
                System.out.println("anio de publicacion: ");
                anio=in.nextInt();  
                vectorE[i].publicar(anio);
            }
            

            System.out.println("");
            System.out.println("");

            //me faltó preguntar si quiere seguir cargando ejemplares
        }

        System.out.println("-------------------------");
        System.out.println("| Muestra de ejemplares |");
        System.out.println("-------------------------");
        System.out.println("");
        System.out.println("");

        for(i=0;i<dimf;i++){
            System.out.println(vectorE[i].toString());
        }
        //tmb podría haber mostrado todos los ejemplares sin publicar, guardar en un boolean si se los publicó, y al final de la carga de datos volver a  mostrar solo los publicados
        in.close();
    }
    
}