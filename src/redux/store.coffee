{ combineReducers, createStore } = require 'redux'

placesReducer = require './placesreducer'
searchReducer = require './searchreducer'

reducer = combineReducers
  places: placesReducer
  search: searchReducer

middleware = do require './middleware'

module.exports = (middleware createStore) reducer
