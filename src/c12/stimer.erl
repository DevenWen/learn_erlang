%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2020 11:32
%%%-------------------------------------------------------------------
-module(stimer).
-author("qpm").

%% API
-export([start/2, cancel/1]).

start(Time, Fun) -> spawn(fun() -> timer(Time, Fun) end).
cancel(Pid) -> Pid ! cancel.

timer(Time, Fun) ->
  receive
    cancel ->
      void
  after Time ->
    Fun()
  end.