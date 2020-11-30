%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Nov 2020 23:05
%%%-------------------------------------------------------------------
-module(dist_demo).
-author("qpm").

%% API
-export([start/1, rpc/4]).

start(Node) ->
  spawn(Node, fun() -> loop() end).

rpc(Pid, M, F, A) ->
  Pid ! {rpc, self(), M, F, A},
  receive
    {Pid, Response} ->
      Response
  end.

loop() ->
  receive
    {rpc, Pid, M, F, A} ->
      Pid ! {self(), (catch apply(M, F, A))},
      loop()
  end.

%% https://stackoverflow.com/questions/45398568/system-not-running-to-use-fully-qualified-hostnames
%% 节点通信问题解决