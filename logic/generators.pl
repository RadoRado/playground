int(0).
int(X) :- int(Y), X is Y + 1.

squares(X) :- int(Y), X is Y * Y.
