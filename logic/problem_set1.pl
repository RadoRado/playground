not(P) :- (call(P) -> fail ; true).

divs(K, N) :- N1 is N mod K, N1 = 0.

between(A, A, Y) :- A =< Y.
between(A, X, Y) :- X < Y, X1 is X + 1, between(A, X1, Y).

prime(N) :- N >= 2, N1 is N - 1,  not((between(A, 2, N1),divs(A, N))).

h(S, N, K) :- between(S, 2, N), prime(S), divs(S, N), S < K.

% Първа задача от Изпит на КН 2015та, 16ти февруари
p(N, K) :- between(K, 2, N), prime(K), divs(K, N), not(h(_, N, K)).

makelist(N, X, [X | L]) :- X =< N, prime(X), divs(X, N), X1 is X + 1, makelist(N, X1, L).
makelist(N, X, L) :- X =< N, not((prime(X), divs(X, N))), X1 is X + 1, makelist(N, X1, L).
makelist(N, X, []) :- X > N.

q(N, L) :- makelist(N, 2, L).
