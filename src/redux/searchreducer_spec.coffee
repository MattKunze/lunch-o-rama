{ Actions, Status } = require '../constants'
searchReducer = require './searchreducer'

describe 'Search Reducer', ->

  it 'should provide initial state', ->
    state = searchReducer null, type: 'initialize'

    (expect state.status).to.equal Status.IDLE

  it 'should add tags to the list to filter places', ->
    state = searchReducer searchTags: [ 'first' ],
      type: Actions.ADD_TAG
      payload: { tag: 'second', placeInfo: [] }

    (expect state.searchTags).to.deep.equal [ 'first', 'second' ]

  it 'should not modify state when adding tags already in the list', ->
    current = searchTags: [ 'first' ]
    state = searchReducer current,
      type: Actions.ADD_TAG
      payload: { tag: 'first', placeInfo: [] }

    (expect state).to.equal current
    (expect state.searchTags).to.deep.equal [ 'first' ]

  it 'should remove tags to the list to filter places', ->
    state = searchReducer searchTags: [ 'first', 'second' ],
      type: Actions.REMOVE_TAG
      payload: { tag: 'second', placeInfo: [] }

    (expect state.searchTags).to.deep.equal [ 'first' ]
