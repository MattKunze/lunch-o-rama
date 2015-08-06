# Lunch-O-RAMA

Tired of staring at your friends and wandering around aimlessly trying to
figure out where to eat lunch? *I don't know, where do __you__ want to eat?*
This project is going to change your life.

Actually, this just represents a simple application that demonstrates how
to use some cool web development technologies. Powered by Webpack, React,
Redux, and other fun tools, this is a good place to get your feet wet working
with HTML5 applications.

## Running the code

Clone the project somewhere:

```
git clone https://github.com/MattKunze/lunch-o-rama
```

Install dependencies:

```
cd lunch-o-rama
npm install
```

Run the development server:

```
gulp run
```

Now open [http://localhost:8080](http://localhost:8080) in a browser and figure
out where you're going to eat!

The development server supports live reloading using [webpack dev server](http://webpack.github.io/docs/webpack-dev-server.html), so try opening
the code in a text editor, making changes, and seeing the browser automatically
refresh when you save.

## Unit tests

The project has a basic unit test framework powered by
[Mocha](http://mochajs.org). This can be accessed in two ways:

* When the development server is running (`gulp run`) open
  [http://localhost:8080/test.html](http://localhost:8080/test.html) to run tests 
  directly in the browser. This also supports live reload, so the tests will
  refresh whenever code is changed.
* Run `gulp test` on the command line to build the application and run the
  tests.

## Links and additional information

This project uses the following libraries and tools:

* [Gulp](http://gulpjs.com/) is the task runner to tie things together
* [webpack](http://webpack.github.io/) compiles and bundles all the things
* [CoffeeScript](http://coffeescript.org/) is used for most of the actual code
  (JSX is a little too [WET](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
  for my tastes)
* [React](https://facebook.github.io/react/) powers the user interface in a sane
  fashion
* [Redux](https://github.com/gaearon/redux) is an awesome new Flux-ish library
  for maintaining application state
* [Materialize](http://materializecss.com/) makes things look nice without too
  much effort
* [Mocha](http://mochajs.org) runs the unit tests. Also check out:
  * [Chai](http://chaijs.com/) for the assertion library and
  * [Sinon.JS](http://sinonjs.org/) for spies and stubs

## Exercises for the reader

This is meant as a playground to experiment with the technologies listed above.
Some interesting ideas that could easily be worked on might include:

* Prevent tag/search changes while the selection process is active
* Improve the rotation animation and behavior
* Mark tags in listed places if they match the current search, and toggle them
  from the search results when clicked
* Add test coverage for place selection action
