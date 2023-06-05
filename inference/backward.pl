
:- module( backward_inference, [
    backward/3
] ).

:- use_module('../definitions.pl'). % Import operator definitions

:- meta_predicate backward(1, +, -). % Declare predicate as meta predicate for hook resolution
                                      % See : https://www.swi-prolog.org/pldoc/doc_for?object=(meta_predicate)/1

/*
 * backward(+KnowledgeHook, +Rules, ?Fact)
 *      Deduce Fact from Rules and KnowledgeHook, using backward chaining inference.
 *      Rules is a set of Axioms of the form (Fact if Condition)
 *      KnowledgeHook is a hook predicate that is called to query or generate the knowledge database dynamically
 *
 *  NOTE: Not recursive
 */
backward(K, [Rule1|Rules], Fact):- % This clause tries every rule on backtracking
        backward(K, Rule1, Fact) % Try the first rule
    ;
        backward(K, Rules, Fact). % Try the other rules on backtracking
backward(K, Fact if Condition, Fact):- % This clause tries to prove a single rule
    (
        prove(K, Condition) -> true
    ).

/*
 * prove(+KnowledgeHook, Condition)
 *      Try to prove Condition using KnowledgeHook
 *      KnowledgeHook is a hook predicate that is called to query or generate the knowledge database dynamically
 */
prove(K, Condition1 and Condition2):- % Conjunction of facts
    prove(K, Condition1),
    prove(K, Condition2).
prove(K, know(KnowledgeHook)):- call(K, knowledge(KnowledgeHook)). % Query knowledge from the knowledge hook
