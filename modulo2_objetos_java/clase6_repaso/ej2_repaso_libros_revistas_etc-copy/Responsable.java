public class Responsable {
    private int DNI;
    private String nombre;
    private String apellido;

    
    public Responsable(int DNI, String nombre, String apellido){
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellido; 
    }
    
    public Responsable(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public int getDNI() {
        return DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setDNI(int DNI) {
        this.DNI=DNI;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
       
    
}
