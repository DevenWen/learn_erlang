
%% @AUTHOR: kangqiang.w :)
%% @FILE: ~/learn/github/first_erlang/src/c3/list.erl
%% @DATE: 2020/11/03 周二
%% @TIME: 02:02:05

%% DESCRIPTION:

-module(list).
-export([main/0, getFirst/1, count/1]).

main() ->
    ThingToBuy = [{apple, 10}, {pears, 5}, {milk, 3}],
    ThingToBuy.

getFirst(List) ->
    [Buy1|_] = List,
    Buy1.

% 递归以计算
cost(apple) -> 10;
cost(pears) -> 3;
cost(milk) -> 2.


count([{What, N}|Others]) -> cost(What) * N + count(Others);
count([]) -> 0.



