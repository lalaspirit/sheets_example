sheets_example
=====

An OTP application

Build
-----

    $ rebar3 compile

Run & Test
-----

    $ rebar3 release
    $ cd _build/default/rel/sheets_example
    $ ./bin/sheets_example console
    > sheet_unit:list().
    > sheet_stage:list().
