%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. Nov 2020 00:05
%%%-------------------------------------------------------------------
-module(dialyzer_test2).
-author("qpm").

%% API
-export([f1/0]).

f1() ->
  tuple_size(list_to_tuple({a,b,c})).
