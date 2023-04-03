public class Revista extends Ejemplar {
    private String nombre;
    private int volumen;
    private int cant_articulos;
    
    public Revista (int codigo, int cant_pags, String resumen, Responsable responsable, String nombre, int cant_articulos){
        super( codigo, cant_pags, resumen, responsable);
        this.nombre=nombre;
        this.volumen=0;
        this.cant_articulos=cant_articulos;
    }
    public Revista(){
     
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getVolumen() {
        return volumen;
    }

    public void setVolumen(int volumen) {
        this.volumen = volumen;
    }

    public int getCant_articulos() {
        return cant_articulos;
    }

    public void setCant_articulos(int cant_articulos) {
        this.cant_articulos = cant_articulos;
    }
    
    public String toString(){
        return "nombre: "+getNombre()+", volumen: "+ getVolumen();
        
    }
    
    public void publicar(int anio){
        setAnio(anio);
        volumen=Generador.getNroVolumen();
    
    }
}