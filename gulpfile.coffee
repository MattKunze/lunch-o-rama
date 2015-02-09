del = require 'del'
fs = require 'fs'

gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

webpack = require 'webpack'
webpackConfig = require './webpack.config'
WebpackDevServer = require 'webpack-dev-server'
ReloadPlugin = require 'webpack-reload-plugin'

# pretty hacky, but works for now
(require 'node-jsx').install extension: '.jsx'
global.React = require 'react/addons'
global._ = require 'lodash'
UI = React.createFactory require './src/ui.jsx'
placeList = require './src/places.json'

gulp.task 'clean', (cb) ->
  del 'build', cb

gulp.task 'run', [ 'build:static' ], ->
  webpackConfig.plugins.push new ReloadPlugin 'localhost'
  server = new WebpackDevServer (webpack webpackConfig),
    contentBase: false
    stats: { colors: true }

  server.app.get '*', (req, res) ->
    fs.readFile 'src/index.html', (err, data) ->
      allTags = (_ placeList)
        .pluck 'tags'
        .flatten()
        .uniq()
        .sort()
        .value()

      app = React.renderToString UI {
        placeList
        allTags
        filterTags: []
        addFilterTag: ->
        removeFilterTag: ->
      }
      res.set 'Content-Type', 'text/html'
      res.send data.toString().replace '<div id="app"/>',
        "<div id=\"app\">#{app}</div>"

  server.listen 8080, 'localhost', (err) ->
      if (err)
        throw new $.util.PluginError 'webpack-dev-server', err

  $.util.log '[webpack-dev-server]', 'http://localhost:8080'

gulp.task 'build', [ 'build:webpack', 'build:static' ]

gulp.task 'build:static', ->
  gulp.src 'src/index.html'
    .pipe gulp.dest 'build'

gulp.task 'build:webpack', (cb) ->
  webpack webpackConfig, (err, stats) ->
    $.util.log '[skel:src]', stats.toString colors: true
    cb err
