% member
member(X, [X | _]).
member(X, [_ | B]) :- member(X, B).

% append
append([], R, R).
append([H1 | T1], L2, [H1 | R]) :- append(T1, L2, R).

% between
between(A, A, Y) :- A =< Y.
between(A, X, Y) :- X < Y, X1 is X + 1, between(A, X1, Y).

% nat
nat(0).
nat(X) :- nat(X1), X is X1 + 1.


% length
length2([], 0).
length2([_ | T], N) :- length2(T, N1), N is N1 + 1.

% remove
remove(_, [], []).
remove(X, [X | T], T).
remove(X, [H | T], [H | R]) :- X \= H, remove(X, T, R).

% add
add(X, [], [X]).
add(X, [H | T], [H | R]) :- add(X, T, R).

% isSorted
isSorted([]).
isSorted([_]).
isSorted([X, Y | T]) :- X =< Y, isSorted([Y | T]).

% pair
pair(X, Y) :- nat(Z), between(X, 0, Z), Y is Z - X.

% reverse
reverse_acc([], R, R).
reverse_acc([H | T], A, R) :- reverse_acc(T, [H | A], R).

reverse(L, X) :- reverse_acc(L, [], X).

insert(A, Y, [A|Y]).
insert(A, [B|Y], [B|Z]):-insert(A, Y, Z).

% permutation
permutation([], []).
permutation([A | X], Z) :- permutation(X, Y), insert(A, Y, Z).

% sort
sort2(L, X) :- permutation(L, X), isSorted(X).
