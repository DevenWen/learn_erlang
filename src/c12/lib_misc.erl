%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Nov 2020 23:53
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("qpm").

%% API
-export([]).


sleep(T) ->
  receive
    after T ->
      true
  end.

%%
flush_buffer() ->
  receive
    _Any ->
      flush_buffer()
  after 0 ->
    true
  end.

