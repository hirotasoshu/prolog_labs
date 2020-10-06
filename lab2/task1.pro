toSquares(A, B, N) :- iter(A, B, N, 1).

iter(A, A, N, N).

iter(A, B, N, Counter) :-
    (   A > B
    -> Counter1 is Counter + 1,
        A1 is A - B,
        iter(A1, B, N, Counter1)
    ;   A < B,
        Counter1 is Counter + 1,
        B1 is B - A,
        iter(A, B1, N, Counter1)
    ).



