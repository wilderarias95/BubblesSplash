%%la siguiente funcion eliminar las burbujas del mismo color y que
%%estuvieron implicadas en la colision, para ello se binariza el fondo
%%antes y despues de la colision segun el color de la burbuja que se dispara, y se dilatan las dos imagenes 
%%para comparar si el area cambia, si el area es diferente no hubo
%%colision, pero si es igual hay que buscar el area perteneciente a la
%%colision y eliminar esos pixeles asignando el color del fondo


function [fondof, score] = delet(fondo,fondo2,radio,color,fondof)
    [h,w]= size(fondo(:,:,1)); %dimensiones del tablero de juego

%---- Se extrae las componentes  C M Y de la captura-----------------------
    c=color(1);
    m=color(2);
    y=color(3);
%---- Se utilizara bin y bin2 para comparar los areas del tablero antes y
%despues de colisión.
    bin= fondo(:,:,1);
    bin2=fondo2(:,:,1);
% Se eliminan las burbujas que no corresponden al color de la burbuja
% colisionada.
    for i=1:h 
        for j=1:w
%tablero antes de colisión de la burbuja
            if((fondo(i,j,1)==c) && (fondo(i,j,2)==m) && (fondo(i,j,3)==y))
                bin(i,j)=255;
            else
                bin(i,j)=0;
            end
%tablero despues de colisión de la burbuja
            if((fondo2(i,j,1)==c) && (fondo2(i,j,2)==m) && (fondo2(i,j,3)==y))
                bin2(i,j)=255;
            else
                bin2(i,j)=0;
            end
        end
    end

    cbin=bin;
    cbin2=bin2;
 
%Se dilatan las imagenes
    se = strel('line',11,100);
    cbin= imdilate(cbin,se);
    cbin2= imdilate(cbin2,se);
    
%Etiquetar las areas dilatadas, y se obtiene la cantidad de areas
    [L,Ne]=bwlabel(cbin);
    propied=regionprops(L,'basic');

    [L2,Ne2]=bwlabel(cbin2);
    propied2=regionprops(L2,'basic');
    
%si el número de areas, Ne y Ne2 son iguales, quiere decir que ocurrio una
%colisión.
    if(Ne==Ne2)
        for i=1:Ne
%analiza cuales áreas son iguales, lo que indica que no hubo colisión en
%estas.
            if(propied(i).Area == propied2(i).Area)
                d=round(propied2(i).BoundingBox);
                cbin2(d(2):d(2)+d(4),d(1):d(1)+d(3))=0;
            end
        end
    else
        cbin2=zeros(h,w);
    end
    
    cbin2=cbin2(1:h,1:w);
%Verificar que el número de burbujas donde ocurrio colision sea mayor o
%igual a 3
    if(sum(sum(cbin2))>892500)  %3500 que corresponde al area de dos bolas por 255 que es el máximo
        bin2 =bin2(1:h, 1:w);
        cbin3= cbin2&bin2; %mediante la AND elimina los valores que no son común
        score = 1;
    else
        cbin3=zeros(h,w);
        score = 0;
    end
    
%Se rellena el espacio vacio que queda de la colisión con el color del
%fondo del tablero.
    for f=1:h 
        for c=1:w
            if(cbin3(f,c)==1)
               fondof(f,c,1)=78;
               fondof(f,c,2)=116;
               fondof(f,c,3)=127;
            end
        end
    end
end

