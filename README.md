# Pardot JavaScript

Want a basic overview? See [GUIDE.md](GUIDE.md).

## Linting

We use [jscs](http://jscs.info/) and [jshint](http://jshint.com") to lint our
JavaScript. The two are designed to be mutually exclusive where the former
defines *style* and the latter defines *saving your ass*.

A set of [samples](samples) are included that run against the rule sets.

If you would like to contribute, open a PR with a suggestion. Please ensure the
samples still pass. Once it's been reviewed, we'll update our main repository
with the latest [.jscsrc](.jscsrc) and [.jshintrc](.jshintrc).

### Customizing the linters

WIP

For the most part, you shouldn't need to customize the rule set. The only thing
that might be acceptable would be to **add** an additional rule. An example of this
would be using experimental ES6 features.

#### jshint

To extend jshint, add an option to `extends` the master .jshintrc. See an
[example](./samples/es6/.jshintrc').


#### jscs

At the moment, there is no way to extend other rule sets (see
[issue](https://github.com/jscs-dev/node-jscs/issues/109)). So please copy the
existing rule set, add in your additional rules, and track for any changes from
the master copy.
