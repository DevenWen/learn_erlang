
%% @AUTHOR: kangqiang.w :)
%% @FILE: ~/learn/github/first_erlang/src/c3/list.erl
%% @DATE: 2020/11/03 周二
%% @TIME: 02:02:05

%% DESCRIPTION:

-module(list).
-export([main/0, getFirst/1]).

main() ->
    ThingToBuy = [{apple, 10}, {pears, 5}, {milk, 3}],
    ThingToBuy.

getFirst(List) ->
    [Buy1|_] = List,
    Buy1.