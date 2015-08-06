{ Actions } = require '../constants'

module.exports =

  fetchPlaces: ->
    type: Actions.PLACES_LIST
    promise: new Promise (resolve, reject) ->
      window.fetch './places.json'
        .then (response) ->
          response.json()
        .then resolve
        .catch reject

  applySearch: (searchText) ->
    (dispatch, getState) ->
      { placeInfo } = getState().places
      dispatch
        type: Actions.SEARCH_PLACES
        payload: { searchText, placeInfo }

  addSearchTag: (tag) ->
    (dispatch, getState) ->
      { placeInfo } = getState().places
      dispatch
        type: Actions.ADD_TAG
        payload: { tag, placeInfo }

  removeSearchTag: (tag) ->
    (dispatch, getState) ->
      { placeInfo } = getState().places
      dispatch
        type: Actions.REMOVE_TAG
        payload: { tag, placeInfo }

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
