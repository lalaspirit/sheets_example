%%%-------------------------------------------------------------------
%% @doc sheets_example public API
%% @end
%%%-------------------------------------------------------------------

-module(sheets_example_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    init_sheets(),
    sheets_example_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
init_sheets() ->
    {ok, SheetModulesFile} = application:get_env(sheets_example, sheet_module_list),
    {ok, SheetModules} = file:script(SheetModulesFile),
    {ok, CsvDir} = application:get_env(sheets_example, csv_dir),
    sheets:init(SheetModules, CsvDir).
