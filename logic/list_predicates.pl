sum(0, []).
sum(X, [H | T]) :- sum(X1, T), X is X1 + H.

sum2(X, L) :- sum2helper(X, 0, L).

sum2helper(X, X, []).
sum2helper(X, C, [H | T]) :- C1 is C + H, sum2helper(X, C1, T).

member(A, [A | _]).
member(A, [_, B]) :- member(A, B).

first(X, [X | _]).

length2(0, []).
length2(X, [_ | T]) :- length2(X1, T), X is X1 + 1.


addFirst([A | X], A, X).

addLast([X], X, []).
addLast([H | T], A, [H | T1]) :- addLast(T, A, T1).

%addLast(X, A, [H | T]) :- addLastHelper(X, A, [H], T).

%addLastHelper([X | [A]], A, X, []).
%addLastHelper(X, A, C, [H | T]) :- addLastHelper(X, A, C1 , T), addFirst(C1, H, C).

a2b([], []).
a2b([a | As], [b | Bs]) :- a2b(As, Bs).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).
listtran([H | T], [H1 | T1]) :- tran(H, H1), listtran(T, T1).

twice([], []).
twice([H | T], [ H | [H | T1]]) :- twice(T, T1).


combine1([], [], []).
combine1([A | As], [B | Bs], [ A | [B | Result]]) :- combine1(As, Bs, Result).

combine2([], [], []).
combine2([A | As], [B | Bs], [ [A, B] | Result]) :- combine2(As, Bs, Result).

subset([], _).
subset([X | XS], YS) :- member(X, YS), subset(XS, YS).

increment(X, Y) :- Z is Y - X, Z == 1.

sums(X, Y, Z) :- Z1 is X + Y, Z == Z1.

addone([], []).
addone([X | XS], [X1 | T]) :- X1 is X + 1, addone(XS, T).

accMax([], A, A).
accMax([X | XS], A, Max) :- X > A, accMax(XS, X, Max).
accMax([X | XS], A, Max) :- X =< A, accMax(XS, A, Max).

max([], _).
max([X | XS], R) :- accMax(XS, X, R).

scalarMult(_, [], []).
scalarMult(S, [X | XS], [X1 | T]) :- X1 is X * S, scalarMult(S, XS, T).

dotAcc([], [], R, R).
dotAcc([X | XS], [Y | YS], R1,  R) :- R2 is X * Y + R1, dotAcc(XS, YS, R2, R).

dot(XS, YS, R) :- dotAcc(XS, YS, 0, R).

append([], L, L).
append([H | T], L2, [H | L3]) :- append(T, L2, L3).

prefix(X, L) :- append(X, _, L).
suffix(X, L) :- append(_, X, L).

sublist(X, L) :- suffix(S, L), prefix(X, S).

reverseAcc([], R, R).
reverseAcc([X | XS], R1, R) :- reverseAcc(XS, [X | R1], R).

reverse2(L, X) :- reverseAcc(L, [], X).

doubleList([]).
doubleList(L) :- append(X, X, L).

palindrome([]).
palindrome(L) :- reverse2(L, L).

uniq_acc([], R, R1) :- reverse(R, R1).
uniq_acc([H | T], A, R) :- member(H, A), uniq_acc(T, A, R).
uniq_acc([H | T], A, R) :- not(member(H, A)), uniq_acc(T, [H | A], R).

unique(L, X) :- uniq_acc(L, [], X).
