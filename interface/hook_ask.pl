
:- module( hook_ask, [
    hook/1
] ).

% This is a knowledge hook module that simply asks
% the user anytime the knowledge is queried

:- use_module(library(readutil)).

question(has(Symptom)):- format("Does the patient have the following symptom : \"~a\"?", [Symptom]).

knowledge(has(Symptom)):-
    format("~@~n", [question(has(Symptom))]),
    (
        repeat, % This is here to try until we get a valid answer
        prompt1("(y/n) "),
        read_line_to_string(user_input, Line),
        ( Line = "y" ; Line = "n" ; format("I didn't understand \"~s\".~n", [Line]), fail )
    ) -> Line = "y".

reset. % Nothing to reset

hook(Q):- Q. % Queries are defined as clauses internal to the module
