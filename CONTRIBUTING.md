# Contributing

* Open a pull request with your changes
* Ping someone to review it.

If you making a change to the rulesets, ensure it passes the [integration
tests](#testing)

## <a name='testing'>Testing the linters</a>

* `npm install`
* `./test.sh`

The test script validates that the test files inside the [samples](samples)
directory pass the rules. If this fails, fix the rule, or fix the test file.
Feel free to add additional samples.
