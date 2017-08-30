-module(myservermod).
-include("/yaws-2.0.4/include/yaws_api.hrl").
-export([out/1]).

out(A) ->
    Pathinfo = A#arg.appmoddata,
    case string:to_integer(Pathinfo) of
        {error, _} -> list();
        {Id, _} -> item(Id)
    end.

list() ->
    [{header, "Access-Control-Allow-Origin: *"},
    {content, "application/json", "[{\"item\":1},{\"item\":2},{\"item\":3}]"}].

item(Id) ->
    [{header, "Access-Control-Allow-Origin: *"},
    {content, "application/json", yaws_api:f("{\"item\":~p}", [Id])}].
