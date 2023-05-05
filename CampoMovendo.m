%==============================================================%
% Movimento das partículas no campo elétrico/ por Saulo.
% por: Saulo
% Objetivo: Vizualizar a variação do campo elétrico de 3 cargas
% com o passar do tempo considerando o movimento das partículas.
%==============================================================%
clear all, clc;
pkg load image



%Valores iniciais das partícula
%Párticula 1 (verde)
x1 = 1;
y1 = 0.5;
q1 = -1*10^-4;
m1 = 8.85 * 10^-12;
vx1 = 0;
vy1 = 0;
ax1 = 0;
ay1 = 0;
r1 = 0.05;

%Partícula 2 (Vemelha)
x2 = -1;
y2 = 2;
q2 = 2*10^-4;
m2 = 8.85 * 10^-12;
vx2 = 0;
vy2 = 0;
ax2 = 0;
ay2 = 0;
r2 = 0.05;

%Partícula 3 (Azul)
x3 = -1;
y3 = -1;
q3 = -2*10^-4;
m3 = 8.85 * 10^-12;
vx3 = 0;
vy3 = 0;
ax3 = 0;
ay3 = 0;
r3 = 0.05;

%Espaço
[x,y] =  meshgrid(-4:0.03125:4);


%Campo (Gerado pelos 3
Ex = (EletricFieldX(x1,y1,q1,x,y)+EletricFieldX(x2,y2,q2,x,y)+EletricFieldX(x3,y3,q3,x,y));
Ey = (EletricFieldY(x1,y1,q1,x,y)+EletricFieldY(x2,y2,q2,x,y)+EletricFieldY(x3,y3,q3,x,y));

modE =(Ex.^2+Ey.^2).^0.5;
Ex = Ex./modE;
Ey = Ey./modE;

%Exibir campo e posição das partículas
figure(1)
h = quiver(x,y,Ex,Ey);
hold on
viscircles([x1,y1],r1,'Color', 'g');

viscircles([x2,y2],r2,'Color', 'r');

viscircles([x3,y3],r3,'Color', 'b');
title('campo eletrico de 3 cargas');
hold off


#Laço while
%Tempo de frame
frametime = 8*10^-8

%Contador
k = 0;
while k<100
    %===============================================================================%
    %Calculando a força elétrica que atua em cada uma das partículas
    F1x = q1*(EletricFieldX(x2,y2,q2,x1,y1)+EletricFieldX(x3,y3,q3,x1,y1));
    F1y = q1*(EletricFieldY(x2,y2,q2,x1,y1)+EletricFieldY(x3,y3,q3,x1,y1));

    F2x = q2*(EletricFieldX(x1,y1,q1,x2,y2)+EletricFieldX(x3,y3,q3,x2,y2));
    F2y = q2*(EletricFieldY(x1,y1,q1,x2,y2)+EletricFieldY(x3,y3,q3,x2,y2));

    F3x = q3*(EletricFieldX(x1,y1,q1,x3,y3)+EletricFieldX(x2,y2,q2,x3,y3));
    F3y = q3*(EletricFieldY(x1,y1,q1,x3,y3)+EletricFieldY(x2,y2,q2,x3,y3));
    %===============================================================================%
    %Encontrando a aceleração das partículas
    %Partícula 1
    ax1 = F1x/m1;
    ay1 = F1y/m1;

    %Partícula 2
    ax2 = F2x/m2;
    ay2 = F2y/m2;

    %Partícula 3
    ax3 = F3x/m3;
    ay3 = F3y/m3;
    %===============================================================================%
    %Encontrando as velocidades das partículas
    %Partícula 1
    vx1 = vx1 + ax1*frametime;
    vy1 = vy1 + ay1 *frametime;

    %Partícula 2
    vx2 = vx2 + ax2*frametime;
    vy2 = vy2 + ay2 *frametime;


    %Partícula 3
    vx3 = vx3 + ax3*frametime;
    vy3 = vy3 + ay3 *frametime;

    %===============================================================================%
    %Atualizando posição das partículas
    %Partícula 1
    x1 = x1 + vx1*frametime
    y1 = y1 + vy1*frametime

    %Partícula 2
    x2 = x2 + vx2*frametime
    y2 = y2 + vy2*frametime


    %Partícula 3
    x3 = x3 + vx3*frametime;
    y3 = y3 + vy3*frametime;

    %===============================================================================%
    pause(frametime); %Próximo a um FPS de 60Hz

    %Printando o campo no espaço.
    %Campo (Gerado pelos 3
    Ex = (EletricFieldX(x1,y1,q1,x,y)+EletricFieldX(x2,y2,q2,x,y)+EletricFieldX(x3,y3,q3,x,y));
    Ey = (EletricFieldY(x1,y1,q1,x,y)+EletricFieldY(x2,y2,q2,x,y)+EletricFieldY(x3,y3,q3,x,y));

    modE =(Ex.^2+Ey.^2).^0.5;
    Ex = Ex./modE;
    Ey = Ey./modE;

    %Exibir campo e posição das partículas
    figure(1)
    h = quiver(x,y,Ex,Ey);
    xlim([-4,4]);
    ylim([-4,4]);
    hold on
    viscircles([x1,y1],r1,'Color', 'g');

    viscircles([x2,y2],r2,'Color', 'r');

    viscircles([x3,y3],r3,'Color', 'b');
    title('CAMPO ELÉTRICO DE 3 CARGAS');
    hold off
    %===============================================================================%
    %Atualizando o contador
    k = k+1;

    if abs(x1)>4 || abs(x2)>4 || abs(x3)>4 || abs(y1)>4 || abs(y2)>4 || abs(x3)>4
      m=10000
      break
    endif


endwhile
