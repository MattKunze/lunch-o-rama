{ Actions } = require '../constants'

initialState = ->
  loading: false
  placeInfo: []
  tags: []

handlers =
  "#{Actions.PLACES_LIST}": (state, action) ->
    if action.meta?.promise
      loading: true
    else if action.payload
      tags = (_ action.payload)
        .pluck 'tags'
        .flatten()
        .union()
        .sort()
        .value()
      { placeInfo: action.payload, tags }

module.exports = (state = initialState(), action) ->
  if handlers[action.type]
    _.assign {}, state, handlers[action.type] state, action
  else
    state
