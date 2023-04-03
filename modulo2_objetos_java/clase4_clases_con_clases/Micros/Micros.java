public class Micros {
    private String patente;
    private String destino;
    private String hora_salida;
    private Boolean[] vectorA = new Boolean[20];//verdadero para ocupado!
    //podríamos hacer una dimensión lógica como en la flota de micros

    public Micros(){

    }
    public Micros(String patente, String destino, String hora_salida){//EL CONSTRUCTOR NO LLEVA VOID?
        this.patente=patente; 
        this.destino=destino;
        this.hora_salida=hora_salida;
    }

    public String getPatente() {
        return patente;
    }
    public String getDestino() {
        return destino;
    }
    public String getHora_salida() {
        return hora_salida;
    }

    public void setPatente(String patente) {
        this.patente=patente;
    }
    public void setDestino(String destino) {
        this.destino=destino;
    }
    public void setHora_salida(String hora_salida) {
        this.hora_salida=hora_salida;
    }

    public int CantAsientosOcupados(){
        int i,cant=0;

        for(i=0;i<20;i++){
            if(vectorA[i])
              cant++;
        }

        return cant;
    }

    public Boolean MicroLLeno(){
        boolean bulean=false;

        if(CantAsientosOcupados()==20)
            bulean=true;

        return bulean;
    }

    public Boolean AsientoValido(int asiento){
        boolean valido=false;

        if((asiento<20)&&(asiento>-1)&&(!vectorA[asiento]))
            valido=true;

        return valido;
    }

    public String EstadoAsiento(int asiento){
        String estado="asiento vacio";

        if(vectorA[asiento])
            estado="asiento ocupado";

        return estado;
    }

    public void OcuparAsiento(int asiento){

        if((asiento<20)&&(asiento>-1))//no llamamos a AsientoValido porque este es un método que se fija el contenido del vector
            vectorA[asiento]=true;
    }

    public void LiberarAsiento(int asiento){

        if((asiento<20)&&(asiento>-1))
            vectorA[asiento]=false;
    }

    public int PrimerAsientoLibre(){//si devuelve -1 es que no hay asientos disponibles
        int asiento=-1,i=0;

        while((i<20)&&(asiento==-1)){

            if(!vectorA[i])
                asiento=i;

            i++;
        }
        return asiento;
    }
}
    
