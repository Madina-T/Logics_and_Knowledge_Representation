revise(X) :- etu(X),s(X).
d(X) :- etu(X),c(X).
reussit(X) :- etu(X),revise(X).
s(X) :- etu(X),d(X).
etu(zoe).
etu(pascal).
c(zoe).
c(pascal).
