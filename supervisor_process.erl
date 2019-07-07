-module(supervisor_process).
-compile([export_all]).
-import(child_process, [loop/1]).

start() ->
    register(my_supervisor, spawn_link(?MODULE, sup_fun, [[], false])).


create_child() ->
    my_supervisor ! {create_process, child_process, loop, 1}.

kill_child(Pid) ->
    Pid ! stop.


fun_proc_list(Proc_list, Rlist) ->
    [Rlist | Proc_list].

proc_delete(Proc_list,Pid ) ->
    lists:keydelete(Pid, 1, Proc_list).
    



sup_fun(Proc_list, Re_create) ->
    process_flag(trap_exit, true),
    if
      Re_create == true ->
          create_child(),
          sup_fun(Proc_list, false);
      true ->
          receive
              {create_process, Module, Func, Arg} ->
                  Pid = spawn(Module, Func, [Arg]),
                  monitor(process, Pid),
                  io:format("process ~p is created and supervised by process ~p~n",[Pid, whereis(my_supervisor)]),
                  P_list = fun_proc_list(Proc_list, {Pid, Module, Func, Arg}),
                  io:format("~p~n",[P_list]),
                  sup_fun(P_list, false);
              {'DOWN', _Reference, process, Pid, _Reason} ->
                  P_list = proc_delete(Proc_list, Pid),
                  sup_fun(P_list, true)
     end
   end.
            


