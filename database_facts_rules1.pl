% Author:  Dan Magariu 9217479  Calin Sticea 6339352
% Date: 3/30/2015

% Part 1 states
state(dormant).
state(init).
state(safe_shutdown).
state(error_diagnosis).
state(idle).
state(monitoring).


% Part 2 states
state(boot_hw).
state(senchk).
state(tchk).
state(psichk).
state(ready).

% Part 3 states
state(error_rcv).
state(applicable_rescue).
state(reset_module_data).

% Part 4 states
state(monidle).
state(regulate_environment).
state(lockdown).

% Part 5 states
state(prep_vpurge).
state(alt_temp).
state(alt_psi).
state(risk_assess).
state(safe_status).

