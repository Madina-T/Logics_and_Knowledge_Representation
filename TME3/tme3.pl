% Exercice 2 %

concatene([],L,L).
concatene([X | L1],L2,[X | L]) :- concatene(L1,L2,L).

inverse([],[]).
inverse([X | L],LR) :- inverse(L,LI),concatene(LI,[X],LR).

supprime([],_,[]).
supprime([X | L],S,LR) :- X == S,supprime(L,S,LR).
supprime([X | L],S,LR) :- X \== S,supprime(L,S,LS),concatene([X],LS,LR).

filtre(L,[],L).
filtre(L1,[S | L2],LR) :- supprime(L1,S,LS),filtre(LS,L2,LR).

% Exercice 3 %

palindrome(L) :- inverse(L,L).

palindrome2([]).
palindrome2([_]).
palindrome2([Xd | Lf]) :- concatene([Xd],M,Ld),concatene(M,[Xf],Lf),Xd == Xf,palindrome2(M).
