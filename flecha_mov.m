function [cfondo,xfinal,yfinal] = flecha_mov(fondo,teta)
longf=80;  %longitud de la flecha
%---Captura las dimensiones del tablero de juego
    [hf,wf]= size(fondo(:,:,1)); 
%--- Borra la anterior flecha, con los colores del fondo CMY
    fondo(430:hf,170:330,1)=78;
    fondo(430:hf,170:330,2)=116;
    fondo(430:hf,170:330,3)=127;
%---Dibuja la flecha que indica la dirección de salida de la burbuja
    for hip=1:longf 
        xf=hip*cos(teta); %posición x parcial para dibujar flecha
        yf=hip*sin(teta); %posición y parcial para dibujar flecha
        if(teta<0) %se invierte los valores de x y y, cuando el movimiento 
            %es en lado izquierdo del eje
            xf= -xf;
            yf= -yf;
        end
        xf=round(xf)+wf/2; %se redondea la posición al entero más cercano,
        % para pintar ese pixel 
        yf=hf-round(yf);
        fondo(yf,xf-1:xf+1,1)=192; %se pinta la componente C
        fondo(yf,xf-1:xf+1,2)=192; %se pinta la componente M
        fondo(yf,xf-1:xf+1,3)=192; %se pinta la componente Y
        
    end
    
    cfondo=fondo; %Se retorna el tablero resultante 
    xfinal= xf; %Posicion x de la punta de la flecha
    yfinal= yf; %Posicion y de la punta de la flecha
end

