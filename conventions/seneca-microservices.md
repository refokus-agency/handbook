# Seneca Microservices conventions

## Reducers
* Do only one thing, and do it well.
* Check for needed params, and throw error if someone is missing. Example
```javaScript
if (!_.has(where, 'user.id')) return reject(errors.handle('#missingUserId'))
```
* Always receives an object and returns another object (`{}` is a valid object) or a Promise.
* Reducers doesn't call another reducer. When you code a reducer that must be called multiple times do it using a private function. Example
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
* Instead of use a reducer to access DB, use a helper.
* Don't use anonymous functions for process. Don't comment this functions.
* For documentation, in @returns use the element that overwrites.

## Commands

* Use specific `cmd` for each type findOne/All byEmail/Id. Example
```javaScript
cmd:'findOneByEmail'
cmd:'findOneById'
cmd:'findAll'
```
* `where` & `opData` always must use the entity. Example
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

### Validation

* Validate Entities in `opData` & `where`. One validation per function. Ex:
```javaScript
.then(validateUserInWhere, $critical)
```
* Validate each field of the entity. One validation per function. Ex:
```javaScript
.then(validateUserIdFormWhere, $critical)
.then(validateUserNameFormWhere, $critical)
```
After the validation, start operate with the fields
```javaScript
.then(validateUserFormWhere, $critical)
.then(validateUserIdFormWhere, $critical)
.then(validateUserNameFormWhere, $critical)
.then(operateWithUserIdAndUserNameFields)
```

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

