%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Nov 2020 11:00
%%%-------------------------------------------------------------------
-module(shop).
-author("qpm").

%% API
-export([cost/1, test_excpetion/1, demo1/0, demo2/0, sqrt/1]).


cost(oranges) -> 5;
cost(newspaper) ->8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

test_excpetion(Ex)  ->
  try
    throw(Ex)
  catch
    throw: myexception -> "myexception,it is ok!";
    throw: myexception2 -> "myexception, it is bad!";
    exit: myexit -> "myexit, we have to exit program!"
  end.

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> {N, caught, thrown, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.


demo1() ->
  [catcher(I) || I <- [1,2,3,4,5]].

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1,2,3,4,5]].


sqrt(X) when X < 0 ->
  error({squareRootNegativeAargument, X});
sqrt(X) ->
  math:sqrt(X).

