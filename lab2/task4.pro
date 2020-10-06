%4(a)

insert(nil, I, tr(I, nil, nil)).
insert(tr(X, L, R), I, tr(Y, P, Q)) :-
    (   I < X
    ->  insert(L, I, U),
        (Y, P, Q) = (X, U, R)
    ;   I > X
    ->  insert(R, I, U),
        (Y, P, Q) = (X, L, U)
    ;   (Y, P, Q) = (X, L, R)  
    ).

%4(б)
contains(tr(X, _, _), X).

contains(tr(V, L, _), X) :-
    integer(X),
    X < V,
    contains(L, X).

contains(tr(V, _, R), X) :-
    integer(X),
    X > V,
    contains(R, X).

contains(tr(_, L, _), X) :-
    var(X),
    contains(L, X).

contains(tr(_, _, R), X) :-
    var(X),
    contains(R, X).

%4(в)
%Необходимо также помнить, в каком поддереве для более старших предков мы находимся, поэтому заведем переменные min и max (в начале они равны очень большим числам, таким, что ни один ключ дерева не превысит его по модулю).
isSearchTree(Tree) :-
    current_prolog_flag(min_integer, Min),
    current_prolog_flag(max_integer, Max),    
    check(Tree, Min, Max).

check(nil, _, _).

check(tr(V, L, R), Min, Max) :-
    V > Min,
    V < Max,
    check(L, Min, V),
    check(R, V, Max).



%4(г)
remove(tr(V,nil,R), V, R).
remove(tr(V,L,nil), V, L).
remove(tr(NVal,nil,nil), V, tr(NVal,nil,nil)) :- V \= NVal.
remove(tr(NVal,L,R), V, tr(NVal,L,DRight)) :- V > NVal, remove(R, V, DRight).
remove(tr(NVal,L,R), V, tr(NVal,DLeft,R)) :- V < NVal, remove(L, V, DLeft).
remove(tr(V,L,R), V, tr(NewVal,L,DRight)) :- getLeftMost(R,NewVal), remove(R, NewVal, DRight).


getLeftMost(tr(V,nil,_),V).
getLeftMost(tr(_,L,_),NVal) :- getLeftMost(L,NVal).

%4(д)
%TODO: доделать по-нормальному
printSpaces(0).
printSpaces(N) :-
    N > 0,
    write('  '),
    N1 is N - 1,
    printSpaces(N1).


printTree(Tree) :- iter(Tree, 0).
iter(nil, _).
iter(tr(X, L, R), D) :-
    D1 is D + 1,
    printSpaces(D),
    write(X),
    nl,
    iter(L, D1),
    iter(R, D1).
