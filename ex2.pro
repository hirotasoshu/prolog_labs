% s(N,S) = "S есть сумма первых N натуральных чисел"
% s(1,1) - И
% s(3,6) - И
% s(4,100) - Л
% LISP:  (s N) - функция, находящая сумму первых N чисел и возвращающая рез-т
% s(4,X) ~~~> И, X = 10

% Pascal:   s := 0; for i := 1 to n do s := s + i;

% Рекуррентные конструкции: рекурсия и итерация - 
% Итерация - вычисления с запоминанием, экономия в энергичных языках
% В ПРОЛОГЕ ЭКОНОМИИ НЕТ!!!!
% Надо писать тот вариант (рекурсия или итерация), который более сообразен задаче

% Итерация
s1(N,S) :- iter(N,S, 0,0).
 % 3-й аргумент - текущее число i
 % 4-й аргумент - текущая накопленная сумма

iter(N,S, N,S). % база рекурсии: I = N, накопленная сумма равна результату S
% iter(N,S, I,Curr) :- N = I, S = Curr. СОПОСТАВЛЕНИЕ
%  экономия сопоставлений: I встречается дважды и оба раза - в сопоставлении.
%     сопоставление можно убрать в силу транзитивности сопоставления.

iter(N,S, I,Curr) :-
  N > I, 
  I1 is I+1, Curr1 is Curr + I1,
  iter(N,S, I1, Curr1).

% Рекурсия 1 + 2 + 3 + ... + (N-1) + N = (1 + 2 + 3 + ... + (N-1)) + N
% s2(N,S)
s2(0,0).
s2(N,S) :- N > 0, N1 is N-1, s2(N1,S1), S is S1+N.




