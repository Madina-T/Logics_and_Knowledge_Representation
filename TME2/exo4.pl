pere(papa,moi).
pere(papa,ma_soeur).
pere(gp_p,papa).
pere(gp_m,maman).
pere(agp_pp,gp_p).
pere(agp_mp,gm_p).
pere(agp_pm,gp_m).
pere(agp_mm,gm_m).

mere(maman,moi).
mere(maman,ma_soeur).
mere(gm_p,papa).
mere(gm_m,maman).
mere(agm_pp,gp_p).
mere(agm_mp,gm_p).
mere(agm_pm,gp_m).
mere(agm_mm,gm_m).

parent(X,Y) :- pere(X,Y).
parent(X,Y) :- mere(X,Y).
parents(X,Y,Z) :- pere(X,Z),mere(Y,Z).
grandPere(X,Z) :- pere(X,Y),parent(Y,Z).
frereOuSoeur(X,Y) :- parents(Z,T,X),parents(Z,T,Y),X \== Y.
ancetre(X,Y) :- parent(X,Y).
ancetre(X,Z) :- parent(Y,Z),ancetre(X,Y).
