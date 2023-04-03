abstract class Empleado {
    private String nombre;
    private int DNI;
    private int edad; 
    private double sueldo;
    
    public Empleado(String nombre, double sueldo, int edad, int DNI){
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.edad = edad; 
        this.DNI=DNI;
    }
    
    public Empleado(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public double getSueldo() {
        return sueldo;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDNI(){
        return DNI;
    }

    public void setSueldo(double unSueldo) {
        sueldo=unSueldo;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    abstract double CalcularSueldo();
       
    
}