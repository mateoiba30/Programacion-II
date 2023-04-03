
public class Embarcacion extends Vehiculo {
    private int REY; 
    private String nombre;
    private String tipo;
    private double eslora;
    private double tonelaje;
    private double valor;
    
    public Embarcacion (int anio, double imp_basico, Propietario propietario, int REY, String nombre, String tipo, double eslora, double tonelaje, double valor){
        super( anio,  imp_basico,  propietario);
        this.REY=REY;
        this.nombre=nombre;//this.setGoles(goles)
        this.tipo=tipo;
        this.eslora=eslora;
        this.tonelaje=tonelaje;
        this.valor=valor;
    }
 
    public Embarcacion(){
     
    }

    public int getREY() {
        return REY;
    }

    public void setREY(int REY) {
        this.REY = REY;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getEslora() {
        return eslora;
    }

    public void setEslora(double eslora) {
        this.eslora = eslora;
    }

    public double getTonelaje() {
        return tonelaje;
    }

    public void setTonelaje(double tonelaje) {
        this.tonelaje = tonelaje;
    }

    public double getValor() {
        return valor;
    }
 
    public void setValor(double valor) {
        this.valor = valor;
    }

    public double CalcularSueldo(){
        double imp_total;

        if(valor<=6000)
            valor=valor*0.04;
        else
            if (valor<=180000)
                valor=valor*0.02;
            else 
                valor=valor*0.05;//modifico valor, total no me lo devuelve modificado

        imp_total=getImp_basico()+valor;
        return imp_total;
    }
}
