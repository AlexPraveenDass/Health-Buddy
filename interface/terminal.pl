
:- module( terminal, [
    run_in_terminal/2
] ).

% This module takes care of launching the program in terminal mode

:- use_module('interface/read_data.pl').

:- use_module('interface/hook_ask.pl', []).
:- use_module('interface/hook_ask_remember.pl', []).

:- use_module('core/get_knowledge.pl').
:- use_module('core/backward.pl').
:- use_module('core/forward.pl').

run_in_terminal(TreatmentsFile, DiagnosisFile):-
    read_treatments(TreatmentsFile, Treatments),
    read_diagnosis(DiagnosisFile, Diagnosis),
    choose_category(Diagnosis, Category),

    % Generate a list of the knowledge necessary to run the algorithm
    % We use the hook_ask_remember hook, so that backward chaining knows about the knowledge generated.
    % When using forward chaining alone, we could use hook_ask with the same effect.
    % Using hooks in that way allows us to show knowledge being checked while backwards chaining is running.
    get_knowledge(Diagnosis, has_disease(_, Category), RequiredKnowledge),
    generate_knowledge(hook_ask_remember:hook, RequiredKnowledge, Knowledge),

    % To demonstrate the program, we run the forward inference, and then check the result with backward inference
    forward(Knowledge, Diagnosis, has_disease(_, Category), Hypotheses),
    (
        Hypotheses = [] -> writeln("No diagnosis found for these symptoms\n")
    ;
        foreach( member(has_disease(Hypothesis, _), Hypotheses),
            (
                backward(hook_ask_remember:hook, Diagnosis, has_disease(Hypothesis, Category))
            -> 
                % The $ is useful for debugging
                $ (write_treatment(Hypothesis, Treatments)), write('\n\n\n\n')
            ;
                writeln("Backward chaining disagrees with forward chaining!")
            )
        )
    ),
    hook_ask_remember:hook(reset).

% This predicate prompts the user to choose a category
choose_category(Diagnosis, Category):-
    setof(C, (H,Cond)^member(has_disease(H,C) if Cond, Diagnosis), Categories), % Collect a list of all categories
    (
        repeat, % This is here to try until we get a valid answer
        format("Please choose the disease category from : ~w~n", [Categories]),
        prompt1("> "),
        read_line_to_string(user_input, Line),
        atom_string(Category, Line),
        ( member(Category, Categories) ; format("\"~s\" is not a valid category.~n", [Line]), fail )
    ) -> true.

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

