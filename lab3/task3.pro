myPrefix([H], [H|_]).
myPrefix([H1|T1], [H2|T2]) :-
    H1=H2,
    myPrefix(T1, T2).

mySublist(S, [H|T]) :-
    myPrefix(S, [H|T]);
    mySublist(S, T).