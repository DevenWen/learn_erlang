%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2020 12:53
%%%-------------------------------------------------------------------
-module(pratices).
-author("qpm").

%% API
-export([my_spawn/1, testFun/0, my_spwan_time/2]).

my_spawn(Func) ->
%%  分裂的线程挂了，就打印一个消息，说明挂掉的原因和存活的时间
  Cur = erlang:now(),
  Pid = spawn(Func),
%%  为 Pid 注册一个监视线程
  spawn(fun() ->
      Ref = monitor(process, Pid),
      receive
        {'DOWN', Ref, process, Pid, Why} ->
          End = erlang:now(),
          io:format("start: ~p~n end: ~p~n why:~p~n", [Cur, End, Why])
      end
    end),
  Pid.

my_spwan_time(Func, Time) ->
%%  13.9 (2)
  Ref = spawn(Func),
  spawn(fun() ->
    receive
    after Time ->
      Ref ! stop
    end
  end),
  Ref.

testFun() ->
  fun () ->
    receive
      X -> io:format("proc end cause: ~p~n", [X])
    end
  end.
