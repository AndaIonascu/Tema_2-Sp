P=40; %perioada semnalului
D=11; %durata impulsului
N=50; %vom avea 50 de coeficienti
w=2*pi/P;%pulsatia proprie semnalului
v=-N/2:N/2;%reprezinta un vector cu elemente de la -N/2 la N/2 avand pasul 1
 Xv=(1./(-j*v*2*pi)).*(exp(-j*v*w*D)-1).*exp(j*v*w*D/2)% sir care contine
 %valorile coeficientilor Xv, pentru toate valorile vectorului v
Xv(find(v==0))=D/P;%asociaza coeficientului pentru care v=0 valoarea mediei
 %pe o perioada a semnalului
 subplot (2,1,1)%fereastra pentru grafice va fi impartita in 2 parti
 stem(v,abs(Xv)),title('Spectrul lui x(t)'), xlabel('v'),ylabel('Amplitudine')
  t=-20:.001:20;%vector cu valori de la -40 la 40 cu pasul 0.001 ce reprezinta rezolutia temporala
 xa=Xv*exp(j*w*v'*t);%folosind formula de inversiune creeaza un vector ale carui valori
 %reprezinta valoarea semnalului la fiecare moment de timp t, calculata folosind cei N coeficienti
 xb=1-1*(abs(rem(t,P))>=D/2)+1*(abs(rem(t,P))>=P-D/2);%vector ale carui valori reprezinta
 %valoarea reala a semnalului la fiecare moment de timp t
subplot(2,1,2)%urmatorul grafic va fi afisat in sectiunea a2-a a ferestrei pentru grafice
plot(t, xa,'b' ,t, xb,'r'),title('x(t)(linia rosie) si reconstructia sa folosind N coeficienti (Linia albastra)'),
     xlabel('timp(s)'),ylabel('Amplitudine')%se repzinta cele 2 semnale, semnalul real si cel aproximat de acelasi grafic
     
     %Semnalul reconstruit nu este identic cu semnalul initial. 
%Datorita faptului ca reconstruirea
     %s-a facut folosind doar N coeficienti
