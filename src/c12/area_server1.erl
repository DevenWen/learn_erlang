%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2020 21:35
%%%-------------------------------------------------------------------
-module(area_server1).
-author("qpm").

%% API
-export([rpc/2, loop/0]).


rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    Response ->
      Response
  end.


loop() ->
  receive
    {From, {rectangle, Width, Ht}} ->
      From ! Width * Ht,
      loop();
    {From, {circle, R}} ->
      From ! 3.14 * R * R,
      loop();
    {From, Other} ->
      From ! {error, Other},
      loop()
  end.
