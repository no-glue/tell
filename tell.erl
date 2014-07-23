-module(tell).
-export([tell/2, reply/2]).

tell(Pid, Message)->Pid!{request, self(), Message}, receive {reply, Reply}->Reply end.
% tells something to a receiving process

reply(Pid, Message)->Pid!{reply, Message}.
% replies to a process