

public class Entrenador extends Empleado {
    private int campeonatos; 
    
    public Entrenador (String nombre, double sueldo, int edad, int DNI, int campeonatos){
        super( nombre,  sueldo,  edad, DNI);//llama al constructor de la csuper clase
        this.campeonatos=campeonatos;
    }
 
    public Entrenador(){//el constructor no parametrizado no es necesario si ya está el constructor parametrizado
     
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int cantCampeonatos) {
        campeonatos = cantCampeonatos;
    }

        
    public double CalcularSueldo (){
        double x=0;

        if (campeonatos>0)
            if(campeonatos<5)
                x=5000;
            else
                if (campeonatos<10)
                    x=30000;
                    else 
                        x=50000;

        x=x+getSueldo();
        return x;
    }
    
}