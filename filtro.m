clc
clear all
close all
%filtrar vocales independientemente%
%compara las vocales  tener cuidado con los tamanos 
%
load limpiar_audio2.mat;
A=VocalE;
E=VocalI;
Input=A
long=length(Input);
t=1:long;

retra=140;% coeficientes directos
retro=55;%Coeficientes retroalimentacion

  for i=retra:long
        for u=0:retra-1
            X(u+1)=Input(i-u);
        end
        for u=1:retro
            Xr(u)=y((i-u));
        end
      
        yn= W*X' + R*Xr';
        y(i)=yn;
    end
figure(1)
plot(y)
hold on
plot(Input)
