%%%-------------------------------------------------------------------
%% @doc first_erlang public API
%% @end
%%%-------------------------------------------------------------------

-module(first_erlang_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    first_erlang_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
