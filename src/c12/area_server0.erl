%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%    第一个并发编程进程
%%% @end
%%% Created : 15. Nov 2020 21:27
%%%-------------------------------------------------------------------
-module(area_server0).
-author("qpm").

%% API
-export([loop/0]).


loop() ->
  receive
    hello ->
      io:format("hi~n"),
      loop();
    where ->
      io:format("it is gz~n"),
      loop()
  end.



