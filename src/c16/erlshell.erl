%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Dec 2020 14:49
%%%-------------------------------------------------------------------
-module(erlshell).
-author("qpm").

%% API
-export([]).

%% 打开并读文件
%%1> file:consult("data1.dat").
%%{ok,[{person,"joe","armstrong",
%%[{occupation,programmer},{favoriteLanguage,erlang}]},
%%{cat,{name,"zorro"},{owner,"joe"}}]}


%% 读文件，并打开文件句柄 S，也可以理解为文件流。
%%2> {ok, S} = file:open("data1.dat", read).
%%{ok,<0.85.0>}
%%3> io:read(S, '').
%%{ok,{person,"joe","armstrong",
%%[{occupation,programmer},{favoriteLanguage,erlang}]}}
%%4> io:read(S, '').
%%{ok,{cat,{name,"zorro"},{owner,"joe"}}}
%%5> io:read(S, '').
%%eof
%%8> file:close(S).
%%ok
