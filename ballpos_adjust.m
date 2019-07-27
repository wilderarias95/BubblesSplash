%%la siguiente funcion compara si el centro de la burbuja esta entre
%%algunas de las 120 casillas cada una de 40X40 pixeles,cada casilla tiene
%%un centro en especifico, que sera el centro donde se acomodora la burbuja
%%despues de colisionar, por lo tanto esta funcion ajusta la burbuja en una
%%posicion ya determinada

function [cx,cy]= ballpos_adjust(cx,cy,radio)
    if(cy>=1 && cy<2*radio)%impar
        par=0;
        cy=radio;
    elseif(cy>=2*radio && cy<4*radio)
        par=1;
        cy=3*radio;
    elseif(cy>=4*radio && cy<6*radio)
        par=0;
        cy=5*radio;
    elseif(cy>=6*radio && cy<8*radio)
        par=1;
        cy=7*radio;
    elseif(cy>=8*radio && cy<10*radio)
        par=0;
        cy=9*radio;
    elseif(cy>=10*radio && cy<12*radio)
        par=1;
        cy=11*radio;
    elseif(cy>=12*radio && cy<14*radio)
        par=0;
        cy=13*radio; 
    elseif(cy>=14*radio && cy<16*radio)
        par=1;
        cy=15*radio; 
    elseif(cy>=16*radio && cy<18*radio)
        par=0;
        cy=17*radio; 
    elseif(cy>=18*radio && cy<20*radio)
        par=1;
        cy=19*radio; 
    else
        par=0;
        cy=21*radio;
    end  
    
    if par==0
        if(cx>=1 && cx<2*radio)
            cx=20;
        elseif(cx>=2*radio && cx<4*radio)
            cx=60;
        elseif(cx>=4*radio && cx<6*radio)
            cx=100;
        elseif(cx>=6*radio && cx<8*radio)
            cx=140;
        elseif(cx>=8*radio && cx<10*radio)
            cx=180;
        elseif(cx>=10*radio && cx<12*radio)
            cx=220;
        elseif(cx>=12*radio && cx<14*radio)
            cx=260;
        elseif(cx>=14*radio && cx<16*radio)
            cx=300;
        elseif(cx>=16*radio && cx<18*radio)
            cx=340;
        elseif(cx>=18*radio && cx<20*radio)
            cx=380;
        elseif(cx>=20*radio && cx<22*radio)
            cx=420;
        else
            cx=460;
        end
    else
        if(cx>=radio && cx<3*radio)
            cx=40;
        elseif(cx>=3*radio && cx<5*radio)
            cx=80;
        elseif(cx>=5*radio && cx<7*radio)
            cx=120;
        elseif(cx>=7*radio && cx<9*radio)
            cx=160;
        elseif(cx>=9*radio && cx<11*radio)
            cx=200;
        elseif(cx>=11*radio && cx<13*radio)
            cx=240;
        elseif(cx>=13*radio && cx<15*radio)
            cx=280;
        elseif(cx>=15*radio && cx<17*radio)
            cx=320;
        elseif(cx>=17*radio && cx<19*radio)
            cx=360;
        elseif(cx>=19*radio && cx<21*radio)
            cx=400;
        elseif(cx>=21*radio && cx<23*radio)
            cx=440;
        else
            cx=480;
        end        
   
end

