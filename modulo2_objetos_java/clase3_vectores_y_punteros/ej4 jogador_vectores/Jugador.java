public class Jugador {
    private String nombre;
    private int partidos;
    private int goles;
    private int DNI;
    private int edad;

    public Jugador(String unNombre, int unDNI, int unaEdad, int unPartido, int unGol) {
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad;
        partidos = unPartido;
        goles = unGol;
    }

    public Jugador() {

    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getPartidos() {
        return partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) { // Recordar poner el void
        nombre = unNombre;
    }

    public void setPartidos(int unPartido) {
        partidos = unPartido;
    }

    public void setGoles(int unGol) {
        goles = unGol;
    }

    public String toString() { // le borramos los parametros!
        String aux;
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + ",tengo " + edad + " años, jugue " + partidos
                + " partidos e hice " + goles + " goles";
        return aux;
    }

}
