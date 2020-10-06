partition(_, [], [], []).
partition(El, [H|T], [H|LessOrEqualThan], GreaterThan) :- El >= H, !, partition(El, T, LessOrEqualThan, GreaterThan). 
partition(El, [H|T], LessOrEqualThan, [H|GreaterThan]) :- partition(El, T, LessOrEqualThan, GreaterThan).

quicksort([], []).
quicksort([H|T], Res) :- partition(H, T, Lst1, Lst2), quicksort(Lst1, SortedLst1), quicksort(Lst2, SortedLst2), append(SortedLst1, [H|SortedLst2], Res).