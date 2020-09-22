%база рекурсии
double_factorial(0,1).
double_factorial(1,1).
%рекурсия n!! = n(n-2)(n-4)...
double_factorial(N,F) :-
    N > 1,
    N2 is N-2,
    double_factorial(N2,F1),
    F is N * F1.
