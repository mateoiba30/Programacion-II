import java.util.Scanner;

public class operarProductos2VERSIONFINAL {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in); // EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN
        int i, L = 0, T = 2;
        Producto2 [] VectorP = new Producto2 [T];
        System.out.println("Bienvenido al menu de compras de WaltMart! ");
        System.out.println("-Ingrese 1 para acceder a la carga de un producto: ");
        System.out.println("-Ingrese 0 para salir: ");
        i = (in.nextInt());
        while (i != 0) {
            if ((i == 1) && (L < T)) {
                VectorP[L] = crearProducto(in); // crea producto si es 1
                L++; // por que la diml no se puede comunicar despues
            } else if (i == 2) {
                buscarDato(in, VectorP, T);

            } else if (i == 3) {
                agregardatosVector(in, VectorP, T);
            } else
                System.out.println("El numero no es valido o la compra esta llena.");
            System.out.println("-Ingrese 3 para agregar stock a un producto determinado: ");
            System.out.println("-Ingrese 2 para mostrar un producto: ");
            System.out.println("-Ingrese 1 para acceder a la carga de un nuevo producto: ");
            System.out.println("-Ingrese 0 para salir: ");
            System.out.println("---------------------------------------------- ");
            i = (in.nextInt());
        }

        System.out.println("Gracias por elegirnos!");
        in.close();
    }

    public static Producto2 crearProducto(Scanner in) {   //Carga el vector
        Producto2 p = new Producto2();
        {
            System.out.println("Ingrese el nombre del producto: ");
            p.setNombre(in.next());
            System.out.println("Ingrese el codigo del producto: ");
            p.setCodigo(in.nextInt());
            System.out.println("Ingrese la marca del producto: ");
            p.setMarca(in.next());
            System.out.println("Ingrese la descripcion del producto: ");
            p.setDecripcion(in.next());
            System.out.println("Ingrese el stock disponible del producto: ");
            p.setStock(in.nextInt());
        }
        return p;
    }

    public static void agregardatosVector(Scanner in, Producto2 [] VectorP, int T) { //Agrega Stock al vector
        int codigoB;
        int j;
        System.out.println("Ingrese un codigo de producto a buscar: ");
        codigoB = in.nextInt();
        j = 0;
        while ((VectorP[j].getCodigo() != codigoB) && (j < T-1))
            j++;
        if (VectorP[j].getCodigo() == codigoB) {
            System.out.println("Ingrese un valor de stock a incrementar: ");
            System.out.println(VectorP[j].modificarstock(in.nextInt(), VectorP[j].getCodigo()));
        } else {
            System.out.println("---------------------------------------------- ");
            System.out.println("El producto no se encuentra");

        }

        System.out.println("---------------------------------------------- ");
        return;

    }

    public static void buscarDato(Scanner in, Producto2 [] VectorP, int T) {  //Busca un dato en el vector
        int codigoB;
        int j;
        System.out.println("Ingrese un codigo de producto a buscar: ");
        codigoB = in.nextInt();
        j = 0;
        while ((VectorP[j].getCodigo() != codigoB) && (j < T - 1)) { 
            j++;
        }
        if (VectorP[j].getCodigo() == codigoB) {
            System.out.println(VectorP[j].devolverDatos());
        } else {
            System.out.println("---------------------------------------------- ");
            System.out.println("El producto no se encuentra");
        }
        System.out.println("---------------------------------------------- ");
        return;
    }
}