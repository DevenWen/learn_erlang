%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2020 17:45
%%%-------------------------------------------------------------------
-module(c7).
-author("qpm").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([rev_byteArray/1, term_to_packet/1, packet_to_term/1, rev_bits/1]).

%% 第7章习题

%% 7.4.1
rev_byteArray(<<Header:8, Tail/bits>>) ->
  Left = rev_byteArray(Tail),
  << Left/binary, <<Header>>/binary>>;

rev_byteArray(<<>>) ->
  <<>>.


%% 7.4.2
term_to_packet(Term) ->
  N = byte_size(Term),
  <<N:32, Term/binary>>.

%% 7.4.3
packet_to_term(Packet) ->
  <<_:32, Term/binary>> = Packet,
  Term.


%% 7.4.5
rev_bits(<<Header:1, Tail/bits>>) ->
  Left = rev_bits(Tail),
  <<Left/binary, <<Header>>/binary>>;

rev_bits(<<>>) ->
  <<>>.