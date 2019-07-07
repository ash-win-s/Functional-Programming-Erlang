% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(array).
-export([main/0, read_input/1]).

read_input(X) ->
	case io:fread("", "~d") of
		eof -> ok;
		{ok, [N]} ->
			if N < X -> io:format("~p~n", [N]);
				N >= X -> ok
			end,
			read_input(X)
	end.

main() ->
	{ok,[X]} = io:fread("", "~d"),
	read_input(X).