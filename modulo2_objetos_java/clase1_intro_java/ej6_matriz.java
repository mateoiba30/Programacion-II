import java.util.Scanner;  //informo que voy a usar scanner
public class ej6_matriz {  //declaro la clase


    public static void main(String[] args) { //metodo de la clase     
        Scanner in = new Scanner(System.in);   //abro scan PARA LEER, NO PARA ESCRIBIR

        int [][]matriz=new int[10][10];
        int []vector=new int[10];
        int i,j,numero=2,x;
 
        for(i=0;i<10;i++){
            for(j=0;j<10;j++){  
                if(j==0 && i==0)//el dobel == es para pregunta
                    matriz[0][0]=0;
                else{
                    matriz[i][j]=numero;
                    numero=numero+2;
                }
                vector[i]=vector[i]+matriz[i][j];  

                }        
            }
        
        ImprimirMatriz(matriz);
        System.out.println("La suma de los elementos dentro del rango es de: "+ (SumaMatriz(matriz)) );
        System.out.println("Ingrese un numero a buscar: ");
        x=in.nextInt();
        BuscarMatriz(matriz, x);

        in.close();  //cierro scan
        }

        public static void ImprimirMatriz (int [][]matriz){
            int i,j;

            for(i=0;i<10;i++){
                for(j=0;j<10;j++){  
                    System.out.print("  "+matriz[i][j]); 
                    } 
                System.out.println();      
                }

        }

        public static int SumaMatriz (int [][]matriz){
            int i,j,suma=0;
            

            for(i=0;i<10;i++){
                for(j=0;j<10;j++){  
                    
                    if((i>=2 && i<=9)||(j>=0 && i<=3))
                      suma=suma+matriz[i][j];

                    }    
                }

        return suma;       
        }

        public static void BuscarMatriz (int [][]matriz, int numero){
            int i=0,j=0;
            boolean termino=false;
            

            do{
                do{              
                    if(matriz[i][j]==numero){
                      System.out.println("posicion encontrada: ["+(i+1)+"]["+(j+1)+"]");
                      termino=true;
                      if(matriz[i][j]>numero)//optimizacion
                        termino=true;
                    }
                    j++;
                    }while(j<=9 && termino!=true);  
                i++; 
                j=0;//NO OLVIDAR
                }while(i<=9 && termino!=true);

            if(termino==false)//no poner False
              System.out.println("no se encontro el dato");    
        }

   }
