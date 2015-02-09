var webpack = require('webpack');

module.exports = {
  cache: true,
  context: __dirname,
  entry: './src/app',
  output: {
    path: require('path').resolve('build'),
    filename: 'bundle.js'
  },
  resolve: {
    extensions: [
      '',
      '.coffee',
      '.js',
      '.jsx'
    ]
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' },
      { test: /\.json$/, loader: 'json-loader' },
      { test: /\.jsx$/, loader: 'jsx-loader' },
      { test: /\.less$/, loader: 'style-loader!css-loader!less-loader' }

    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      React: 'react/addons',
      _: 'lodash'
    })
  ]
};
