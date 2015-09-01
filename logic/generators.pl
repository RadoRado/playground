int(0).
int(X) :- int(Y), X is Y + 1.

takeout(X,[X|R],R).  
takeout(X,[F |R],[F|S]) :- takeout(X,R,S).

perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).  
perm([],[]).

squares(X) :- int(Y), X is Y * Y.

divisible(X, Y) :- 0 is X mod Y, !.

even(X) :- divisible(X, 2).
odd(X) :- not(even(X)).

evens(X) :- int(X), even(X).
odds(X) :- int(X), odd(X).

between(A, B, A) :- A =< B.
between(A, B, C) :- A < B, A1 is A + 1, between(A1, B, C).

pairs(X, Y) :- int(S), between(0, S, X), Y is S - X.
