
:- module( get_knowledge, [
    get_knowledge/3,
    generate_knowledge/3
] ).

:- use_module('../definitions.pl'). % Import operator definitions

:- det([get_knowledge/3, generate_knowledge/3]).

% Wrapper for get_knowledge/4, that hides the accumulator argument
% and puts the list of knowledge back in the right order
get_knowledge(Rules, Template, Knowledge):- get_knowledge(Rules, Template, [], RKnowledge), reverse(RKnowledge, Knowledge).

/*
 * get_knowledge(+KnowledgeHook, +Rules, +Template, +ExistingKnowledge, -NewKnowledge)
 *      Gather all the knowledge necessary to decide Rules that match Template
 *      Takes a list of ExistingKnowledge and returns NewKnowledge as an accumulator
 *
 *  NOTE: This predicate is only designed to work at a depth of 1, as this is the only case
 *      that matters here. If the project has to be extended, this predicate could
 *      be redesigned to operate recursively on Rules.
 */

get_knowledge([], _, Knowledge, Knowledge):- !. % Stop condition, Rules = []
get_knowledge([(Fact if Condition)|Rules], Template, ExistingKnowledge, NewKnowledge):- % Fails incase the rule has an incorrect representation
    (
        % Checks if Fact matches Template, without commiting the unification
        \+ \+ Fact = Template
    ->
        % If so, get knowledge for that fact in the accumulator TempKnowledge
        get_knowledge_(Condition, ExistingKnowledge, TempKnowledge)
    ;
        % Otherwise the accumulated Knowledge doesn't change
        TempKnowledge = ExistingKnowledge
    ),
    get_knowledge(Rules, Template, TempKnowledge, NewKnowledge). % Get knowledge for the other rules

