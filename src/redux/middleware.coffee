{ applyMiddleware } = require 'redux'
thunk = require 'redux-thunk'

promiseMiddleware = ({ dispatch }) ->
  (next) -> (action) ->
    if action.promise?
      { type, payload } = action

      # dispatch action indicating that the promise has started
      if payload
        dispatch { type, payload, meta: { promise: true } }
      else
        dispatch { type, meta: { promise: true } }

      # then hookup success/error handlers
      action.promise.then (results) ->
        if results.payload?
          dispatch { type, payload: results.payload, meta: results.meta }
        else
          dispatch { type, payload: results }
      , (error) ->
        dispatch { type, payload: error, error: true }

      # return the underlying promise so the action call resolves/rejects
      action.promise
    else
      next action

loggerMiddleware = ({ dispatch }) ->
  (next) -> (action) ->
    details = ''
    details += '[error]' if action.error
    details += JSON.stringify action.meta if action.meta
    console.debug "Dispatching #{action.type}#{details}", action.payload
    next action

module.exports = ->
  middleware = [ thunk, promiseMiddleware, loggerMiddleware ]
  applyMiddleware.apply null, middleware
