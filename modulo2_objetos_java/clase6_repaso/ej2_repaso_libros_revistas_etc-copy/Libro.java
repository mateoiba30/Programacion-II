public class Libro extends Ejemplar {
    private String titulo;
    private int cant_cap;
    private boolean bolsillo;//verdadero si es de bolsillo
    
    public Libro (int codigo, int cant_pags, String resumen, Responsable responsable, String titulo, int cant_cap, boolean bolsillo){
        super( codigo, cant_pags, resumen, responsable);
        this.titulo=titulo;
        this.cant_cap=cant_cap;
        this.bolsillo=bolsillo;
    }
    public Libro(){
     
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getCant_cap() {
        return cant_cap;
    }

    public void setCant_cap(int cant_cap) {
        this.cant_cap = cant_cap;
    }

    public boolean getBolsillo() {
        return bolsillo;
    }

    public void setBolsillo(boolean bolsillo) {
        this.bolsillo = bolsillo;
    }
    
        public String toString(){
        return "codigo: "+getCodigo()+", titulo: "+titulo+", nombre responsable: "+getResponsable().getNombre();
            
    }
        public String modificarTitulo(){
        if(bolsillo)
            titulo=titulo+" - De Bolsillo";
        else
            titulo=titulo+" - No de Bolsillo";
        return titulo;
        
    }
    
    public void publicar (int anio){
        titulo=modificarTitulo();
        setAnio(anio);
    }
}
