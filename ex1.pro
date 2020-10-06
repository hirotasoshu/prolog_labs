% Маленький пример на делимость
% one, two, three, four, five, six seven, eight
% q(X,Y) = "X делит Y", "X | Y"

% Сначала конкретные факты
q(two, four).
q(two, six).
q(four, eight).
q(three, six).

% Потом теоремы
q(one, _).  % _ - это анонимная переменная, которая сопоставлется с чем угодно,
            %   но ее значение недоступно
%q(one, X). % квантор всеобщности по переменной X
           % единица делит что угодно, любое число
q(X,X).    % число делит само себя
% q(_, _) - неправильно! В этом варианте первый аргумент никак не связан со вторым
q(X,Y) :- q(X,Z), q(Z,Y).
