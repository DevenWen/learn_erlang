%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2020 11:44
%%%-------------------------------------------------------------------
-module(clock).
-author("qpm").

%% API
-export([start/2, stop/0]).

start(Time, Fun) ->
  register(clock, spawn(fun() -> tick(Time, Fun) end)).


stop() -> clock ! stop.

tick(Time, Fun) ->
  receive
    stop ->
      void
  after Time ->
    Fun(),
    tick(Time, Fun)
  end.
