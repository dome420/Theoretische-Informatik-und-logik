%Wissensdatenbank
% Ein Prolog-Fakt ist eine Feststellung, daß ein Objekt eine bestimmte Eigenschaft hat bsp.(dominique ist männlich)
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

%Eltern(X,Y) ist eine Relation, aber auch ein Fakt. Da es keine Rechte regelseite hat.
% Eine Relation R bsp. Eltern ist eine Menge von n-Tupeln. 
% In der Relation Eltern zueinander stehende Dinge bilden n-Tupel, die Element von Eltern sind.
%bsp. Tupel von Eltern : (horst,dominique), (horst,michelle)
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
eltern(irmgard,mark).

%Rufen sich immer Rekursiv auf bis es kein ergebnis mehr gibt.
%Vater(x,y):- X ist Vater von Y
vater(V,K):- maenlich(V),eltern(V,K).
%Mutter(x,y):- X ist Mutter von Y
mutter(M,K):- weiblich(M),eltern(M,K).
%Sohn(X,Y):- X ist sohn von Y wenn X maenlich & Y elternteil von X ist
sohn(X,Y):- maenlich(X), eltern(Y,X).
%Tochter(X,Y):- X ist Tochter von Y wenn X maenlich & Y elternteil ist
tochter(X,Y):- weiblich(X), eltern(Y,X).
%- warum ungleich bei bruder oder schwestern ? - weil man nicht von sich selber bruder schwester sein kann
%bruder(X,Y) :- X ist Bruder von Y wenn X maenlich und X & Y gleiche Eltern haben
bruder(X,Y):- maenlich(X), vater(E,X), vater(E,Y),mutter(M,X),mutter(M,Y), X\==Y. % Leibliche Geschwister
%schwester(X,Y):- X ist schwester von y wenn X weiblich und X,Y gleiche Eltern haben
schwester(X,Y):- weiblich(X),vater(E,X), vater(E,Y),mutter(M,X),mutter(M,Y), X\==Y. % Leibliche Geschwister
%onkel(O,N):- O muss maenlich sein  , O  muss bruder von V , V und O müssen die gleichen Eltern haben.
onkel(O,N):- bruder(O,V),eltern(V,N).
% tante(X,Y): X ist Tante von Y.

tante(X,Y) :- eltern(A,Y), schwester(X,A).
%cousine.
% cousine(X,Y): X ist Cousine von Y.
cousine(X,Y) :-  onkel(A,Y),tochter(X,A).
cousine(X,Y) :-  tante(A,Y),tochter(X,A).
%großvater.
großvater(O,E):- maenlich(O), eltern(O,V), eltern(V,E).
großmutter(O,E):- weiblich(O), eltern(O,V), eltern(V,E).

%- "," interpretiert eine Konjunktion "und"
%- ";" interpretiert eine Disjunktion "oder" || 2.te gleichnamige Regel beachten gleichnamige realation
% Eine Anfrage mit einer Variablen liefert als Antwort zusätzlich Belegungen, mit denen die Anfrage wahr wird. 
% Man nennt eine solche Variablenbelegung Unifikation und sagt, die Variable wird mit diesem Wert unifiziert
% Bsp. vater(Zvater,Zkind) -> so wird nach belegungen der Variablen gesucht mit denen die Anfrage true liefert.
%:- Implikationspfeil 

