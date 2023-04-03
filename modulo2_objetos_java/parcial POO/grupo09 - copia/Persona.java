public class Persona {
    private int cuit;
    private String nombre;
    private String apellido;

    
    public Persona(int cuit, String nombre, String apellido){
        this.cuit = cuit;
        this.nombre = nombre;
        this.apellido = apellido; 
    }
    
    public Persona(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public int getCuit() {
        return cuit;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setCuit(int cuit) {
        this.cuit=cuit;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
       
    
}
