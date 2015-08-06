del = require 'del'

gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

webpack = require 'webpack'
webpackConfig = require './webpack.config'
WebpackDevServer = require 'webpack-dev-server'
ReloadPlugin = require 'webpack-reload-plugin'

gulp.task 'clean', (cb) ->
  del 'build', cb

gulp.task 'run', [ 'build:static' ], ->
  webpackConfig.plugins.push new ReloadPlugin 'localhost'

  # kind of a hack, but having issues getting mocha-loader to work both in the
  # browser and in the test task
  webpackConfig.module.loaders.unshift test: /\_spec.coffee$/, loader: 'mocha'

  server = new WebpackDevServer (webpack webpackConfig),
    contentBase: 'build'
    stats: { colors: true }

  server.listen 8080, 'localhost', (err) ->
      if (err)
        throw new $.util.PluginError 'webpack-dev-server', err

  $.util.log '[webpack-dev-server]', 'http://localhost:8080'

gulp.task 'build', [ 'build:webpack', 'build:static' ]

gulp.task 'build:static', ->
  gulp.src [ 'src/index.html', 'src/test.html', 'src/places.json' ]
    .pipe gulp.dest 'build'

gulp.task 'build:webpack', (cb) ->
  webpack webpackConfig, (err, stats) ->
    $.util.log '[skel:src]', stats.toString colors: true
    cb err

gulp.task 'test', [ 'build' ], ->
  gulp.src './build/test.js', read: false
    .pipe $.mocha reporter: 'nyan'
