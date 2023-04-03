import java.util.Scanner;

public class operarProductos2 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in); // EL SCANNER ABRIRLO Y CERRARLO 1 VEZ EN EL MAIN
        int i;
        Producto producto = new Producto();
        System.out.println("Bienvenido al menu de compras de WaltMart! ");
        System.out.println("-Ingrese 1 para acceder a la carga de un producto: ");
        System.out.println("-Ingrese 0 para salir: ");
        i = (in.nextInt());
        while (i != 0) {
            if (i == 1)
                producto = crearProducto(in, producto); // crea prodcuto si es 1
            if (i == 2) {

                System.out.println(producto.devolverDatos()); // informa producto si es 2
                System.out.println("---------------------------------------------- ");
            }
            if (i == 3) {
                System.out.println("Ingrese un valor de stock a incrementar: ");
                System.out.println(producto.modificarstock(in.nextInt(), producto.getCodigo()));
                System.out.println("---------------------------------------------- ");
            }
            System.out.println("-Ingrese 3 para agregar stock al producto: ");
            System.out.println("-Ingrese 2 para mostrar el producto: ");
            System.out.println("-Ingrese 1 para acceder a la carga de un nuevo producto: ");
            System.out.println("-Ingrese 0 para salir: ");
            System.out.println("---------------------------------------------- ");
            i = (in.nextInt());
        }

        System.out.println("Gracias por elegirnos!");
        in.close();
    }

    public static Producto crearProducto(Scanner in, Producto producto) {
        Producto p = new Producto();
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
}