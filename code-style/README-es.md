# code-style-guide

### Nombres y formato

#### Espacios blancos

Sin tabs ni espacios blancos al final de la linea.

Unix-style linebreaks ('\n'), no Windows-style ('\r\n').

#### Tamaño de linea

120 caracteres o menos.

#### Fin de linea

Evitar el uso de `;` en el final de las lineas a menos que el código lo requiera

#### Comillas
Siempre usar comillas simples (`'`) para declarar strings. 
En el caso de que se necesite concatenar una variable usar comillsa invertidas (`` ` ``). [Template strings](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/template_strings)

#### Indentacion

Dos espacios por nivel logico.

#### Estructuras de control

Usar el estilo de llaves [1tbs](http://eslint.org/docs/rules/brace-style.html#1tbs): la llave izquierda al final de la primer linea, llaves a ambos lados del `else`.
Si el código lo permite usar una sola linea sin llaves para `if`.
Siempre usar llaves si se require un `else`.
 
Cortar condiciones largas despues de los conectores `&&` y `||`.

Colocar un espacio antes de del parentesis izquierdo, a menos que se este llamando a una funcion.
Colocar un espacio antes de la llave izquierda.

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

#### Clases
Las clases deben usar [camelCase](https://en.wikipedia.org/wiki/CamelCase). 
Siempre deben hacer referencia a que tipo de clase es, ej: el nombre de una clase para un controller llamado foo deberia ser `FooController`

```javascript
class FooController {

  constructor () {

  }
}
```

#### Metodos y funciones

Las funciones deben usar [camelCase](https://en.wikipedia.org/wiki/CamelCase) pero no se debe escribir en mayuscula la primer letra.

*NOTA: Las funciones con nombre en una sola linea estan prohibidas.*

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
Para declarar funciones anónimas utilizar [arrow functions](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Functions/Arrow_functions).
Siempre utilizar parentesis en los parámetros.

```javascript
(aFoo, aBar) => { ... }

(aFoo) => { ... }
```
#### Variables

Las variables deben usar [camelCase](https://en.wikipedia.org/wiki/CamelCase) pero no se debe escribir en mayuscula la primer letra.
Deben ser declaradas siempre como `const`, `var` y `let` al principio de la estructura logica, segun corresponda.

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

Expresiones demasiado largas no unidas por `&&` y `||` se deben cortar para que el operador quede en la primer linea y la expresion empiece en la misma columna de la expresion en la primer linea.

```javascript
a = someLongVariable + 
    someOtherLongVariable
```

Los operadores como `typeof` deben tener sus operandos entre parentesis.
```javascript
typeof('foo') === 'foo'
```
### Practicas Generales
- No poner `else` despues de un `return`
- No dejar `console.log` de debug 
- Terminar el archivo con una nueva linea 
- Declarar variables locales lo más cerca que se pueda de su uso.

### Practicas de Javascript 
- Siempre comparar con triple operadores. `x === y` o `x !== y`
- No comparar `x === true` o `x === false`. Usar `(x)` o `(!x)`. Comparar objetos contra `null`, numeros contra `0` o strings contra `""` si hay posibilidad de confusion.
- Asegurarse que el codigo no emita ninguna advertencia de [strict Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode/Transitioning_to_strict_mode)
- Usar `[value1, value2]` para declarar arrays
- Usar `{ member: value }` para declarar objetos no instanciables
