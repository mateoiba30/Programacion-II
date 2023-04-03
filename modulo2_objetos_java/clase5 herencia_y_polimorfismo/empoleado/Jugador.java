
public class Jugador extends Empleado {
    private int partidos; 
    private int goles;
    
    public Jugador (String nombre, double sueldo, int edad, int DNI, int partidos, int goles){
        super( nombre,  sueldo,  edad, DNI);
        this.partidos=partidos;
        this.goles=goles;//this.setGoles(goles)
    }
 
    public Jugador(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public double CalcularSueldo(){
        double promediogoles=(double)goles/partidos;
        if(promediogoles>0.5)
            setSueldo(getSueldo()*2);
        return getSueldo();
    }
}