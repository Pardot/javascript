/* jshint browserify:true */
/* global Ember */

var foo = require('../foo');

window.App = Ember.Application.create({
	ready: function() {
		var foo = 'bar';
		console.log(foo);
	}
});
