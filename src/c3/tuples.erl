
%% @AUTHOR: kangqiang.w :)
%% @FILE: ~/learn/github/first_erlang/src/tuples/mytuples.erl
%% @DATE: 2020/11/03 周二
%% @TIME: 01:48:06

%% DESCRIPTION: 元组就类似一种数据结构
%%

-module(tuples).
-export([main/0]).

main() -> 
    F = {firstName, joe},
    L = {lastName, armstrong},
    P = {person, F, L},
    P.
