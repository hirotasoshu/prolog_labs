%ставим модули, потому что могут быть отрицательные числа
containsDigit(N, D) :-
     abs(N) =:= D.


containsDigit(N, D) :-
    abs(N) > 9,
    N1 is abs(N) mod 10,
    (   N1 == D 
        -> true 
    ;   N2 is abs(N) div 10,
        containsDigit(N2, D)
    ).
 
qntDigit(A, B, D, N) :- iter(B, D, N, A, 0).

iter(B, D, N, Curr, Counter) :-
    Curr == B,
    (   containsDigit(Curr, D),
        Counter1 is Counter + 1
        -> N is Counter1
    ;   N is Counter
    ).

iter(B, D, N, Curr, Counter) :-
    Curr < B,
    Curr1 is Curr + 1,
    (   containsDigit(Curr, D)
        -> Counter1 is Counter + 1,
        iter(B, D, N, Curr1, Counter1)
    ;   iter(B, D, N, Curr1, Counter)
    ).