:- initialization(consult('kinship.pro')).

%task 1
pred(X, Y) :- parent(X, Y).
pred(X, Y) :-
    male(P1),
    parent(P1, Y),
    female(P2),
    parent(P2, Y),
    (
        pred(X, P1)
        ;pred(X, P2)
    ).

%task2
brother(X, Y) :-
    male(X),
    male(P1),
    parent(P1, X),
    female(P2),
    parent(P2, X),
    parent(P1, Y),
    parent(P2, Y),
    X \== Y.

%task3
married(X, Y) :-
    bagof(A, (parent(X, A), parent(Y, A)), Res),
    X \== Y,
    Res \== [].

%task4
husband(X, Y) :-
    male(X),
    female(Y),
    married(X, Y).

%task5
brotherOrSister(X, Y) :-
    male(P1),
    parent(P1, X),
    female(P2),
    parent(P2, X),
    parent(P1, Y),
    parent(P2, Y),
    X \== Y.


cousine(X, Y) :-
    male(P1),
    parent(P1, X),
    female(P2),
    parent(P2, X),
    (   brotherOrSister(Bs1, P1) -> parent(Bs1, Y)
    ;   brotherOrSister(Bs2, P2) -> parent(Bs2, Y)
    ).

%task6
num_of_children(X, N) :-
    bagof(C, parent(X, C), Res),
    length(Res, N).

%task7
nephews(X, Y) :-
    brotherOrSister(Bs, Y),
    setof(C, parent(Bs, C), X).

%task8
family(X) :-
    married(F, M),
    male(F),
    female(M),
    setof(C, (parent(F, C), parent(M, C)), Kids),
    X = [F, M | Kids].
