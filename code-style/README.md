# code-style-guide

### Names & Formats

#### Spaces

No unecesary tabs/spaces at the end of a line.

Unix-style linebreaks ('\n'), no Windows-style ('\r\n').

#### Line Size

~120 characters.

#### Line Ending

Avoid the use of semi-colon `;` at the end of the line, unless it has a purpouse for the code.

#### Quotes

Always use simple-quotes (`'`) to declare strings. 
In the case of variable concatenation, use back-tick (`` ` ``). [Template strings](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/template_strings)

#### Indentation

Two spaces for logic level.

#### Control Structures

Use the brace style  [1tbs](http://eslint.org/docs/rules/brace-style.html#1tbs): place the left brace at the end of the first line, braces on both sides of the `else`.
If the code allows it, use only one line without braces for `if`
Always use braces if a `else` is required. 

Cut long conditionals after the conections `&&` or `||`.

Place a space before the left parenthesis, unless this parenthesis is calling a function.
Place a space before the left brace.

```javascript
function foo () {
  return true
}

if (foo) {
  bar()
}

if (foo) {
  bar()
} else {
  baz()
}

try {
  somethingRisky()
} catch (e) {
  handleError()
}

if (foo) bar()
```

#### Classes

Classes must use [camelCase](https://en.wikipedia.org/wiki/CamelCase). 
Always reference to the class type. ie: the name of a class for a controller named "foo" should be `FooController`

```javascript
class FooController {

  constructor () {

  }
}
```

#### Methods & Functions

Functions must use [camelCase](https://en.wikipedia.org/wiki/CamelCase) with the first letter in lowercase. 

*NOTE: Do NOT use Named Functions in one line.*

```javascript
doSomething: (aFoo, aBar) => {
  ...
}
```
```javascript
function doSomething (aFoo, aBar) {
  ...
}
```

Declare anonymous functions using [arrow functions](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Functions/Arrow_functions).
Always use parentheses on the parameters.


```javascript
(aFoo, aBar) => { ... }

(aFoo) => { ... }
```
#### Variables

Variables must use [camelCase](https://en.wikipedia.org/wiki/CamelCase) with the first letter in lowercase. 
Variables must be always declared as `const`, `var` or `let` at the begining of the logic structure.

```javascript
const foo, bar
var sumResult

foo = 1
bar = 2

for (let i = 0; i < 5; i++) {
  sumResult += foo + bar
}
```

#### Operators

In the case of expressions that are not connected by `&&` or `||` and prolonging the line over 120 characters, move the operator to the line below and aligned it with the first line expression. 

```javascript
a = someLongVariable + 
    someOtherLongVariable
```

Operators as `typeof` must have their operands between parentheses.
```javascript
typeof('foo') === 'foo'
```
### Generales Practices
- Do not use `else` after a `return`
- Do not leave `console.log` from debug
- End each file with a new line
- Declare local variables as close as possible based on how it is going to be used

### JavaScript Practices

- Allways compare with tripple operators. `x === y` o `x !== y`
- Do not compare `x === true` o `x === false`. Use `(x)` o `(!x)`. Compare objects with `null`, numbers with `0` and strings with `""` to avoid confusions.
- Make sure the code doesn't return any alert for [strict Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode/Transitioning_to_strict_mode)
- Declare arrays using `[value1, value2]`
- Declare not instantiable objects using `{ member: value }`
