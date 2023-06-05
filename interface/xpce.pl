
:- module( xpce, [
    run_in_window/2
] ).

% This module takes care of launching the program in graphical mode

:- use_module('interface/read_data.pl').
:- use_module('interface/hook_preset.pl').

:- use_module('core/get_knowledge.pl').
:- use_module('core/backward.pl').
:- use_module('core/forward.pl').

% The library used for the graphical interface
:- use_module(library(pce)).

run_in_window(TreatmentsFile, DiagnosisFile):-
    read_treatments(TreatmentsFile, Treatments),
    read_diagnosis(DiagnosisFile, Diagnosis),
    setof(C, (H,Cond)^member(has_disease(H,C) if Cond, Diagnosis), Categories), % Collect a list of all categories

    % This creates the window and waits until it's closed.
    % ignore/1 is used so that the predicate doesn't fail when the window is closed.
    ignore(get(diagnosis_window(Categories, Treatments, Diagnosis), confirm, _)).

% This is an Xpce class, used to manage the graphical window
:- pce_begin_class(diagnosis_window, dialog).

variable(categories, prolog_term, get).
variable(treatments, prolog_term, get).
variable(diagnosis, prolog_term, get).

initialise(W, Categories:prolog_term, Treatments:prolog_term, Diagnosis:prolog_term) :->

    send_super(W, initialise('Diagnosis')), % Set the window name

    % Save the arguments in variables
    send(W, slot, categories, Categories),
    send(W, slot, treatments, Treatments),
    send(W, slot, diagnosis, Diagnosis),

    % Create the category selection menu
    send(W, append, new(@category, menu(category, choice, message(W, change_category, @category?selection)))),
    send_list(@category, append, Categories),
    send(@category, layout, horizontal),

    % Create a group for layout purposes
    send(W, append, new(G1, dialog_group('', group))),

    % Create the symptom selection menu
    send(G1, append, new(@symptoms, menu(symptoms, choice, message(W, update_diseases, @category?selection, @symptoms?selection)))),
    send(@symptoms, layout, vertical),
    send(@symptoms, multiple_selection, true),
    send(@symptoms, value_width, 300),

    % Create the disease selection menu
    send(G1, append, new(@disease, menu(disease, choice, message(W, show_treatment, @disease?selection))), right),
    send(@disease, layout, horizontal),
    send(@disease, columns, 4),

    % Create a group that contains all 3 treatment descriptions
    send(G1, append, new(@g2, dialog_group('', group)), below),

    % Create the text box for the treatment
    send(@g2, append, new(B3, dialog_group(treatment, box)), right),
    send(B3, append, new(@texttreatment, text("Test"))),
    send(B3, size, size(400, 600)),
    send(@texttreatment, margin, 380, wrap),

    % Create the text box for the medication
    send(@g2, append, new(B4, dialog_group(medications, box)), right),
    send(B4, append, new(@textmedication, text("Test"))),
    send(B4, size, size(400, 600)),
    send(@textmedication, margin, 380, wrap),

    % Create the text box for the doctor
    send(@g2, append, new(B5, dialog_group(doctor, box)), right),
    send(B5, append, new(@textdoctor, text("Test"))),
    send(B5, size, size(400, 600)),
    send(@textdoctor, margin, 380, wrap),

    % Update the initial values for everything
    send(W, change_category, @category?selection)
    .

% This method changes the selected category and the associated symptoms
change_category(W, Category) :->
    % Get all the symptoms for that category
    get(W, diagnosis, Diagnosis),
    get_knowledge(Diagnosis, has_disease(_, Category), Knowledge),

    % Update the manu with those symptoms
    send(@symptoms, clear),
    maplist(symptomname, Knowledge, Symptoms),
    send_list(@symptoms, append, Symptoms),

    % Make all symptoms selected
    send(@symptoms, selection, Symptoms),

    % Update the disease list
    send(W, update_diseases, Category, @symptoms?selection)
    .

% This method updates the diease list based on the Symptoms
update_diseases(W, Category, SymptomsChain) :->
    chain_list(SymptomsChain, Symptoms), % Convert from the Xpce data type

    % Get the list of all symptoms for that category
    get(W, diagnosis, Diagnosis),
    get_knowledge(Diagnosis, has_disease(_, Category), RequiredKnowledge),

    % Generate a list Knowledge with all symptoms, and whether the patient has it or not,
    % based on Symptoms and Required Knowledge
    findall(K,
        (
            member(has(R), RequiredKnowledge),
            (
                member(R, Symptoms)
            ->
                K = has(R)-true
            ;
                K = has(R)-false
            )
        ),
        Knowledge
    ),

    % To demonstrate the program, we run the forward inference, and then check the result with backward inference
    forward(Knowledge, Diagnosis, has_disease(_, Category), Facts),
    foreach( member(H, Facts),
        (
            backward(hook_preset:hook(Knowledge), Diagnosis, H) -> true
        ;
            has_disease(D, _) = H,
            format("Backward chaining disagrees with forward chaining for disease '~s'!", [D])
        )
    ),

    % Update the list of diseases displayed
    send(@disease, clear),
    maplist(diseasename, Facts, Diseases),
    send_list(@disease, append, Diseases),

    % Update the treatment window
    (Diseases = [] -> send(W, clear_treatment) ; send(W, show_treatment, @disease?selection) ).

% This method updates the treatment description
show_treatment(W, Disease) :->
    get(W, treatments, Treatments),
    (
        % Try to find the treatment with the right disease name, we need to lowercase it first
        member(treatment(T, Description, Medications, Doctor, Address, Specialization), Treatments),
        string_lower(T, TL), atom_string(Disease, TL)

        % Case where we find it
    ->  format(string(STreatment), "How to treat : ~n~s", [Description]),
        format(string(SMedication), "Suggested medications : ~n~s", [Medications]),
        format(string(SDoctor), "Please contact doctor : ~n~s, ~s~n~s", [Doctor, Specialization, Address])

        % Case where we don't find it
    ;   format(string(STreatment), "Not found", []),
        format(string(SMedication), "Not found", []),
        format(string(SDoctor), "Not found", [])
    ),

    % Update the text boxes with the generated text
    send(@texttreatment, string, STreatment),
    send(@textmedication, string, SMedication),
    send(@textdoctor, string, SDoctor)
    .

% Clear the treatment box if no disease is selected
clear_treatment(_) :->
    send(@texttreatment, string, "Not found"),
    send(@textmedication, string, "Not found"),
    send(@textdoctor, string, "Not found")
    .


:- pce_end_class.

diseasename(has_disease(Name, _), Name).
symptomname(has(Name), Name).
