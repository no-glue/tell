-module(tell).
-export([tell/2, tell_from/3, reply/2]).

tell(Pid, Message)->Pid!{request, self(), Message}, receive {reply, Reply}->Reply end.
% tells something to a receiving process

tell_from(Pid, Message, From)->Pid!{request, From, Message}, receive {reply, Reply}->Reply end.
% tell from some process

reply(Pid, Message)->Pid!{reply, Message}.
% replies to a process