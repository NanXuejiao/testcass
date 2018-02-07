%%%-------------------------------------------------------------------
%% @doc testcass top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(testcass_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    ensure_all(),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, { {one_for_all, 0, 1}, []} }.

%%====================================================================
%% Internal functions
%%====================================================================
ensure_all() ->
  ok = application:start(crypto),
  ok = application:start(asn1),
  ok = application:start(public_key),
  ok = application:start(ssl),
  ok = application:start(re2),
  ok = application:start(semver),
  ok = application:start(snappy),
  ok = application:start(lz4),
  ok = application:start(quickrand),
  ok = application:start(uuid),
  ok = application:start(pooler),
  ok = application:start(cqerl).
