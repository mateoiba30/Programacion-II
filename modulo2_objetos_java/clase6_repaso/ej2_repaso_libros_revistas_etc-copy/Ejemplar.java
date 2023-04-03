abstract class Ejemplar
{
    private int codigo;
    private int cant_pags;
    private String resumen;
    private int anio;
    private Responsable responsable;

    public Ejemplar(int codigo, int cant_pags, String resumen, Responsable responsable) {
        this.codigo=codigo;
        this.cant_pags=cant_pags;
        this.resumen=resumen;
        this.anio=0;
        this.responsable=responsable;
    }
    Ejemplar(){
        
    }
    
    public int getCodigo() {
        return codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo=codigo;
    }
    
        public int getCant_pags() {
        return cant_pags;
    }
    public void setCant_pags(int cant_pags) {
        this.cant_pags=cant_pags;
    }

    
        public String getResumen() {
        return resumen;
    }
    public void setCodigo(String resumen) {
        this.resumen=resumen;
    }

        public int getAnio() {
        return anio;
    }
    
    public void setAnio(int anio) {
        this.anio=anio;
    }
    
    public Responsable getResponsable() {
        return responsable;
    }
    public void setResponsable(Responsable responsable) {
        this.responsable=responsable;
    }
    
   // abstract String tostring();
    
    abstract void publicar(int anio);

}
