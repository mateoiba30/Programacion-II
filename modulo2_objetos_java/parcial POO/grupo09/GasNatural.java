
public class GasNatural extends Solicitud {
    private int nro_medidor;
    private double m2_hogar;
    private int cant_estufas;
    
    public GasNatural (String nro_de_gestion, String fecha_solicitud, double ingresos_mensuales, int integrantes, String region, Persona persona, int nro_medidor, double m2_hogar, int cant_estufas){
        super( nro_de_gestion,  fecha_solicitud,  ingresos_mensuales,  integrantes,  region,  persona);
        this.nro_medidor=nro_medidor;
        this.m2_hogar=m2_hogar;
        this.cant_estufas=cant_estufas;
    }
    public GasNatural(){
     
    }

    public int getNro_medidor() {
        return nro_medidor;
    }
    public void setNro_medidor(int nro_medidor) {
        this.nro_medidor = nro_medidor;
    }

    
    public double getM2_hogar() {
        return m2_hogar;
    }
    public void setM2_hogar(double m2_hogar) {
        this.m2_hogar = m2_hogar;
    }

    
    public int getCant_estufas() {
        return cant_estufas;
    }
    public void setCant_estufas(int cant_estufas) {
        this.cant_estufas = cant_estufas;
    }

    public boolean AccedeAlSubcidio(){
        boolean accede=false;
        if( (getIngresos_mensuales()/(getIntegrantes()*cant_estufas) < getIngresos_mensuales()*0.4) && (TarifasNacionalesPorRegion.puedeAccederAlSubsidio( getIngresos_mensuales(), getRegion() )) ){
            accede=true;
        }
        
        return accede;
    }
    
    public double CalcularTarifa(){
        double tarifa=0;
        if ( AccedeAlSubcidio() ){
            if( getIngresos_mensuales()>300000){
                tarifa=250*(m2_hogar/2.0)+(750*cant_estufas);
                
            }
            else
                if( getIngresos_mensuales()>150000){   
                    tarifa=100*(m2_hogar/3.0)+500*cant_estufas;
                }
                else
                    tarifa=1000+getIngresos_mensuales()*0.02;
        }
        else
           tarifa=getIngresos_mensuales()*0.05;

                
        return tarifa;
    
    }
    

    public String tostring(){
        String aux, x;
        double tarifa=CalcularTarifa();
        
        if(AccedeAlSubcidio()){
            x=" accedio al subsidio";
            
        }
        else
            x=" no accedio al subsidio";
        
        aux=tosstring() + "numero de medidor: "+nro_medidor+" metros cuadrados del hogar: "+m2_hogar+" cantidad de estufas/calefactores: "+cant_estufas+" tarifa: "+tarifa+x;
        
        return aux;
    }
}
