# Contributing

* Open a pull request with your changes
* Ping someone to review it.

## Adding/Modifying the Guide

Do it, please. Add, modify, tweak, make it work.

## Adding/Modifying Rulesets

If you're making a change to the rulesets, ensure it passes the [integration
tests](#testing). While `jscs` and `jshint` are designed to be mutually
exclusive, that doesn't always seem to be the case. Try to find a rule for
`jscs` first, if none exists, find one for `jshint`. Do your best not to have
the rulesets overlap.

## <a name='testing'>Testing the Rulesets</a>

* `npm install`
* `./test.sh`

The test script validates that the test files inside the [samples](samples)
directory pass the rules. If this fails, fix the rule, or fix the test file.
Feel free to add additional samples.
