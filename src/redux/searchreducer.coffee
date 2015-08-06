{ Actions } = require '../constants'

initialState = ->
  searchText: ''
  filteredPlaces: []
  searchTags: []

searchPlacesByTags = (placeInfo, tags) ->
  if _.isEmpty tags
    _.pluck placeInfo, 'name'
  else
    (_ placeInfo)
      .filter (test) ->
        (_.intersection tags, test.tags).length
      .pluck 'name'
      .value()

shuffle = (array) ->
  currentIndex = array.length

  shuffled = _.clone array
  while currentIndex isnt 0
    randomIndex = Math.floor Math.random() * currentIndex
    currentIndex -= 1

    temporaryValue = shuffled[currentIndex]
    shuffled[currentIndex] = shuffled[randomIndex]
    shuffled[randomIndex] = temporaryValue

  shuffled

handlers =
  "#{Actions.SEARCH_PLACES}": (state, action) ->
    { payload } = action
    searchText: payload.searchText or ''
    filteredPlaces: searchPlacesByTags payload.placeInfo, state.searchTags

  "#{Actions.ADD_TAG}": (state, action) ->
    { payload } = action
    unless _.contains state.searchTags, payload.tag
      searchTags = state.searchTags.concat payload.tag

      searchTags: searchTags
      filteredPlaces: searchPlacesByTags payload.placeInfo, searchTags

  "#{Actions.REMOVE_TAG}": (state, action) ->
    { payload } = action
    if _.contains state.searchTags, payload.tag
      searchTags = _.without state.searchTags, payload.tag

      searchTags: searchTags
      filteredPlaces: searchPlacesByTags payload.placeInfo, searchTags

  "#{Actions.SELECT_PLACE}": (state, action) ->
    if action.meta?.promise
      filteredPlaces: shuffle state.filteredPlaces

  "#{Actions.ADVANCE_SELECTION}": (state, action) ->
    filteredPlaces: (_.rest state.filteredPlaces).concat state.filteredPlaces[0]

module.exports = (state = initialState(), action) ->
  if handlers[action.type]
    _.assign {}, state, handlers[action.type] state, action
  else
    state
