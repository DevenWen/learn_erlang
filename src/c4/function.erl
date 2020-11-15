%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Nov 2020 10:47
%%%-------------------------------------------------------------------
-module(function).
-author("qpm").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).


% 定义函数
tempConvert({c, C}) -> {f, 32 + C*9/5};
tempConvert({f, F}) -> {c, (F-32)*5/9}.


temp_test() ->
  {f, 212.0} = tempConvert({c, 100}).


temp2_test() ->
  {c, 100.0} = tempConvert({f, 212}).


temp3_test() ->
  testwork.


% fun 作为参数

chapter_4_3_1_test() ->
  L = [1,2,3,4],
  %% 新知识 lists 就像一个 lib 方法，提供一系列的函数
  L2 = lists:map(fun(X) -> 2*X end, L),
  L2 = [2,4,6,8].

chapter_4_3_1_2_test() ->
  Even = fun(X) -> (X rem 2) =:= 0 end,
  L = [1,2,3,4],
  %% 新知识，函数式编程的过滤器
  [2, 4] = lists:filter(Even, L).

chapter_4_3_2_test() ->
  Fruit = [apple, pear, orange],
  MakeTest = fun(L) -> (fun(X) -> lists:member(X, L) end) end,
  IsFruit = MakeTest(Fruit),
  true = IsFruit(pear),
  false = IsFruit(cat),

  L = [apple, 1, 2, 3, dog],
  % 制作函数后，可以直接使用
  [apple] = lists:filter(IsFruit, L).


sum([H|T]) -> H + sum(T);
sum([]) -> 0.

chapter_4_4_test() ->
  6 = sum([1,2,3]).

map(_, []) ->[];
map(Fun, [H|T]) -> [Fun(H) | map(Fun, T)].

chapter_4_4_1_test() ->
  Fun = fun(X) -> (X * 2) end,
  [2, 4, 6] = map(Fun, [1, 2, 3]),

%%  列表推导
  [2,4,6] = [2*X || X <- [1,2,3]].



