var webpack = require("webpack");
var path = require("path");
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
webpackConfig = {
  entry: './app/app.coffee',
  devtool: "source-map",
  output: {
    path: './dist',
    filename: 'chat.min.js'
  },
  externals: ['React', 'Flux', 'jQuery', '_', '$', 'Backbone', 'io'],
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-jsx-loader" }
    ]
  },
  devServer: {
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*"
    }
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({minimize: true}),
    new webpack.ProvidePlugin({})
  ],
  resolve: {
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};

if(process.env.WEBPACK !== undefined){
  webpackConfig.output.path = './build';
}

module.exports = webpackConfig;
