append([], Y, Y).
append([H | T], Y, [H | R]) :- append(T, Y, R).

first([X | _], X).

last(L, X) :- append(_, [X], L).

member(X, L) :- append(_, [X | _], L).


sublist(M, L) :- append(A, R, L), append(M, B, R).
