import java.util.Scanner;
public class operarProductoVERSION2 {
    final static int DimF=2;
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);  
        Producto[] vector=new Producto[DimF];
        int opcion=0,dimL=-1;//dimL representa la ultima posicion llenada

        /*  podría hacer esto si nombre no fuera private
        Producto producto=new Producto();
        producto.nombre="mateo";
        System.out.println(producto.getNombre());*/
    

        while(opcion!=4){ //PODRÍAMOS HACER UN SWITCH
            System.out.println("Ingrese 1 para cargar datos, 2 para verlos, 3 para modificar el stock, 4 para finalizar");
            opcion=in.nextInt();

            if(opcion==1){
                if(dimL==DimF)
                    System.out.println("Vector al maximo");
                else{      
                    dimL+=1;         
                    System.out.println("CARGA DE PRODUCTOS");
                    vector[dimL]=CargarProducto(in);//conviene más hacer el cargarProducto que el CargarVector      
                }
            }
            else
                if(opcion==2){
                    System.out.println("LECTURA DE PRODUCTOS");
                    LeerVector(vector,dimL);
                }
                else 
                    if (opcion==3){
                        System.out.println("MODIFICACION DE PRODUCTOS");
                        ModificarStock(vector, in, dimL); 
                    }                   
                    else
                        if(opcion!=4)
                            System.out.println("Ingrese 1, 2, 3 o 4 !!!");


            System.out.println("-----------------------------------");
        }
        System.out.println("Programa finalizado");
        in.close();
    }

    public static Producto CargarProducto(Scanner in) {
        Producto producto=new Producto();//solo llamé al constructor vacío

        System.out.println("Ingrese el codigo: ");
        producto.setCod(in.nextInt());
        System.out.println("Ingrese el nombre: ");
        producto.setNombre(in.nextLine());
        System.out.println("Ingrese la descripcion: ");
        producto.setDescripcion(in.nextLine());
        System.out.println("Ingrese las marca: ");
        producto.setMarca(in.nextLine());
        System.out.println("Ingrese el stock: ");
        producto.setStock(in.nextInt());

        return producto;
    }

    public static void LeerVector(Producto[] vector,int dimL) {

        System.out.println("COD | NOMBRE | MARCA | STOCK | DESCRIPCION");
        for(int i=0; i<dimL+1; i++)//DIML+1 REPRESENTA LA CANTIDAD DE DATOS!!!!   
            System.out.println(vector[i].getCod()+" | "+vector[i].getNombre()+" | "+vector[i].getMarca()+" | "+vector[i].getStock()+" | "+vector[i].getDescripcion());
   
    }

    public static Producto[] ModificarStock(Producto[] vector, Scanner in, int dimL){
        int aumento, codigo, posicion;

        System.out.println("Ingrese el codigo a buscar ");
        codigo=in.nextInt();
        posicion=EncontrarPosicion(vector, codigo, dimL);
        if(posicion>=0){
            System.out.println("Ingrese en cuanto quiere aumentar el stock: ");
            aumento=in.nextInt();
            vector[posicion].setStock( vector[posicion].getStock()+aumento );
        }
        else 
            System.out.println("Codigo no encontrado");
        return vector;

    }

    public static int EncontrarPosicion(Producto[] vector, int codigo, int dimL){
        int pos=-1, i=0;

        while((i<=dimL)&&(pos==-1)){//es menor o igual, si no no busca el último elemento
            if(vector[i].getCod()==codigo)
                pos=i;
            i++;
        }

        return pos;
    }


}