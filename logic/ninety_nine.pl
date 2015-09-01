my_last(X, [X]).Gg
my_last(X, [_ | T]) :- my_last(X, T).

last_but_one(X, [X | [_]]).
last_but_one(X, [_ | T]) :- last_but_one(X, T).

kth_element(X, [X | _], 1).
kth_element(X, [_ | T], K) :- K1 is K - 1, kth_element(X, T, K1).

my_length_acc(X, X, []).
my_length_acc(X, A, [_| T]) :- A1 is A + 1, my_length_acc(X, A1, T).
my_length(X, L) :- my_length_acc(X, 0, L).

reverseAcc(R, R, []).
reverseAcc(R, A, [H | T]) :- reverseAcc(R, [H | A], T).

reverse(X, L) :- reverseAcc(X, [], L).

palindrome(L) :- reverse(L, L).

my_flatten(X,[X]) :- \+ is_list(X).
my_flatten([],[]).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).

consec([H, H | _]).
consec([_ | T]) :- consec(T).

compress([], []).
compress([X], [X]).
compress([X, X | XS], YS) :- compress([X | XS], YS).
compress([X, Y | XS], [X | YS]) :- X \= Y, compress([Y | XS], YS).


between(A, A, Y) :- A =< Y.
between(A, X, Y) :- X < Y, X1 is X + 1, between(A, X1, Y).

divisible(X, Y) :- K is X mod Y, K = 0.
not(P) :- (call(P) -> fail ; true).

is_prime(X) :- X >= 2, N is X - 1, not((between(Y, 2, N), divisible(X, Y))).

primes_in(A, B, X) :- between(X, A, B), is_prime(X).

divisors(N, X) :- between(X, 1, N), divisible(N, X).

prime_divisors(N, L) :- findall(X, (divisors(N, X), is_prime(X)), L).

nat(0).
nat(N) :- nat(N1), N is N1 + 1.
