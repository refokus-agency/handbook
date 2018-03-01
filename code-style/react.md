# Project Structure
## Feature Structure
- /{FeatureName}
  - index.js- 
  - {featureName}.js
  - styles.css
  - SomeIcon.svg
  - /tests
    -  {featureName}.spec.js 
    - Index.spec.js
  - /hocs
    - {hocName}.js
  - /graphql (in case we are using apollo-client) 
    - queryName.graphql
    - mutationName.graphql 
  - /auxFolder (wrapping common ideas, ie: menuButtons) 
  - /{InnerFeatureName}
    - index.js
    - {innerFeatureName}.js 
    - style.css
    - /tests
      - index.spec.js 
      - {innerFeatureName}.spec.js 

## Project Structure
- /proyect
  - /assets
    - index.html
  - /config
    -	Webpack config files
  - /src
    - /app
      - Index.jsx
      - Routes.js
      - /styles
         - styles.css (default app’s style)
         - normalize.css
         - app config files
    - /shared
      - /styles
      - /images
      - /types

    - /features
      - Feature: [Feature Structure]
    - /model (in case we are using redux)
      - /actions
      - /reducers
      - /middlewares
      - Store.js
    - /model (in case we are using apollo-client)
      - Index.js
      - defaults.js
      - reducers.js
      - /layouts

## Code style
### Javascript
We use Eslint as our linter
We don't allow any code with errors to be released. Errors will literally cause bundle compilation to abort. However eslint do not block the development build.
Variable and function names should be camelCase, class names should be UpperCamelCase. Constants should be ALL_CAPS. \
Prefer latest EcmaScript syntax. Some examples are

```javascript
{...foo, ...bar}
```
~~`Object.assign({}, foo, bar)`~~

- Object deconstruction over multiple assignments
```javascript
  const {foo, bar} = this.props
```
~~`const foo = this.props.foo`~~ \
~~`const bar = this.props.bar`~~

- Destructuring within the parameter list over single object
```javascript
const myFunction = ({foo, bar}) => {console.log(foo + bar)}
```
~~`const myFunction = (params) => {console.log(params.foo + params.bar)}`~~
### React
We use Redux for store our shared data
All React components and container must be written on Jsx and Es6 features
Event handlers should follow the name convention: "handle<component>On<action>".
<TagInput onClick={this.handleTagInputOnClick}/>
Custom React Class methods should be written as arrow functions.
handleTagInputOnClick = () => {console.log(‘click’)}

### Classifications for Presentational Components vs Container Components

#### Presentational components
Are concerned with how things look.
May contain both presentational and container components inside, and usually have some DOM markup and styles of their own.
Often allow containment via this.props.children.
Have no dependencies on the rest of the app, such as Redux actions or reducers.
Don’t specify how the data is loaded or mutated.
Receive data and callbacks exclusively via props.
Rarely have their own state (when they do, it’s UI state rather than data).
Are written as functional components unless they need state, lifecycle hooks, or performance optimizations.

#### Container components
Are concerned with how things work.
May contain both presentational and container components inside but usually don’t have any DOM markup of their own except for some wrapping divs, and never have any styles.
Provide the data and behavior to presentational or other container components.
Call Redux actions and provide these as callbacks to the presentational components.
Are often stateful, as they tend to serve as data sources.

### On unit Tests
Our unit test setup uses mocha, expect, sinon, and enzyme
Free-standing functions and classes should be unit tested, with both common and edge cases.
Actions and reducers should be tested.
React components should be given basic mounting tests using enzyme. The idea is that we should verify that the component can be mounted without crashing the process.
React container should be given basic mounting tests using enzyme. If the container has some logic it should be tested as well.


## Flow
We use flow for everything! Including flow is mandatory in every non-spec file (this is enforced by the linter). Using flow for typing out the of react components means we can skip prop-types except in special circumstances. Using flow for this means our props are checked at compile-time rather than at runtime, and that the checking is much stricter. 
Type Redux using Flow guide

Libraries & Third Parties
Don’t use libraries that force to include inline styles
When choosing libraries they need to be as open as possible to avoid functionality and visual limitations
Libraries must have cross-browser support (min IE10 and all modern Browser)
Libraries with a community behind have a plus on the decision taking


## CSS Stylesheet
The primary architectural division is between
Written in camelCase, using Css Modules we don’t have to worry about using the same class name along the application, so be really declarative
colors live in a separate file, so you have to import them when use one
Media queries boundaries live in a separate file, so you have to import them when use one

> Use PostCSS to modularise components by component
Avoid cross-browsing unsupported styles (min IE10 and all modern Browser)
