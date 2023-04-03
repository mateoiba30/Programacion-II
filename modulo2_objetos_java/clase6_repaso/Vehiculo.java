abstract class Vehiculo { 
    private int anio;
    private double imp_basico;
    private Propietario propietario;

    
    public Vehiculo(int anio, double imp_basico, Propietario propietario){
        this.anio = anio;
        this.imp_basico = imp_basico;
        this.propietario = propietario; 
    }
    
    public Vehiculo(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public int getAnio() {
        return anio;
    }

    public double getImp_basico() {
        return imp_basico;
    }

    public Propietario getPropietario() {
        return propietario;
    }

    public void setAnio(int anio) {
        this.anio=anio;
    }

    public void setImp_basico(double imp_basico) {
        this.imp_basico = imp_basico;
    }

    public void setPropietario(Propietario propietario) {
        this.propietario = propietario;
    }
    abstract double CalcularSueldo();
       
    
}