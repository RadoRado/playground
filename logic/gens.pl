not(P) :- (call(P) -> fail ; true).

nat(0).
nat(X) :- nat(X1), X is X1 + 1.

evens(X) :- nat(X), K is X mod 2, K = 0.

between(A, A, Y) :- A =< Y.
between(A, X, Y) :- X < Y, X1 is X + 1, between(A, X1, Y).

divisible(X, Y) :- K is X mod Y, K = 0.

prime(X) :- X >= 2, N is X - 1, not((between(Y, 2, N), divisible(X, Y))).

primes(X) :- nat(X), prime(X).
squares(X) :- nat(Y), X is Y * Y.

pairs(X, Y) :- nat(S), between(X, 0, S), Y is S - X.


takeout(X,[X|R],R).  
takeout(X,[F |R],[F|S]) :- takeout(X,R,S).

perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).  
perm([],[]).

sumAcc([], X, X).
sumAcc([H | T], A, X) :- A1 is A + H, sumAcc(T, A1, X).

sum(L, X) :- sumAcc(L, 0, X).

sublists(L, X) :- append(_, X, L).

adds_to_n(L, N) :- perm(L, L1), sublists(L1, L2), sum(L2, N).

circles_that_contain(X, Y, R, Z, T, S) :- nat(S), S > R, pairs(Z, T), Z > X, T > Y.

nat_list_helper(X, X, _, 0) :- !.
nat_list_helper(X, L, Current, Count) :- Current1 is Current + 1, Count1 is Count - 1, nat_list_helper(X, [Current | L], Current1, Count1).

nat_list(L1, N) :- nat_list_helper(L, [], 0, N), reverse(L, L1).

even_length_lists(L) :- evens(N), nat_list(L, N).
