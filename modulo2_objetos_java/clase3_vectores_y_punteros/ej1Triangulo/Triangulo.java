public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno; //si no lo inicalizás toman un valor por defecto
    private String colorLinea;  //hasta acá tengo el estado

    public Triangulo(){ //el constructor, no olvidar el "()"

    }

    //y ahora los métodos
    public double getLado1() {
        return lado1;
    }
    public double getLado2() {
        return lado2;
    }
    public double getLado3() {
        return lado3;
    }
    public String getColorRelleno() {
        return colorRelleno;
    }
    public String getColorLinea() {
        return colorLinea;
    }

    public void setLado1(double unLado) {
        lado1=unLado;
    }
    public void setLado2(double unLado) {
        lado2=unLado;
    }
    public void setLado3(double unLado) {
        lado3=unLado;
    }
    public void setColorRelleno(String unColor) {
        colorRelleno=unColor;
    }
    public void setColorLinea(String unColor) {
        colorLinea=unColor;
    }

    public double getArea(){
        double s=(lado1+lado2+lado3)/2.0;
        double r=Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));  
        return r;
    }

    public double getPerimetro(){
        double p=lado1+lado2+lado3;
        return p;
    }
}
