abstract class Solicitud
{
    private String nro_de_gestion;
    private String fecha_solicitud;
    private double ingresos_mensuales;
    private int integrantes;
    private String region;
    private Persona persona;


    public Solicitud(String nro_de_gestion, String fecha_solicitud, double ingresos_mensuales, int integrantes, String region, Persona persona) {
        this.nro_de_gestion=nro_de_gestion;
        this.fecha_solicitud=fecha_solicitud;
        this.ingresos_mensuales=ingresos_mensuales;
        this.integrantes=integrantes;
        this.region=region;
        this.persona=persona;
    }
    Solicitud(){
        
    }
    
    public String getNro_de_gestion() {
        return nro_de_gestion;
    }
    public void setNro_de_gestion(String nro_de_gestion) {
        this.nro_de_gestion=nro_de_gestion;
    }
    
    public String getFecha_solicitud() {
        return fecha_solicitud;
    }
    public void setFecha_solicitud(String fecha_solicitud) {
        this.fecha_solicitud=fecha_solicitud;
    }

    
    public double getIngresos_mensuales() {
        return ingresos_mensuales;
    }
    public void setIngresos_mensuales(double ingresos_mensuales) {
        this.ingresos_mensuales=ingresos_mensuales;
    }

    public int getIntegrantes() {
        return integrantes;
    }    
    public void setIntegrantes(int integrantes) {
        this.integrantes=integrantes;
    }
    
    public String getRegion() {
        return region;
    }
    public void setRegion(String region) {
        this.region=region;
    }
    
    public Persona getPersona() {
        return persona;
    }
    public void setPersona(Persona persona) {
        this.persona=persona;
    }
    
    abstract boolean AccedeAlSubcidio();
    
    abstract double CalcularTarifa();
    
    public String tosstring(){
        String aux;
        
        aux="numero de gestion: "+nro_de_gestion+" fecha de solicitud: "+fecha_solicitud+" ingresos mensuales: "+ingresos_mensuales+" integrantes familiares: "+integrantes+" region: "+region+" cuit de la persona: "+persona.getCuit()+" nombre de la persona: "+persona.getNombre()+" apellido de la persona: "+persona.getApellido() ; 
        
        return aux;
    }
    
}
