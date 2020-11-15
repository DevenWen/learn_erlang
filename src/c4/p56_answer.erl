%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Nov 2020 23:29
%%%-------------------------------------------------------------------
-module(p56_answer).
-author("qpm").

-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).


area({round, Radius}) -> Radius * Radius * 3.14.



tuple_to_list_test() ->
  [1,2,3] = tuple_to_list({1,2,3}).

my_tuple_to_list({}) -> [];
my_tuple_to_list(Tuple) ->
  my_tuple_to_list_help(Tuple, 1, tuple_size(Tuple)).

my_tuple_to_list_help(Tuple, Pos, Size) when Pos > Size -> [];
my_tuple_to_list_help(Tuple, Pos, Size) -> [element(Pos, Tuple) | my_tuple_to_list_help(Tuple, Pos+1, Size)].



my_tuple_to_list_test() ->
  [1,2,3] = my_tuple_to_list({1,2,3}).

%% 源自网络的解决方案
my_tuple_to_list_V3(Tuple) ->
  [element(I, Tuple) || I <- lists:seq(1, tuple_size(Tuple))].

my_tuple_to_list_v3_test() ->
  [1,2,3] = my_tuple_to_list_V3({1,2,3}).


%%my_date_string() ->
%%  {Year, Month, Date} = date(),
%%  {Hour, Min, Sec}= time(),
%%  Year + "-" + Month + "-" + Date.
%%
%%
%%my_date_string_test() ->
%%  "2020-11-6" = my_date_string().


