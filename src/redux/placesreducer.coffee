{ Actions } = require '../constants'

initialState = ->
  loading: false
  placeInfo: []
  placesByName: {}
  tags: []

handlers =
  "#{Actions.PLACES_LIST}": (state, action) ->
    if action.meta?.promise
      loading: true
    else if action.payload
      placesByName = _.reduce action.payload, (memo, place) ->
        memo[place.name] = place
        memo
      , {}
      tags = (_ action.payload)
        .pluck 'tags'
        .flatten()
        .union()
        .sort()
        .value()
      { loading: false, placeInfo: action.payload, placesByName, tags }

module.exports = (state = initialState(), action) ->
  if handlers[action.type]
    _.assign {}, state, handlers[action.type] state, action
  else
    state
