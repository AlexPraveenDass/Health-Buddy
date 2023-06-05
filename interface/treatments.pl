
:- module( treatments, [
    write_treatment/2
] ).

write_treatment(Hypothesis, Treatments):-
    format("The patient has ~w.~n~n", [Hypothesis]),
    (
        member(treatment(T, Description, Medications, Doctor, Address, Specialization), Treatments),
        string_lower(T, TL), atom_string(Hypothesis, TL)
    ->  format("How to treat : ~s~n~n", [Description]),
        format("Suggested medications : ~s~n~n", [Medications]),
        format("Please contact doctor : ~s, ~s - ~s~n~n", [Doctor, Specialization, Address])
    ;   format("Treatment not found for disease~n")
    ).

