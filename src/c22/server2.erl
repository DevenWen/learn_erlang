%%%-------------------------------------------------------------------
%%% @author wenkangqiang
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 12月 2020 12:55 下午
%%%-------------------------------------------------------------------
-module(server2).
-author("wenkangqiang").

%% API
-export([start/2, rpc/2]).

rpc(Name, Request) ->
  Name ! {self(), Request},
  receive
    {Name, crash} -> exit(rpc);
    {Name, ok, Response} -> Response
  end.

start(Name, Mod) ->
  register(Name, spawn(fun() -> loop(Name, Mod, Mod:init()) end)).

loop(Name, Mod, OldState) ->
  receive
    {From, Request} ->
      try Mod:handle(Request, OldState) of
        {Response, NewState} ->
          From ! {Name, ok, Response},
          loop(Name, Mod, NewState)
      catch
        _:Why ->
          log_the_error(Name, Request, Why),
          From ! {Name, crash},
          loop(Name, Mod, OldState)
      end
  end.

log_the_error(Name, Request, Why) ->
  io:format("Server ~p request ~p ~n caused exception ~p~n", [Name, Request, Why]).
