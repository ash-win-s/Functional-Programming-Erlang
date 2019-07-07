-module(replicate).
-export([main/0]).

process_input(Repeats)->
    Line = io:get_line(""),
    case lists:reverse(Line) of
        "\n" ++ _ -> output(Line, Repeats), 
                     process_input(Repeats);
                _ -> output(Line ++ "~n" , Repeats)
    end.

output(_, 0)-> ok;

output(Line, Repeats)->
    io:format(Line),
    output(Line, Repeats - 1).

main()->
  {ok, [Repeats]} = io:fread("", "~d"),
  process_input(Repeats).