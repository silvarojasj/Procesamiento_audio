% clc
% clear all
% close all
% 
% [ya,fs]=audioread('Nota de voz 010.m4a');
% y1a=abs(ya);
% y2a=y1a;
% Na=length(ya);
% Nf=1000;
% for i=1:Na-Nf
%     y2a(i)=sum(y1a(i:i+Nf-1))/500;
% end
% y3a=(y2a>0.03);
% y4a=abs(y3a(1:length(y3a)-1)-y3a(2:length(y3a)));
% clipa=find(y4a);
% yJa=ya(clipa(length(clipa)-1):clipa(length(clipa)));
% Nja=length(yJa);
% 
% [ye,fs]=audioread('Nota de voz 083.m4a');
% y1e=abs(ye);
% y2e=y1e;
% Ne=length(ye);
% for i=1:Ne-Nf
%     y2e(i)=sum(y1e(i:i+Nf-1))/500;
% end
% y3e=(y2e>0.04);
% y4e=abs(y3e(1:length(y3e)-1)-y3e(2:length(y3e)));
% clipe=find(y4e);
% yJe=ye(clipe(length(clipe)-1):clipe(length(clipe)));
% Nje=length(yJe);
% 
% [yi,fs]=audioread('Nota de voz 189.m4a');
% y1i=abs(yi);
% y2i=y1i;
% Ni=length(yi);
% for i=1:Ni-Nf
%     y2i(i)=sum(y1i(i:i+Nf-1))/500;
% end
% y3i=(y2i>0.04);
% y4i=abs(y3i(1:length(y3i)-1)-y3i(2:length(y3i)));
% clipi=find(y4i);
% yJi=yi(clipi(length(clipi)-1):clipi(length(clipi)));
% Nji=length(yJi);
% 
% [yo,fs]=audioread('Nota de voz 003.m4a');
% y1o=abs(yo);
% y2o=y1o;
% No=length(yo);
% for i=1:No-Nf
%     y2o(i)=sum(y1o(i:i+Nf-1))/500;
% end
% y3o=(y2o>0.03);
% y4o=abs(y3o(1:length(y3o)-1)-y3o(2:length(y3o)));
% clipo=find(y4o);
% yJo=yo(clipo(length(clipo)-1):clipo(length(clipo)));
% Njo=length(yJo);
% 
% [yu,fs]=audioread('Nota de voz 070.m4a');
% y1u=abs(yu);
% y2u=y1u;
% Nu=length(yu);
% for i=1:Nu-Nf
%     y2u(i)=sum(y1u(i:i+Nf-1))/500;
% end
% y3u=(y2u>0.03);
% y4u=abs(y3u(1:length(y3u)-1)-y3u(2:length(y3u)));
% clipu=find(y4u);
% yJu=yu(clipu(length(clipu)-1):clipu(length(clipu)));
% Nju=length(yJu);
% 
% 
% if (Nja>Nje)&(Nja>Nji)&(Nja>Njo)&(Nja>Nju)
%     VocalA=yJa;
%     VocalE=zeros(Nja,1);
%     VocalI=zeros(Nja,1);
%     VocalO=zeros(Nja,1);
%     VocalU=zeros(Nja,1);
%     for i=1:Nje
%         VocalE(i)=yJe(i);
%     end
%     for i=1:Nji
%         VocalI(i)=yJi(i);
%     end
%     for i=1:Njo
%         VocalO(i)=yJo(i);
%     end
%     for i=1:Nju
%         VocalU(i)=yJu(i);
%     end
% end
% if (Nje>Nji)&(Nje>Njo)&(Nje>Nju)&(Nja<Nje)
%     VocalE=yJe;
%     VocalA=zeros(Nje,1);
%     VocalI=zeros(Nje,1);
%     VocalO=zeros(Nje,1);
%     VocalU=zeros(Nje,1);
%     for i=1:Nja
%         VocalA(i)=yJa(i);
%     end
%     for i=1:Nji
%         VocalI(i)=yJi(i);
%     end
%     for i=1:Njo
%         VocalO(i)=yJo(i);
%     end
%     for i=1:Nju
%         VocalU(i)=yJu(i);
%     end
% end
% if (Nji>Nje)&(Nja<Nji)&(Nji>Njo)&(Nji>Nju)
%     VocalI=yJi;
%     VocalE=zeros(Nji,1);
%     VocalA=zeros(Nji,1);
%     VocalO=zeros(Nji,1);
%     VocalU=zeros(Nji,1);
%     for i=1:Nje
%         VocalE(i)=yJe(i);
%     end
%     for i=1:Nja
%         VocalA(i)=yJa(i);
%     end
%     for i=1:Njo
%         VocalO(i)=yJo(i);
%     end
%     for i=1:Nju
%         VocalU(i)=yJu(i);
%     end
% end
% if (Njo>Nje)&(Njo>Nji)&(Nja<Njo)&(Njo>Nju)
%     VocalO=yJo;
%     VocalE=zeros(Njo,1);
%     VocalI=zeros(Njo,1);
%     VocalA=zeros(Njo,1);
%     VocalU=zeros(Njo,1);
%     for i=1:Nje
%         VocalE(i)=yJe(i);
%     end
%     for i=1:Nji
%         VocalI(i)=yJi(i);
%     end
%     for i=1:Nja
%         VocalA(i)=yJA(i);
%     end
%     for i=1:Nju
%         VocalU(i)=yJu(i);
%     end
% end
% if (Nju>Nje)&(Nju>Nji)&(Nju>Njo)&(Nja<Nju)
%     VocalU=yJu;
%     VocalE=zeros(Nju,1);
%     VocalI=zeros(Nju,1);
%     VocalO=zeros(Nju,1);
%     VocalA=zeros(Nju,1);
%     for i=1:Nje
%         VocalE(i)=yJe(i);
%     end
%     for i=1:Nji
%         VocalI(i)=yJi(i);
%     end
%     for i=1:Njo
%         VocalO(i)=yJo(i);
%     end
%     for i=1:Nja
%         VocalA(i)=yJa(i);
%     end
% end
% 
% Res= VocalA+VocalE+VocalI+VocalU;
% 
% figure(1)
% subplot(6,1,1)
% plot(VocalA)
% title('Vocal A')
% subplot(6,1,2)
% plot(VocalE)
% title('Vocal E')
% subplot(6,1,3)
% plot(VocalI)
% title('Vocal I')
% subplot(6,1,4)
% plot(VocalO)
% title('Vocal O')
% subplot(6,1,5)
% plot(VocalU)
% title('Vocal U')
% subplot(6,1,6)
% plot (Res)
% title('Suma de vocales')
% save Suma_Audios
word='pedro1'
ac=string(word)
strlength(ac)
a=word(6)