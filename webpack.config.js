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
      { test: /\.jsx/, loader: 'jsx-loader' },
      { test: /\.coffee$/, loader: 'coffee-loader' }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      React: 'react',
      _: 'lodash'
    })
  ]
};
