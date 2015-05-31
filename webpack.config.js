var webpack = require("webpack");
var path = require("path");
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
var neat = require('node-neat').includePaths.reverse();
console.log("style!css!sass?includePaths[]=" + neat);
webpackConfig = {
  entry: './app/app.coffee',
  devtool: "source-map",
  output: {
    path: './dist',
    filename: 'chat.min.js'
  },
  externals: ['React', 'Flux', 'jQuery', '_', '$', 'Backbone'],
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-jsx-loader" },
      { test: /\.scss$/, loader: "style!css!sass" },
      { test: /\.png$/, loader: "url-loader?limit=100000" }
    ]
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({minimize: true})
  ],
  resolve: {
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};

if(process.env.WEBPACK !== undefined){
  webpackConfig.output.path = './build';
}
function escapeRegExpString(str) { return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"); }
function pathToRegExp(p) { return new RegExp("^" + escapeRegExpString(p)); }
module.exports = webpackConfig;
