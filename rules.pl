% Authors: Dan Magariu 9217479  Calin Sticea 6339352
% Date: 3/30/2015

:- [facts].


% Rule 1
is_loop(Event,Guard):- transition(A, A, Event, Guard, _), Event\=='null', Guard\=='null'.

% Rule 2
all_loops(Set) :- findall([Event, Guard], is_loop(Event, Guard), L), list_to_set(L, Set).

% Rule 3
is_edge(Event, Guard) :- transition(_, _, Event, Guard, _).

% Rule 4
size(Length):- findall([Event, Guard], (is_edge(Event,Guard)), L), length(L, Length).

% Rule 5
is_link(Event, Guard) :- transition(A, B, Event, Guard, _), A\==B.

% Rule 6
all_superstates(Set):- findall(State, superstate(State, _), L), list_to_set(L, Set).

% Rule 7

ancestor(Ancestor, Descendant):-  superstate(Ancestor, Kid), ancestor(Kid, Descendant).

% Rule 8
inherites_transition(State, List):- findall(transition(State, _, _, _, _), transition(ancestor(_, State), _, _, _, _), List).

% Rule 9
all_states(L) :- findall(State, state(State), L).

% Rule 10
all_init_states(Set):- findall(Current, initial_state(Current), L), list_to_set(L, Set).

% Rule 11
get_starting_state(State) :- initial_state(State, null).

% Rule 12
state_is_reflexive(State) :- path(State,State,_,_,_).

% Rule 13
graph_is_reflexive :- initial_state(State,null), state_is_reflexive(State).

% Rule 14
get_guards(Ret) :- findall(Guards, transition(_, _, _, Guards, _), L), list_to_set(L, Ret).

% Rule 15
get_events(Ret) :- findall(Events, transition(_,_,Events,_,_,_),L), list_to_set(L, Ret).

% Rule 16
get_actions(Ret) :- findall(Actions,transition(_,_,_,_,Actions),L), list_to_set(L,Ret).

% Rule 17
get_only_guarded(Ret) :- findall([A, B], transition(A, B, _, Guard, _), L), list_to_set(L, Ret).

% Rule 18
legal_events(State, L):- findall([Event, Guard], transition(State, _, Event, Guard, _), Lst), list_to_set(Lst, L).





