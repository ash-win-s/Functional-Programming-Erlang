-module(child_process).
-compile([export_all]).


loop(Arg) ->
    receive
        stop ->
              io:format("Process ~p died~n",[self()]),
              exit(abnormal);
        _Any ->
               io:format("process ~p created and has loop function to process ~p~n",[self(), Arg]),
               loop(Arg)
    end.


       
