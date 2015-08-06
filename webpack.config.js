var webpack = require('webpack');

module.exports = {
  cache: true,
  context: __dirname,
  entry: {
    app: './src/app',
    test: './src/test'
  },
  output: {
    path: require('path').resolve('build'),
    filename: '[name].js'
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
      { test: /\.less$/, loader: 'style-loader!css-loader!less-loader' },
      { test: /\.css$/, loader: 'style-loader!css-loader' },
      {
        test: /.(eot|gif|jpe?g|png|svg|ttf|woff2?)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader'
      }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      React: 'react/addons',
      _: 'lodash'
    })
  ]
};
