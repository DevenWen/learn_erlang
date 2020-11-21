%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2020 12:35
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("qpm").

%% API
-export([on_exit/2]).


%% 为 Pid 注册一个退出监视器 Fun
on_exit(Pid, Fun) ->
  spawn(fun() ->
    Ref = monitor(process, Pid),
    receive
      {'DOWN', Ref, process, Pid, Why} ->
        Fun(Why)
    end
        end).


%%1> c(lib_misc).
%%{ok,lib_misc}
%%2> F = fun() ->
%%2> receive
%%2> X -> list_to_atom(X)
%%2> end
%%2> end.
%%#Fun<erl_eval.45.97283095>
%%3> Pid = spawn(F).
%%<0.88.0>
%%4> lib_misc:on_exit(Pid, fun(Why) -> io:format("~p died with: ~p~n", [Pid, Why]) end).
%%<0.90.0>
%%5> Pid ! hello.
