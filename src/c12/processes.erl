%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2020 11:20
%%%-------------------------------------------------------------------
-module(processes).
-author("qpm").

%% API
-export([max/1]).

%% max(N)

%% 创建N个进程，然后销毁他们，看需要多长的时间

max(N) ->
  Max = erlang:system_info(process_limit),
  io:format("Maximum allowed process: ~p~n", [Max]),
  statistics(runtime),
  statistics(wall_clock),
  L = for(1, N, fun() -> spawn(fun() -> wait() end) end),
  {_, Time1} = statistics(runtime),
  {_, Time2} = statistics(wall_clock),
  lists:foreach(fun(Pid) -> Pid ! die end, L),
  U1 = Time1 * 1000 / N,
  U2 = Time2 * 1000 / N,
  io:format("Process spawn time=~p (~p) ms~n", [U1, U2]).

wait() ->
  receive
    die -> void
  end.

%% 假如 N = N 则退出。
for(N, N, F) -> [F()];
for(I, N, F) -> [F() | for(I+1, N, F)].
