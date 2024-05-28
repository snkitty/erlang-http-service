-module(http_service).
-export([start/0, handler/1]).

start() ->
    {ok, _} = inets:start(httpd, [{port, 8080}, {server_name, "http_service"}, {modules, [http_service]}]),
    io:format("HTTP service running on port 8080~n").

handler(_Req) ->
    {ok, {{_, 200, "OK"}, _, _}} = httpd_response:ok("Hello, World!").
