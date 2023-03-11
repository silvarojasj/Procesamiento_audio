clc
clear all
close all
%filtrar vocales independientemente%
%compara las vocales  tener cuidado con los tamanos con filtro FIR

load limpiar_audio2I.mat;
A=VocalA;
E=VocalE;
I=VocalI;
O=VocalO;
U=VocalU;
Input=I
long=length(Input);
t=1:long;

%retra=140;% coeficientes directos
%retro=55;%Coeficientes retroalimentacion

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
%%
%calculo de la envolvente
y1=abs(y);
y2=y1;
N=length(y)
Nf=1000;
for i=1:N-Nf
    y2(i)=sum(y1(i:i+Nf-1))/500;
end
Input1=abs(Input);
Input2=Input1;
N=length(Input)
Nf=1000;
for i=1:N-Nf
    Input2(i)=sum(Input1(i:i+Nf-1))/500;
end

figure(2)
plot(y2)
hold on
plot(Input2)


Reduc=y2./Input2;  %reduccion %
figure(3)
plot(Reduc)
axis([1,40750,0,1])