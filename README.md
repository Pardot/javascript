# Pardot Javascript

Want a basic overview? See the [GUIDE](GUIDE.md).

The rest of this document covers the code linters we use. This is designed to be
a living repository.

## Linting

We use [jscs](http://jscs.info/) and [jshint](http://jshint.com") to lint our
Javascript. The two are designed to be mutually exclusive where the former
defines *style* and the latter defines *saving your ass*.

See the current state of the [jscs ruleset](.jscsrc) and [jshint
ruleset](.jshintrc).

A set of [samples](samples) are included that run against the rule sets.

### Customizing the linters

For the most part, you shouldn't need to customize the rule set. The only thing
that might be acceptable would be to **add** an additional rule. An example of this
would be predefining global variables.

#### jshint

To extend jshint, add an option to `extends` the master `.jshintrc`. See an
[example](samples/extends/.jshintrc).

#### jscs

At the moment, there is no way to extend other rule sets (see
[issue](https://github.com/jscs-dev/node-jscs/issues/109)). So please copy the
existing rule set ([example](samples/extends/.jscsrc)), add in your additional
rules, and track for any changes from the master copy.

## Contributing

Please make your voice heard. See [CONTRIBUTING](CONTRIBUTING.md).
