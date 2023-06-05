
:- module( read_data, [
        read_treatments/2, read_diagnosis/2
    ] ).

:- reexport('../definitions.pl').
:- use_module(library(csv)).

read_treatments(File, Treatments):- csv_read_file(File, [_|Treatments], [functor(treatment), arity(6)]).
read_diagnosis(File, Diagnosis):- read_file_to_terms(File, Diagnosis, [module(read_data)]).
