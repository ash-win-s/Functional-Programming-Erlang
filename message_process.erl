-module(message_process).
-compile([export_all]).

start() ->
    register(msg_process, spawn(?MODULE, loop, [])),
    io:format("process ~p created ~n",[whereis(msg_process)]).

print(Term) ->
    msg_process ! {print, Term}.

stop() ->
    msg_process ! stop.

loop() ->
    receive
        {print, Term} ->
            io:format("~p~n", [Term]),
            loop();
        
        stop ->
            io:format("process ~p died~n",[whereis(msg_process)])
    end.


