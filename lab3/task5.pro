numlst_(0, Res, Res).
numlst_(N, Lst, Res) :-
    N > 0,
    N1 is N // 10,
    D is N mod 10,
    numlst_(N1, Lst, [D|Res]).

numlst_2(K, N, Lst) :-
    numlst(K, Lst), N = K;
    K1 is K + 1,
    numlst_2(K1,N, Lst).

numlst(0, [0]).

numlst(N, Lst) :-
    (   var(N)
        -> numlst_2(1, N, Lst)
    ;   N>0, numlst_(N, Lst, [])
    ).

