sirakuz(1, AN1) :-
    write(AN1). %выводим последний (An-1) член последовательности
sirakuz(N, AK) :-
    N > 1,
    N1 is N - 1,
    (    AK mod 2 =:= 0 %считаем Ak+1 член последовательности
        -> AK1 is AK div 2
    ;   AK1 is 3 * AK + 1
    ),
    write(AK), %выводим текущий
    nl,
    sirakuz(N1, AK1). 