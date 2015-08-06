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
  server = new WebpackDevServer (webpack webpackConfig),
    contentBase: 'build'
    stats: { colors: true }

  server.listen 8080, 'localhost', (err) ->
      if (err)
        throw new $.util.PluginError 'webpack-dev-server', err

  $.util.log '[webpack-dev-server]', 'http://localhost:8080'

gulp.task 'build', [ 'build:webpack', 'build:static' ]

gulp.task 'build:static', ->
  gulp.src [ 'src/index.html', 'src/places.json' ]
    .pipe gulp.dest 'build'

gulp.task 'build:webpack', (cb) ->
  webpack webpackConfig, (err, stats) ->
    $.util.log '[skel:src]', stats.toString colors: true
    cb err
