%открываем календарь..))))
numOfDays(jan, 31).
numOfDays(feb, 29).
numOfDays(mar, 31).
numOfDays(apr, 31).
numOfDays(may, 31).
numOfDays(jun, 30).
numOfDays(jul, 31).
numOfDays(aug, 31).
numOfDays(sep, 30).
numOfDays(oct, 31).
numOfDays(nov, 30).
numOfDays(dec, 31).
%задаем порядок следования месяцев
nextMonth(jan, feb).
nextMonth(feb, mar).
nextMonth(mar, apr).
nextMonth(apr, may).
nextMonth(may, jun).
nextMonth(jun, jul).
nextMonth(jul, aug).
nextMonth(aug, sep).
nextMonth(sep, oct).
nextMonth(oct, nov).
nextMonth(nov, dec).
nextMonth(dec, jan).

checkDate(MONTH, N) :-
    N > 0,
    numOfDays(MONTH, N1),
    N =< N1.

nextDate(date(MONTH1, N1), date(MONTH2, N2)) :-
    checkDate(MONTH1, N1),
    (   N2 is N1+1,
        MONTH2 = MONTH1,
        checkDate(MONTH2, N2) 
        -> true
    ;   numOfDays(MONTH1, N1),
        nextMonth(MONTH1, MONTH2),
        N2 is 1
    ).

