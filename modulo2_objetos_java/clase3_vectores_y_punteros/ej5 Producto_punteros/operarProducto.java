import java.util.Scanner;
public class operarProducto {
    final static int DimF=2;
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);  
        Producto[] vector=new Producto[DimF];
        int opcion=0;
        Puntero puntero= new Puntero();
        puntero.setDimL(-1);
    

        while(opcion!=4){
            System.out.println("Ingrese 1 para cargar datos, 2 para verlos, 3 para modificar el stock, 4 para finalizar");
            opcion=in.nextInt();

            if(opcion==1){
                System.out.println("CARGA DE PRODUCTOS"); //podemos hacer que cargue solo un elemento, entonces DimL+=1 y no hace falta crear un puntero
                System.out.println("---------------------");
                vector=CargarVector(vector,in,puntero);
            }
            else
                if(opcion==2){
                    System.out.println("LECTURA DE PRODUCTOS");
                    System.out.println("---------------------");
                    LeerVector(vector,puntero);
                }
                else 
                    if (opcion==3){
                        System.out.println("MODIFICACION DE PRODUCTOS");
                        System.out.println("---------------------");
                        ModificarStock(vector, in, puntero); 
                    }                   
                    else
                        System.out.println("Ingrese 1, 2, 3 o 4 !!!");


            System.out.println("-----------------------------------");
        }
        System.out.println("Programa finalizado");
        in.close();
    }

    public static Producto[] CargarVector(Producto[] vector, Scanner in, Puntero puntero) {
        int aux,i=0;
        Producto producto=new Producto();

        System.out.println("Ingrese el codigo: (0 para finalizar) ");
        aux=in.nextInt();
        producto.setCod(aux);

        while((aux!=0)&&(i<DimF)){
            System.out.println("Ingrese el nombre: ");
            producto.setNombre(in.next());
            System.out.println("Ingrese la descripcion: ");
            producto.setDescripcion(in.next());
            System.out.println("Ingrese las marca: ");
            producto.setMarca(in.next());
            System.out.println("Ingrese el stock: ");
            producto.setStock(in.nextInt());
            vector[puntero.getDimL()+1]=producto;//puede ser que vuelva a querer cargar la posicion cero
            puntero.setDimL(puntero.getDimL()+1);//la otra forma de que devuelva un integer es que llegue un puetro a un integer y se modifique al contenido que apunta

            System.out.println("---");

            producto=new Producto();
            System.out.println("Ingrese el codigo: (0 para finalizar) ");
            aux=in.nextInt();
            producto.setCod(aux);

            i++;

        }
        if(i==DimF)
            System.out.println("Vector al maximo");

        return vector;

    }

    public static void LeerVector(Producto[] vector, Puntero puntero) {

        System.out.println("COD | NOMBRE | MARCA | STOCK | DESCRIPCION");
        for(int i=0; i<puntero.getDimL()+1; i++)
            System.out.println(vector[i].getCod()+" | "+vector[i].getNombre()+" | "+vector[i].getMarca()+" | "+vector[i].getStock()+" | "+vector[i].getDescripcion());
   
    }

    public static Producto[] ModificarStock(Producto[] vector, Scanner in, Puntero puntero){
        int aumento, codigo, posicion;

        System.out.println("Ingrese el codigo a buscar ");
        codigo=in.nextInt();
        posicion=EncontrarPosicion(vector, codigo, puntero);
        if(posicion>=0){
            System.out.println("Ingrese en cuanto quiere aumentar el stock: ");
            aumento=in.nextInt();
            vector[posicion].setStock( vector[posicion].getStock()+aumento );
        }
        else 
            System.out.println("Codigo no encontrado");
        return vector;

    }

    public static int EncontrarPosicion(Producto[] vector, int codigo, Puntero puntero){
        int pos=-1, i=0;

        while((i<=puntero.getDimL())&&(pos==-1)){
            if(vector[i].getCod()==codigo)
                pos=i;
            i++;
        }

        return pos;
    }


}