
:- use_module('interface/terminal.pl').
:- use_module('interface/xpce.pl').

% The library main provides an entry point for the script, to run it in the terminal
:- use_module(library(main)).
:- use_module(library(prolog_stack)). % This is here for debugging, it allows some errors to generate backtraces
:- initialization(main_, main).

% The argument to main/1 is a list of the arguments passed on the terminal.
main([]) => % This is the default case when no argument is passed
    $ run_in_window('data/treatments.csv', 'data/data.pl').
main(['terminal']) => % This is ran when a single argument "terminal" is passed
    $ run_in_terminal('data/treatments.csv', 'data/data.pl').
main(_) => % In the general case, just print the help
    format("Usage : swipl main.pl [terminal]~n", []).

% General catch-all to get better debugging
main_:- catch_with_backtrace(main, Error, print_message(error, Error)).
