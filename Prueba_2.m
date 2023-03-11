
clc 
clear all
close all
[y1,fs]=audioread('Nota de voz 010.m4a');
y11=abs(y1);
y12=y11;
N1=length(y11)
Nf1=1000;
for i=1:N1-Nf1
    y12(i)=sum(y11(i:i+Nf1-1))/500;
end

y13=(y12>0.03);

y14=abs(y13(1:length(y13)-1)-y13(2:length(y13)));
%sound(y,fs);
figure(1)
plot(y12)
figure(2)
plot(y1,'g')
hold on
clip1=find(y14)

yJa=y1(clip1(length(clip1)-1):clip1(length(clip1)));
Na=length(yJa)
figure(3)
plot(yJa)

[y,fs]=audioread('Nota de voz 083.m4a');
y1=abs(y);
y2=y1;
N=length(y)
Nf=1000
for i=1:N-Nf
    y2(i)=sum(y1(i:i+Nf-1))/500;
end
y3=(y2>0.03);

y4=abs(y3(1:length(y3)-1)-y3(2:length(y3)));

figure(5)
plot(y2)
figure(6)
plot(y,'g')
hold on
clip=find(y4)

yJe=y(clip(length(clip)-1):clip(length(clip)));
Ne=length(yJe)

if Na<Ne
   VocalI=yJe;
   VocalE=zeros(Ne,1);
   for i=1:Na
       VocalE(i)=yJa(i);
   end  
else
    VocalE=yJa;
    VocalI=zeros(Na,1);
    for i=1:Ne
        VocalI(i)=yJe(i);
     end
end
figure(9)
plot(VocalI)
Res=VocalE+VocalI;
figure(7)
plot(Res)
save Audios_mezclados4