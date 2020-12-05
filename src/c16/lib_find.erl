%%%-------------------------------------------------------------------
%%% @author qpm
%%% @copyright (C) 2020, <COMPANY>
%%% @doc 文件查找器
%%%
%%% @end
%%% Created : 05. Dec 2020 15:21
%%%-------------------------------------------------------------------
-module(lib_find).
-author("qpm").
-import(lists, [reverse/1]).

%% API
-export([files/3, files/5]).

-include_lib("kernel/include/file.hrl").

files(Dir, Re, Flag) ->
  Re1 = xmerl_regexp:sh_to_awk(Re),
  reverse(files(Dir, Re1, Flag, fun(File, Acc) -> [File|Acc] end, [])).


files(Dir, Reg, Recursive, Fun, Acc) ->
  case file:list_dir(Dir) of
    {ok, Files} -> find_files(Files, Dir, Reg, Recursive, Fun, Acc);
    {error, _} -> Acc
  end.





find_files([File|T], Dir, Reg, Recursive, Fun, Acc) ->
  FullName = filename:join([Dir, File]),
  case file_type(FullName) of
    regular  ->
      case re:run(FullName, Reg, [{capture, none}]) of
        match ->
          Acc0 = Fun(FullName, Acc),
          find_files(T, Dir, Reg, Recursive, Fun, Acc0);
        nomatch ->
          find_files(T, Dir, Reg, Recursive, Fun, Acc)
      end;
    directory ->
      case Recursive of
        true ->
          Acc0 = files(FullName, Reg, Recursive, Fun, Acc),
          find_files(T, Dir, Reg, Recursive, Fun, Acc0);
        false ->
          find_files(T, Dir, Reg, Recursive, Fun, Acc)
      end;
    error ->
      find_files(T, Dir, Reg, Recursive, Fun, Acc)
  end;

find_files([], _, _, _, _, A) ->
  A.

file_type(File) ->
  case file:read_file_info(File) of
    {ok, Facts} ->
      case Facts#file_info.type of
        regular -> regular;
        directory -> directory;
        _ -> error
      end;
    _ ->
      error
end.
