# Microservices conventions

## Reducers
* Do only one thing, and do it well.
* Check for needed params, and throw error if someone is missing. Example
```javaScript
if (!_.has(where, 'user.id')) return reject(errors.handle('#missingUserId'))
```
* Always receives an object and return another object (`{}` is a valid object) or a Promise.
* Reducers don't call another reducer. When you code a reducer that mustcall multiple times. Example
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
* Instead of user a reducer to access DB, user a helper.
* Don't use anonymous functions for process. Donn't comment this functions.
* For documentation, in @returns use the element that overwrites.

## Commands

* User specific `cmd` for each type findOne/All byEmail/Id. Example
```javaScript
cmd:'findOneByEmail'
cmd:'findOneById'
cmd:'findAll'
```
* `where` & `opData` always must user the entity. Example
```javaScript
where: {
    user: {
        id : '123',
        site: 'bons'
    }
}
```

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

