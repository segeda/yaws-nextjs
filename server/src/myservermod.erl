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
    Json = {array, [{struct, [{id, 1}, {name, "Item 1"}]},
                    {struct, [{id, 2}, {name, "Item 2"}]},
                    {struct, [{id, 3}, {name, "Item 3"}]}]},
    Data = json2:encode(Json),
    [{header, "Access-Control-Allow-Origin: *"},
    {content, "application/json", Data}].

item(Id) ->
    Name =  list_to_binary(yaws_api:f("Item ~p", [Id])),
    Json = {struct, [{id, Id}, {name, Name}]},
    Data = json2:encode(Json),
    [{header, "Access-Control-Allow-Origin: *"},
    {content, "application/json", Data}].
