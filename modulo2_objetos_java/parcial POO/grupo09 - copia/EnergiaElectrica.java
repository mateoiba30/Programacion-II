

public class EnergiaElectrica extends Solicitud {
    private int nis;
    private int cant_electro;
    
    public EnergiaElectrica (String nro_de_gestion, String fecha_solicitud, double ingresos_mensuales, int integrantes, String region, Persona persona, int nis, int cant_electro){
        super( nro_de_gestion,  fecha_solicitud,  ingresos_mensuales,  integrantes,  region,  persona);
        this.nis=nis;
        this.cant_electro=cant_electro;
    }
    public EnergiaElectrica(){
     
    }

    public int getNis() {
        return nis;
    }
    public void setNis(int nis) {
        this.nis = nis;
    }
  
    public int getCant_electro() {
        return cant_electro;}
    public void setCant_electro(int cant_electro) {
        this.cant_electro = cant_electro;
    }
    
    public boolean AccedeAlSubcidio(){
        boolean accede=false;
        if( (getIngresos_mensuales()/(getIntegrantes()) < getIngresos_mensuales()*0.45) && (TarifasNacionalesPorRegion.puedeAccederAlSubsidio( getIngresos_mensuales(), getRegion() )) ){
            accede=true;
        }
        
        return accede;
    }
    
    public double CalcularTarifa(){
        double tarifa=0;
        
        if (( AccedeAlSubcidio() )){          
            
            if( getIngresos_mensuales()>300000){
                tarifa=500*cant_electro;
                
            }
            else
                if( getIngresos_mensuales()>150000){   
                    tarifa=100*(cant_electro/2.0)+getIngresos_mensuales()*0.02;
                }
                else
                    tarifa=getIngresos_mensuales()*0.015+400*getIntegrantes();
                
            
        }
        else
            tarifa=getIngresos_mensuales()*0.05;
        
        return tarifa;
        
    }
    
        public String toString(){
        String aux, x;
        double tarifa=CalcularTarifa();
        
        if(AccedeAlSubcidio()){
            x=" accedio al subsidio";
            
        }
        else
            x=" no accedio al subsidio";
        
        
        aux="numero de gestion: "+getNro_de_gestion()+" fecha de solicitud: "+getFecha_solicitud()+" ingresos mensuales: "+getIngresos_mensuales()+" integrantes familiares: "+getIntegrantes()+" region: "+getRegion()+" cuit de la persona: "+getPersona().getCuit()+" nombre de la persona: "+getPersona().getNombre()+" apellido de la persona: "+getPersona().getApellido() + "nis: "+nis+" cantidad electrodomesticos: "+cant_electro+" tarifa: "+tarifa+x;
        
        return aux;
    }
    
    
}