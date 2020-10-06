%база
is_prime(2).
is_prime(3).

is_prime(N) :-
    N > 3, %если число больше 3
    N mod 2 =\= 0, %проверка на четность
    is_prime_(N,3).

is_prime_(N, CURR_NUM) :-
    (   CURR_NUM * CURR_NUM > N 
        -> true %проверяем до корня числа
    ;   N mod CURR_NUM =\= 0, %если число не делится на текущее
        NEXT_NUM is CURR_NUM + 2, %нет смысла проверять делимость на четные числа, т.к. тут мы точно знаем, что число нечетно
        is_prime_(N, NEXT_NUM)
    ).

filterPrimeNumbers([], []).
%костыль, чтобы нормально работало в режиме проверки
filterPrimeNumbers(Lst, Filtered) :-
    nonvar(Filtered),
    !,
    filterPrimeNumbers(Lst, X),
    X = Filtered.
%сам "фильтр" листа
filterPrimeNumbers([H|T], [H|Filtered]) :-
    is_prime(H),
    !,
    filterPrimeNumbers(T, Filtered).
filterPrimeNumbers([_|T], Filtered) :-
    filterPrimeNumbers(T, Filtered).

    