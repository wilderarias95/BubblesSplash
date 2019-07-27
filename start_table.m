function cfondo = start_table(fondo,radio)
%--------------------------------------------------------------------------
%--1. Se define el número de burbujas por fila-----------------------------
%--------------------------------------------------------------------------
    [hf,wf]=size(fondo(:,:,1)); %se obtienen las dimensiones del tablero   
    numball= (wf-radio)/(2*radio); %numero de burbujas por fila
    color=[[255 0 0];[0 255 255];[255 255 0]; [0 0 255]]; %red, cyan, yellow, blue colores de las burbujas
    yn=3*radio+1; %posicion inicial yn desde donde se inicia a rellenar el tablero
%--------------------------------------------------------------------------
%--2. Se rellena el tablero con las burbujas iniciales---------------------
%--------------------------------------------------------------------------
    
    for m=1:4   %numero de filas iniciales
        if(mod(m,2)==0)   %si es par la fila se corren las bolas +radio
            xn=radio+1; 
        else       %si es impar la fila se inicia desde el muro izquierdo
            xn =2*radio+1;    
        end
        for n=1:numball  %recorre las columnas del tablero para dibujar las burbujas
            k= randi([1 4],1,1);   %numero al azar para escoger un color
            fondo= drawball(fondo,xn,yn,radio,color(k,:)); %dibuja las burbujas
            xn=xn+2*radio; %se desplaza a la siguiente columna
        end
        yn = yn + 2*radio; %se desplaza a la siguiente fila
    end
    cfondo=fondo; %retorna el tablero con las burbujas iniciales
end

