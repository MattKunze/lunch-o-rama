{ combineReducers, createStore } = require 'redux'

placesReducer = require './placesreducer'
searchReducer = require './searchreducer'

reducer = combineReducers
  places: placesReducer
  search: searchReducer

middleware = require './middleware'

loggerMiddleware = ({ dispatch }) ->
  (next) -> (action) ->
    details = ''
    details += '[error]' if action.error
    details += JSON.stringify action.meta if action.meta
    console.debug "Dispatching #{action.type}#{details}", action.payload
    next action
mw = middleware loggerMiddleware

module.exports = (mw createStore) reducer
