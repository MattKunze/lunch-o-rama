{ createStore } = require 'redux'
{ Actions } = require '../constants'

actions = require './actions'
middleware = require './middleware'

testStore = (initialState = {}) ->
  # build a simple store with our dispatcher middleware along with an
  # additional entry that spies on dispatch calls
  spy = new sinon.spy
  spyMiddleware = ->
    (next) -> (action) ->
      spy action
      next action
  mw = middleware spyMiddleware
  store = (mw createStore) (state = initialState) -> state
  _.assign store, dispatchSpy: spy

describe 'Actions', ->

  it 'should dispatch actions to add search tags with the current place info', ->
    state =
      places: { placeInfo: [ 'First', 'Second' ] }
    store = testStore state

    store.dispatch actions.addSearchTag 'something'
    store.dispatchSpy.should.have.been.calledOnce
    store.dispatchSpy.should.have.been.calledWith
      type: Actions.ADD_TAG
      payload:
        tag: 'something'
        placeInfo: state.places.placeInfo

  it 'should dispatch actions to remove search tags with the current place info', ->
    state =
      places: { placeInfo: [ 'First', 'Second' ] }
    store = testStore state

    store.dispatch actions.removeSearchTag 'something'
    store.dispatchSpy.should.have.been.calledOnce
    store.dispatchSpy.should.have.been.calledWith
      type: Actions.REMOVE_TAG
      payload:
        tag: 'something'
        placeInfo: state.places.placeInfo
