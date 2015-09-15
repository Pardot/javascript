# Ember.js Style Guide

*This styleguide is based on the [Dockyard styleguide](https://github.com/dockyard/styleguides/blob/master/ember.md). Thanks to the team at Dockyard for distilling this in an easy to digest format.*

## General
First off make sure to follow the [Pardot javascript styleguide](https://github.com/Pardot/javascript/blob/master/GUIDE.md) unless specifically overridden here.
### Create local version of Ember.\* and DS.\*

Future versions of Ember will be released as ES2015 modules, so we'll be
able to import `Ember.computed` directly as `computed`. This includes
`computed.alias` or `computed.bool`, should be set to `alias` and
`bool`, respectively. Do not use extend prototype syntax

```javascript
// Good

import Ember from 'ember';
import DS from 'ember-data';

const {
  Model,
  attr
} = DS;

const { computed } = Ember;
const { alias } = computed;

export default Model.extend({
  firstName: attr('string'),
  lastName: attr('string'),

  surname: alias('lastName'),

  fullName: computed('firstName', 'lastName', function() {
    // Code
  })
});

// Bad

export default DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),

  fullName: Ember.computed('firstName', 'lastName', {
    get() {
      // Code
    },

    set() {
      // Code
    }
  }),

  fullNameBad: function() {
    // Code
  }.property('firstName', 'lastName')
});
```

## Organizing your modules

```js
export default Component.extend({
  // Defaults
  tagName: 'span',

  // Single line CP
  post: alias('myPost'),

  // Multiline CP
  authorName: computed('author.firstName', 'author.lastName', {
    get() {
      // Code
    },

    set() {
      // Code
    }
  })

  // private methods
  _calculateAge: function() {
    // ...
  },

  actions: {
    someAction: function() {
      // Code
    }
  }
});
```

### Define default values first

Define your object's default values first.

### Define single line computed properties second

Define single line computed properties (`thing: alias('myThing')`)
after default values.

### Define multi-line computed properties third

Multi-line computed properties should follow your single line CPs.
Please follow the [new computed syntax](http://emberjs.com/blog/2015/05/13/ember-1-12-released.html#toc_new-computed-syntax).

### Define any private methods fourth

Private methods should follow your multi-line CPs. Private methods should be limited to necessary functions that are not required to be accessed outside of the object in which they are defined.

### Define actions last

Define your route/component/controller's action last, to provide a
common place that actions can be found.

### Avoid overwriting init

Unless you want to change an object's `init` function, perform actions
by hooking into the object's `init` hook via `on`. This prevents you
from forgetting to call `_super`. [Here is why you shouldn't override
init](http://reefpoints.dockyard.com/2014/04/28/dont-override-init.html).

## Controllers

### Define query params first

For consistancy and ease of discover, list your query params first in
your contoller. These should be listed above default values.

### Do not use ObjectController or ArrayController

ObjectController is presently deprecated, and ArrayController will be as
well. Controllers are not going to be used in Ember 2.0, so by using
`Controller`, you will make it easier to migrate to 2.0.

### Alias your model

It provides a cleaner code to name your model `user` if it is a user. It
is more maintainable, and will fall in line with future routable
components

```javascript
export default Controller.extend({
  user: alias('model')
});
```

## Templates

### Do not use partials

Always use components. Partials share scope with the parent view, using
components will provide a consistent scope.

### Use block syntax

Use block syntax instead of `in` syntax with block helpers

```hbs
{{! Good }}
{{#each posts as |post|}}

{{! Bad }}
{{#each post in posts}}
```

### Use components in `{{#each}}` blocks

Contents of your each blocks should be a single line, use components
when more than one line is needed. This will allow you to test the
contents in isolation via unit tests, as your loop will likely contain
more complex logic in this case.

```hbs
{{! Good }}
{{#each posts as |post|}}
  {{post-summary post=post}}
{{/each}}

{{! Bad }}
{{#each posts as |post|}}
  <article>
    <img src={{post.image}} />
    <h1>{{post.title}}</h2>
    <p>{{post.summar}}</p>
  </article>
{{/each}}
```

## Routes

### Perform all async actions required for the page to load in `model` hooks

The model hooks are async hooks, and will wait for any promises returned
to resolve. An example of this would be models needed to fill a drop
down in a form, you don't want to render this page without the options
in the dropdown. A counter example would be comments on a page. The
comments should be fetched along side the model, but should not block
your page from loading if the required model is there.

## Ember Data

### Be explicit with Ember Data attribute types

Even though Ember Data can be used without using explicit types in
`attr`, always supply an attribute type to ensure the right data
transform is used.

```javascript
// Good

export default Model.extend({
  firstName: attr('string'),
  jerseyNumber: attr('number')
});


// Bad

export default Model.extend({
  firstName: attr(),
  jerseyNumber: attr()
});
```
