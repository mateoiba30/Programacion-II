import java.util.function.DoubleSupplier;

public class Automotor extends Vehiculo {
    private String patente; 
    private double imp_adicional;
    private String descripcion;
    
    public Automotor (int anio, double imp_basico, Propietario propietario, String patente, double imp_adicional, String descripcion){
        super( anio,  imp_basico,  propietario);
        this.patente=patente;
        this.imp_adicional=imp_adicional;//this.setGoles(goles)
        this.descripcion=descripcion;
    } 
 
    public Automotor(){
     
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public double getImp_adicional() {
        return imp_adicional;
    }

    public void setImp_adicional(double imp_adicional) {
        this.imp_adicional = imp_adicional;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double CalcularSueldo(){
        double imp_total;

        imp_total=getImp_basico()+imp_adicional;

        return imp_total;
    }
}