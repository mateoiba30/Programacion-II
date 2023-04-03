

public class Entrenador {
    private String nombre;
    private double sueldo;
    private int campeonatos; 
    
    public Entrenador(String nombre, double sueldo, int campeonatos){
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.campeonatos = campeonatos; 
    }
    
    public Entrenador(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public double getSueldo() {
        return sueldo;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setSueldo(double unSueldo) {
        sueldo=unSueldo;
    }

    public void setCampeonatos(int cantCampeonatos) {
        campeonatos = cantCampeonatos;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public double calcularSueldoACobrar (){
        double x=0;

        if (campeonatos>0)
            if(campeonatos<5)
                x=5000;
            else
                if (campeonatos<10)
                    x=30000;
                    else 
                        x=50000;

        x=x+sueldo;
        return x;
    }
    
    
    
    
}