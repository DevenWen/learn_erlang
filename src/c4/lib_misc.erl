%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Nov 2020 00:26
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("qpm").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).


qsort([]) -> [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- T, X >= Pivot]).


qsort_test() ->
  L = [5,4,3,2,1],
  SortL = qsort(L),
  io:format(SortL),
  [1,2,3,4,5] = SortL.


%% 毕达哥拉斯 三元数组

pythag(N) ->
  [
    {A, B, C} ||
      A <- lists:seq(1, N),
      B <- lists:seq(1, N),
      C <- lists:seq(1, N),
      A + B + C =< N,
      A*A + B*B =:= C*C
  ].


pythag_test() ->
  [{3,4,5}, {4,3,5}] = pythag(16),
  test_ok.


perms([]) -> [[]];
perms(L) -> [[H|T] || H <-L, T <- perms(L -- [H])].

perms_test() ->
  L = "123",
  ["123", "132", "213", "231", "312", "321"] = perms(L).


%% 一个比较大小的函数 P49 关卡
max(X, Y)
  when X > Y -> X;
max(X, Y)
  -> Y.


max_test() ->
  X = 10,
  Y = 20,
  20 = max(X, Y),
  20 = max(Y, X).


