function  [fondon, score] = movball(radio, cx, cy, color, teta, cbfondo )

f = cbfondo; %copia temporal del tablero
k= randi([1 4],1,1); %genera un número aleatorio para seleccionar el color
t=1; %tiempo inicial 
%--------------------------------------------------------------------------
%--1. Calculo de los valores de la cinematica de la burbuja----------------
%--------------------------------------------------------------------------
%cinematica
v=15;%velocidad de la burbuja
vx= v*cos(teta);%componente en x de la velocidad
vy= v*sin(teta);%componente en y de la velocidad

%---- se invierte el sentido de las componentes de velocidad cuando es en
%el eje izquierdo
if(teta<0) 
     vx = -vx;
     vy = -vy;
end

%---Una instrucción de control hasta que la burbuja colisione
while 1
    %cinematica
    t=t+0.0001; %tiempo de la burbuja por cada posicion  
    xb= cx + vx*t; %siguiente posicion x de la burbuja
    yb= cy - vy*t; %siguiente posicion en y de la burbuja
    cx=xb; %el centro en x de la burbuja es la nueva posición 
    cy=yb; %el centro en y de la burbuja es la nueva posicion
    if((xb+2*radio)>500 || (xb-2*radio)<0) %se limita la posicion en x de la burbuja a las paredes para rebotar 
        vx=-vx;
    end
    xb= round(xb); %se redondea la posición en x a un entero
    yb= round(yb); %se redondea la posición en y a un entero
%--------------------------------------------------------------------------
%-2--.Control de colisión--------------------------------------------------
%--------------------------------------------------------------------------
    %verificar si choco 
    rc = cbfondo(yb-radio-7,xb,1);  %pixel del centro-arriba de la burbuja
    ri = cbfondo(yb-radio,xb-radio-7,1); %pixel extremo diagonal arriba-izquierdo de la burbuja
    rd = cbfondo(yb-radio,xb+radio+7,1); %pixel extremo diagonal arriba-derecho de la burbuja
    rcd= cbfondo(yb,xb+radio+7,1);       %pixel extremo derecho de la burbuja
    rci= cbfondo(yb,xb-radio-7,1);       %pixel extremo izquierdo de la burbuja   
    if(yb<440)   %423
        if(rc~=78 || ri~=78 || rd~=78 || rcd~=78 || rci~=78) %verificar si colisiono con el grupo de pelotas
                                                             %es decir, cuando algun pixel de los extremos de la burbuja sea diferente del fondo                                                                                                            
            cbfondo = f; %copia del fondo
%--------------------------------------------------------------------------
%---3. Ajuste de la burbuja colisionada en la grilla del tablero-----------
%--------------------------------------------------------------------------
            if ri~=78    %se le suma cierta incertidumbre a la posicion de la bola y se encasilla a un centro en especifico
               [xb,yb]=ballpos_adjust(xb-6,yb,radio); %incertidumbre de -4 pixeles y se ajusta la posicion a alguna casilla
            elseif rd~=78
               [xb,yb]=ballpos_adjust(xb+6,yb,radio); %incertidumbre de 4 pixeles y se ajusta la posicion a alguna casilla
            else
             [xb,yb]=ballpos_adjust(xb,yb,radio);   
            end
            cbfondo = drawball(cbfondo,xb,yb,radio,color);
            imshow(cbfondo); %se muestra el encasillado de la pelota
%--------------------------------------------------------------------------
%--4. Eliminar burbujas en caso de una colisión adecuada-------------------
%--------------------------------------------------------------------------
            [f, score]= delet(fondobefore,cbfondo(1:400,:,:),radio,color,cbfondo); %funcion para eliminar las burbujas del mismo color 
            imshow(f); %borra las bolas en colisión
            %pause
            break;
        end
    else
        fondobefore= cbfondo(1:400,:,:);
    end
%--------------------------------------------------------------------------
%--5. Visualización de cinematica de las burbujas--------------------------
%--------------------------------------------------------------------------
    cbfondo= drawball(f,xb,yb,radio,color);
    imshow(cbfondo); %movimiento pelota
    impixelinfo
end
fondon = f;
end

