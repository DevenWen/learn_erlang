%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2020 11:58
%%%-------------------------------------------------------------------
-module(myspwan).
-author("qpm").

%% API
-export([start/2, test/0]).

start(AnAtom, Fun) ->
  case whereis(AnAtom) of
     undefined ->
       NewPid = spawn(Fun),
       register(AnAtom, NewPid),
       NewPid;
     Pid ->
      io:format("Pid alread ~p~n", [Pid])
  end.

test() ->
  start(myproc, fun() -> io:format("test proc") end),
  start(myproc, fun() -> io:format("test proc") end).
