# Microservices conventions

## Filters
* Do only one thing, and do it well.
* Check for needed params, and throw error if someone is missing. Example
```javaScript
if (!_.has(user, 'id')) return reject(errors.handle('#missingUserId'))
```
* Always receives an object and returns another object (`{}` is a valid object) or a Promise.
* Filters doesn't call another reducer. When you code a reducer that must be called multiple times do it using a private function. Example
```javaScript
export function opreateSingle({seneca, user, where}){
    return _proccessSingleUser(user.name, where.id)
    }

export function operateMultiple({seneca, users, where}){
    let processedUsers = users.map((user)=>{
        return _processSingle(user.name, where.id)
        })
    }

function _processSingle(name, id) {_
    ...
    }
```
* Don't use anonymous functions for process.

## Pipes

* Add the command for which the pipe is intended.

## Tests

* Test for `ok`, `undefined`, `null` & `invalid`.
* Test description must be
```javaScript
describe(Action)
    describe(command)
        it('Main action. Expect '
        ...
```
* Always catch for errors to prevent fails for timeout.
* Use `function(done) {` at `it( '', function(done){`. Read Mocha docs for further information.

