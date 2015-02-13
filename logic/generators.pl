int(0).
int(X) :- int(Y), X is Y + 1.

squares(X) :- int(Y), X is Y * Y.

divisible(X, Y) :- 0 is X mod Y, !.

even(X) :- divisible(X, 2).
odd(X) :- not(even(X)).

evens(X) :- int(X), even(X).
odds(X) :- int(X), odd(X).
