% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(hello).
-export([main/0]).

main()->
        {ok,[N]} = io:fread("","~d"),
        print(N).

print(0)  -> io:format(" ");


print(N) ->
        io:fwrite("Hello World\n"),
        print(N-1).