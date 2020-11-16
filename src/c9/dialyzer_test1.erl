%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. Nov 2020 00:00
%%%-------------------------------------------------------------------
-module(dialyzer_test1).
-author("qpm").

%% API
-export([f1/0]).

f1() ->
  X = erlang:time(),
  seconds(X).

seconds({_Year, _Month, _Day, Hour, Min, Sec}) -> (Hour * 60 + Min) * 60 + Sec.

%%Checking whether the PLT /Users/qpm/.dialyzer_plt is up-to-date... yes
%%Proceeding with analysis...
%%dialyzer_test1.erl:15: Function f1/0 has no local return
%%dialyzer_test1.erl:17: The call dialyzer_test1:seconds
%%(X :: {byte(), byte(), byte()}) will never return since it differs in the 1st argument from the success typing arguments:
%%({_, _, _, number(), number(), number()})
%%dialyzer_test1.erl:19: Function seconds/1 has no local return
%%dialyzer_test1.erl:19: The pattern
%%{_Year, _Month, _Day, Hour, Min, Sec} can never match the type
%%{byte(), byte(), byte()}
%%done in 0m0.17s
%%done (warnings were emitted)
