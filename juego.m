%--------------------------------------------------------------------------
%------- Bubbles Splash Juego ---------------------------------------------
%------- Coceptos básicos de PDI-------------------------------------------
%------- Por: Luis Lora Larios  TIP: 1152221929 --------------------------- 
%------------ Wilder Arias Murillo TIP: 1036661772-------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial-----
%------- V2 JULIO de 2019--------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--1. Inicializo el sistema -----------------------------------------------
%--------------------------------------------------------------------------
clear all   % Inicializa todas las variables
close all   % Cierra todas las ventanas, archivos y procesos abiertos
clc         % Limpia la ventana de comandos

start_fig= imread('imagenes/start_game.png'); % cargo las variables que 
                                              %contienen la imagen de inicio
                                              %de juego (start_fig)
figure(1); % abro una ventana en matlab exclusiva (1) para mostrarla
imshow(start_fig) % se muestra en la figura (1) la imagen de inicio de juego

%--------------------------------------------------------------------------
%--2. CREACIÓN DE BOTON INICIO DE JUEGO -----------------------------------
%--------------------------------------------------------------------------
%se añade un boton a la ventana (1), se captura el evento de click y se
%inicia el juego
btn = uicontrol('String','START GAME',...
                 'BackgroundColor','white',...
                 'foregroundColor','red',...
                 'fontWeight', 'bold',...
                 'fontSize', 14,...
                 'Position',[120 180 254 36],...
                 'callback',@(btn,event) startButtonPushed);
             
      
      