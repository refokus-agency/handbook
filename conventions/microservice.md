# Microservices conventions
## Folder structure
```
+-- src
|   +-- graphql
|   |   +-- resolvers
|   |   |   +-- index.js
|   |   |   +-- mutation.js
|   |   |   +-- query.js
|   |   +-- types
|   |   |   +-- index.js
|   |   |   +-- mutation.graphql
|   |   |   +-- query.graphql
|   |   |   +-- some-type.graphql
|   |   +-- index.js
|   +-- pipes
|   |   +-- filters
|   |   |   +-- create
|   |   |   |   +-- some-create-filter-name.js
|   |   |   +-- delete
|   |   |   +-- read
|   |   |   +-- update
|   |   +-- index.js
|   |   +-- create-{entity}.js
|   |   +-- read-{entity}.js
|   +-- srv
|   |   +-- index.js
|   |   +-- service.js
|   |   +-- routes.js (only if we need to add some REST endpoint)
+-- tests
|   +-- integration
|   |   +-- graphql
|   |   +-- pipes
|   +-- unit
|   |   +-- filters
+-- package.json
...
```
### Graphql
* Keep all logic of graphql inside the folder `src/graphql`
#### Resolvers
* Create one file per resolver
* Import the pipes using the path `../pipes`. Avoid to call pipes directly ~`../pipes/some-pipe-name.js`~
#### Types
* Create one file per type
### Filters
* Create one file per filter function
### Pipes
* Create one file per action entity. ie: `create-item.js`
* Allowed actions `create | read | update | delete`
### Tests
* Create one file per file to test.
* Use this schema for naming `{file-to-test-name}.spec.js`
## Code

### Queries
* Always use the entity name. ie `user | folder`
### Mutations
* Use camelCase
* Use this format for naming `${entity}${verb}${modificators}`. ie: `entityRead | entityReadById` 
* For naming input types use `${entity}Input${msName}${verb}`. ie: `entityInputMyMsRead`
### Filters
* Do only one thing, and do it well.
* Check for needed params, and throw error if someone is missing. Example
```javaScript
if (!_.has(user, 'id')) return reject(errors.handle('#missingUserId'))
```
* Always receives an object and returns another object (`{}` is a valid object) or a Promise.
* Don't use anonymous functions for process.

### Pipes

* Add `$` as prefix of the function name. ie: `$readItems`
* For read actions always return arrays. ie: `$readItems() => [item, item, item]` `$readItemsById([id]) => [item]`

### Tests

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

