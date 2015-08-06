{ Actions } = require '../constants'
placesReducer = require './placesreducer'

describe 'Places Reducer', ->

  places = [
    name: 'First', tags: [ 'one' ]
  ,
    name: 'Second', tags: [ 'two' ]
  ,
    name: 'Last', tags: [ 'one', 'two' ]
  ]

  it 'should provide initial state', ->
    state = placesReducer null, type: 'initialize'

    (expect state.loading).to.be.false
    (expect state.placeInfo).to.deep.equal []
    (expect state.placesByName).to.deep.equal {}
    (expect state.tags).to.deep.equal []

  it 'should set the status to loading when the places list is fetched', ->
    state = placesReducer null,
      type: Actions.PLACES_LIST
      meta: { promise: true }

    (expect state.loading).to.be.true

  it 'should store place information and map them by name', ->
    state = placesReducer null,
      type: Actions.PLACES_LIST
      payload: places

    (expect state.placeInfo).to.equal places
    (expect _.keys state.placesByName).to.deep.equal [ 'First', 'Second', 'Last' ]
    (expect state.placesByName.First).to.equal places[0]

  it 'should extract the available place tags', ->
    state = placesReducer null,
      type: Actions.PLACES_LIST
      payload: places

    (expect state.tags).to.deep.equal [ 'one', 'two' ]
