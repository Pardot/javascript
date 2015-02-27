# Documentation

We use a subset of [YUIDoc](http://yui.github.io/yuidoc/) for documentation.

Limit yourself to the following keywords: `@param`, `@return`, `@throws`, and
`@private`.

## Usage

The following boilerplate may help get you started. If not, check out the
[examples](#examples).

```
/**
 * Description of what this code does limited to 80 chars per line.
 * When referencing code or providing usage examples, use backticks to provide
 * emphasis such as:
 *
 * See `guide()` for more information.
 *
 * or
 *
 * Usage:
 *
 * ```
 * var doc = createDoc(foo);
 * ```
 *
 * @param {Type} paramName
 * @return {Type}
 * @throws {Type} Describes when an error is thrown
 * @private
 */
function createDoc(paramName) { // ... }
```

Ideally, a good description and well-thought-out parameter names should
describe your code's intention. If not, please consider breaking it up into
smaller digestible chunks.

## Examples

### Basic

```javascript
/**
 * Parses a config file and returns the contents
 *
 * @param {String} filePath
 * @return {String}
 */
function parseConfigFile(filePath) {
  // ...
}
```

### Optional parameter and default value

* parameter is optional: `[paramName]`
* parameter is optional but a default value will be used: `[paramName=foo]`

```javascript
/**
 * Joins all elements of an Array into a String
 *
 * Note: this is merely an example. Please think very carefully when extending
 * `Array.prototype`. See: http://stackoverflow.com/a/8859941
 *
 * @param {String} [separator=',']
 * @return {String}
 */
Array.prototype.join(separator) {
  separator = separator || ',';
  // ...
}
```

### Options

An extension of the last example.

```js
/**
 * Makes bread
 *
 * @param {Object} [options]
 * @param {Boolean} [options.includeButter=true]
 * @param {Boolean} [options.includeSalt=false]
 */
function makeBread(options) {
}
```

### Mixed type

* Possible types known: `{TypeA|TypeB}`
* Types not known: `{*}`

```javascript
/**
 * Combines the values of the array into a single value
 *
 * @param {Function} callback
 * @param {*} initialValue
 * @return {String}
 */
Array.prototype.reduce(callback, initialValue) {
   // ...
}
```

### Throwing errors

```javascript
/**
 * Returns food for an animal
 *
 * @param {String} animal
 * @return {String}
 * @throws {Error} When animal is not found
 */
function foodForAnimal(animal) {
  switch(animal) {
    case "koala":
      return "leaf";
    default:
      throw new Error("Animal not known: " + animal);
  }
}
```

### Private

```javascript
/**
 * Hides the goodies
 *
 * @private
 */
function _hideGoodies() {
  // ...
}
```
