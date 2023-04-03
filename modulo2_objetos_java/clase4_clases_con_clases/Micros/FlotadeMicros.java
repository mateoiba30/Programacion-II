
public class FlotadeMicros {
    //final static int dimf=2;
    private int diml=-1;//diml que represente el último indice llenado
    private Micros[] vectorM = new Micros[15];//si dimf vale 15, entonces diml llega hasta 14

    public FlotadeMicros(){
    }

    public boolean FlotaCompleta(){
        boolean respuesta=false;
        if(diml==14)
            respuesta=true;
        return respuesta;

    }

    public void AgregarMicro(Micros micro){
        diml++;
        vectorM[diml]=micro;
    }

    public void EliminarMicro(String patente){
        int i=0;
        boolean seguir=true;

        while((i<diml)&&(seguir)){
            if(vectorM[i].getPatente().equals(patente)){//USAR EQUALS
                seguir=false;
                BorrarElemento(i);
            }
            i++;
        }
    }

    public void BorrarElemento(int pos){//la pos es la posicion a borrar
        int i;
        for(i=pos+1;i<=diml;i++){
            vectorM[i-1]=vectorM[i];
        }
        diml--;
        
    }

    public Micros buscarMicroPatente (String patente){
        int i=0;
        boolean seguir=true;

        while((i<=diml)&&(seguir)){//MENOR O IGUAL PORQUE DIML ES EL ULTIMO INDICE DEL VECTOR USADO
            if(vectorM[i].getPatente().equals(patente)){//USAR EQUALS
                seguir=false;
            }
            i++;//encuentres o no se aumenta el índice
        }
        if(seguir)
            return null;//forma de no devolver nada
        else
            return vectorM[i-1];

        }

        public Micros buscarMicroDestino (String destino){
            int i=0;
            boolean seguir=true;
    
            while((i<=diml)&&(seguir)){
                if(vectorM[i].getDestino().equals(destino)){//USAR EQUALS
                    seguir=false;
                }
                i++;//encuentres o no se aumenta el índice
            }
            if(seguir)
                return null;//forma de no devolver nada
            else
                return vectorM[i-1];
    
            }

            public void MostrarFlota(){
                int i;
                for(i=0;i<=diml;i++){
                    System.out.println("Micro "+(i+1)+"--> patente: "+ vectorM[i].getPatente() +" destino: "+ vectorM[i].getDestino() +" horario: "+ vectorM[i].getHora_salida());
                }
            }
    
}
