myReverse(Lst, RevLst) :- myReverse_(Lst, RevLst, []).
myReverse_([], RevLst, RevLst).
myReverse_([H|T], RevLst, Curr) :-
    myReverse_(T, RevLst, [H|Curr]).

checkAtomsEq(A1, A2) :-
    char_code(A1, C1),
    char_code(A2, C2),
    Diff is C1-C2,
    (0 is Diff, !; 32 is abs(Diff)).

checkListOfAtomsEq([], []).
checkListOfAtomsEq([H1|T1], [H2|T2]) :-
    checkAtomsEq(H1, H2),
    checkListAtomsEq(T1, T2).
    


palindrome(Lst) :-
    myReverse(Lst, RevLst),
    checkListOfAtomsEq(Lst, RevLst).