public class Propietario {
    private int CIT;
    private String nombre;
    private String apellido;

    
    public Propietario(int CIT, String nombre, String apellido){
        this.CIT = CIT;
        this.nombre = nombre;
        this.apellido = apellido; 
    }
    
    public Propietario(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public int getCIT() {
        return CIT;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setCIT(int CIT) {
        this.CIT=CIT;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
       
    
}