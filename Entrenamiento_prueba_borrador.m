clc
clear all
close all

load Suma_Audios2.mat;
Input= Res;% crear audio de suma de vocales mismo tamano 
            
Output= VocalI;%vocal a
long=length(Input);
t=1:long;

retra=256;
retro=128;
% Paso 1
for i=1:retra
   W(i)=0;
    %W(i)=rand()-0.5;
end
%W(1)=1;
for i=1:retro
   R(i)=0;  %LOS POLOS DE LA FUNCION
    %R(i)=rand()-0.5;
end
alfa=10e-7;
% Paso 2
Y=Input*0;
y=Input*0;
%figure(2)

for epoca=1:10000%(aprox 3000) mucho ruido
    for i=retra:long
        for u=0:retra-1
            X(u+1)=Input(i-u);
        end
        for u=1:retro
            Xr(u)=Y((i-u));
        end
        D=Output((i));
        % Paso 3
        Yn= W*X' + R*Xr';
        Y(i)=Yn;
        % Paso 4
        E=D-Yn;
        %Paso 5
        for u=1:retra
            W(u)=W(u) + alfa*E*X(u);
        end
        for u=1:retro
            R(u)=R(u) + alfa*E*Xr(u);
        end
    end

    for i=retra:long
        for u=0:retra-1
            X(u+1)=Input(i-u);
        end
        for u=1:retro
            Xr(u)=y((i-u));
        end
        D=Output(i);
        yn= W*X' + R*Xr';
        y(i)=yn;
    end
    
    ET=  sum((Output-y).^2)/long;
    
    ETF(epoca)=ET;
    
    subplot(2,1,1)
    plot(t,Output,t,y)
    subplot(2,1,2)
    plot(ETF)
    pause(0.000000001)
end

sound(y,fs)
figure(2)
subplot (3,1,1)
plot(Input)
title('Suma de vocales')
subplot (3,1,2)
plot (Output)
title('VocalE')
subplot(3,1,3)
plot (y)
title('Resultado de entrenamiento')
save  limpiar_audio2I