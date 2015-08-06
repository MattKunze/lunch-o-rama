{ Actions } = require '../constants'

module.exports =

  # fetch the JSON document describing the available places
  fetchPlaces: ->
    type: Actions.PLACES_LIST
    promise: new Promise (resolve, reject) ->
      window.fetch './places.json'
        .then (response) ->
          response.json()
        .then resolve
        .catch reject

  # update the list of places that match a search text
  # todo - implement narrowing the places listed by the search text
  applySearch: (searchText) ->
    (dispatch, getState) ->
      { placeInfo } = getState().places
      dispatch
        type: Actions.SEARCH_PLACES
        payload: { searchText, placeInfo }

  # add a tag to the search criteria and update the places that match
  addSearchTag: (tag) ->
    (dispatch, getState) ->
      { placeInfo } = getState().places
      dispatch
        type: Actions.ADD_TAG
        payload: { tag, placeInfo }

  # remove a tag to the search criteria and update the places that match
  removeSearchTag: (tag) ->
    (dispatch, getState) ->
      { placeInfo } = getState().places
      dispatch
        type: Actions.REMOVE_TAG
        payload: { tag, placeInfo }

  # trigger the behavior to select a place to eat randomly. first this
  # randomizes the current list of places that match the search details,
  # and then fires ADVANCE_SELECTION to rotate the results like a roulette
  # wheel and pick the place to eat eventually
  selectPlace: (tag) ->
    (dispatch, getState) ->
      dispatch
        type: Actions.SELECT_PLACE
        promise: new Promise (resolve, reject) ->
          timeout = 1
          iterate = ->
            dispatch type: Actions.ADVANCE_SELECTION
            if timeout < 1000
              timeout += timeout * 1.25;
              _.delay iterate, timeout
            else
              resolve getState().search.filteredPlaces[0]
          iterate()
