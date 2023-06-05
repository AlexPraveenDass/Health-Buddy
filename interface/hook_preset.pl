
:- module( hook_preset, [
    hook/2
] ).

% This is a knowledge hook module that takes a list of knowledge already generated

hook(_, reset). % Nothing to reset

hook(Knowledge, knowledge(K)):- member(K-true, Knowledge), !.
