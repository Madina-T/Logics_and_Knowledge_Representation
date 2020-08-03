subsS1(C,C).
subsS1(C,D):-subs(C,D),C\==D.
subsS1(C,D):-subs(C,E),subsS1(E,D).

subsS(C,D) :- subsS(C,D,[C]).
subsS(A,B,_):-equiv(A,B).
subsS(A,B,_):-equiv(B,A).

subsS(C,all(R,D),_):-subs(E,all(R,D)),subsS(C,E).
subsS(all(R,D),C,_):-subs(all(R,D),E),subsS(E,C).
subsS(all(R,C),all(R,D),_):-subsS(C,D).
subsS(all(R,I),all(R,C)):- inst(I,C).

subsS(C,C,_).
subsS(C,D,_):-subs(C,D),C\==D.
subsS(C,D,L):-subs(C,E),not(member(E,L)),subsS(E,D,[E|L]),E\==D.

subsS(C,and(D1,D2),L):-D1\=D2,subsS(C,D1,L),subsS(C,D2,L).
subsS(C,D,L):-subs(and(D1,D2),D),E=and(D1,D2),not(member(E,L)), subsS(C,E,[E|L]),E\==C.
subsS(and(C,C),D,L):-nonvar(C),subsS(C,D,[C|L]).
subsS(and(C1,C2),D,L):-C1\=C2,subsS(C1,D,[C1|L]).
subsS(and(C1,C2),D,L):-C1\=C2,subsS(C2,D,[C2|L]).
subsS(and(C1,C2),D,L):-subs(C1,E1),E=and(E1,C2),not(member(E,L)),subsS(E,D,[E|L]),E\==D.
subsS(and(C1,C2),D,L):-Cinv=and(C2,C1),not(member(Cinv,L)),subsS(Cinv,D,[Cinv|L]).

subsS(and(C1,C2),all(R,D),L):- subsS(C1,all(R,D1),[C1|L]),subsS(C2,all(R,D2),[C2|L]),subsS(and(D1,D2),D).
