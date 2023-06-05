
:- module( hook_ask_remember, [
    hook/1
] ).

% This is a knowledge hook module that remembers answers
% to the questions asked by hook_ask

:- use_module(hook_ask, []).
:- dynamic hook_ask_remember:known/2.

% If the knowledge already exists, autofill the question and answer
hook(knowledge(has(Symptom))):- known(has(Symptom), true), !,
    format("~@ y~n", [hook_ask:question(has(Symptom))]).
hook(knowledge(has(Symptom))):- known(has(Symptom), false), !,
    format("~@ n~n", [hook_ask:question(has(Symptom))]), fail.

% If the knowledge doesn't exist, ask about it and remember the answer
hook(knowledge(K)):- !,
    (
        hook_ask:knowledge(K)
    ->  assertz(known(K, true))
    ;   assertz(known(K, false)), fail
    ).

hook(reset):- !, retractall(hook_ask_remember:known(_, _)). % Forget all knowledge on reset

hook(Q):- hook_ask:hook(Q). % Default to the queries from hook_ask
