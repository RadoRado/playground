append([], Y, Y).
append([H | T], Y, [H | R]) :- append(T, Y, R).

first([X | _], X).

last(L, X) :- append(_, [X], L).

member(X, L) :- append(_, [X | _], L).

sublist(M, L) :- append(A, R, L), append(M, B, R).

permutation([], []).
permutation([X], [X]) :-!.
permutation([T | H], X) :- permutation(H, H1), 
                         append(L1, L2, H1), 
                         append(L1, [T], X1), 
                         append(X1, L2, X).
