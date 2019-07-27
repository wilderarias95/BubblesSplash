function fondo= drawball(fondo,cx,cy,radio,color)
%--------------------------------------------------------------------------
%--1. dibuja una bola en una posición indicada del tablero-----------------
%-------------------------------------------------------------------------- 
    for i=(cy-radio):(cy+radio) %se desplaza desde la posición superior a la inferior de la burbuja 
        for j=(cx-radio):(cx+radio) %se desplaza desde la posición izquierda a la derecha de la burbuja
            r = sqrt((j-cx)^2+(i-cy)^2); %ecuación de la circunferencia
%Recorre toda la circunferencia y pinta en las tres capas, RGB.
            if(r<radio)
                fondo(i,j,1) = color(1); %componente rojo de la burbuja
                fondo(i,j,2) = color(2); %componente verde de la burbuja
                fondo(i,j,3) = color(3); %componente azul de la burbuja 
            end
        end
    end
end

