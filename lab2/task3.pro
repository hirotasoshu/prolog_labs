factorial(0,1).

factorial(N,F) :-
    N #> 0,
    iter(N, F, 1, 1).
%напишем через хвостовую рекурсию, чтобы не падало при продолжении вычисления N при известном F из-за переполнения стека
iter(N, F, N, F).
iter(N, F, Curr, Acc) :-
    Curr1 #= Curr + 1,
    Acc1 #= Acc * Curr1,
    iter(N, F, Curr1, Acc1).


%CLP(FD) -- constraint logic programming over finite domains, система программирования в ограничениях на определенных полях.
%Они (арифметические ограничения) реализуют чистые отношения между целочисленными выражениями и могут использоваться во всех направлениях.