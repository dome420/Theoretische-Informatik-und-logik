%Wissensdatenbank
%Maenlich
maenlich(horst).
maenlich(dominique).
maenlich(pascal).
maenlich(willi).
maenlich(herbert).
maenlich(peter).
maenlich(mark).
%Weiblich
weiblich(andrea).
weiblich(michelle).
weiblich(vanessa).
weiblich(carmen).
weiblich(nelly).
weiblich(irmgard).

%Eltern
eltern(horst,dominique).
eltern(horst,michelle).
eltern(andrea,dominique).
eltern(andrea,michelle).
eltern(willi,pascal).
eltern(willi,vanessa).
eltern(carmen,pascal).
eltern(carmen,vanessa).
eltern(peter,horst).
eltern(peter,carmen).
eltern(nelly,horst).
eltern(nelly,carmen).
eltern(herbert,andrea).
eltern(irmgard,andrea).
eltern(herbert,mark).
eltern(imrgard,mark).


%Vater(x,y):- X ist Vater von Y
vater(V,K):- maenlich(V), eltern(V,K).
%Mutter(x,y):- X ist Mutter von Y
mutter(M,K):- weiblich(M), eltern(M,K).
%Sohn(X,Y):- X ist sohn von Y wenn X maenlich & Y elternteil ist
sohn(X,Y):- maenlich(X), eltern(Y,X).
%Tochter(X,Y):- X ist Tochter von Y wenn X maenlich & Y elternteil ist
tochter(X,Y):- weiblich(X), eltern(Y,X).
%bruder(X,Y) :- X ist Bruder von Y wenn X maenlich und X & Y gleiche Eltern haben
bruder(X,Y):- maenlich(X), eltern(E,X), eltern(E,Y), X\==Y. % Leibliche Geschwister
%schwester
schwester(X,Y):- weiblich(X), eltern(E,X), eltern(E,Y), X\==Y. % Leibliche Geschwister
%onkel.
onkel(O,N):- maenlich(O), bruder(O,V),bruder(O,M),eltern(V,N), eltern(M,N).
%cousine.
cousine(X,Y):- weiblich(X), eltern(Ex,X), eltern(Ey,Y), schwester(Ex,Ey), bruder(Ey,Ex).
cousin(X,Y):- maenlich(X), eltern(Ex,X), eltern(Ey,Y), schwester(Ex,Ey), bruder(Ey,Ex).
%großvater.
großvater(O,E):- maenlich(O), eltern(O,V), eltern(V,E).
großmutter(O,E):- weiblich(O), eltern(O,V), eltern(V,E).

