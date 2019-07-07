% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(list).
-export([main/0, read_input/1]).

read_input(I) ->
  case io:fread("", "~d") of
    eof -> ok;
    {ok, [N]} ->
      if I rem 2 == 1 -> ok;
        true -> io:format("~p~n", [N])
      end,
      read_input(I+1)
  end.

main() ->
  read_input(1).