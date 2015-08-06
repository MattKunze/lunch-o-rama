Root = React.createFactory require './ui/root'
{ bindActionCreators } = require 'redux'

store = require './redux/store'
actions = require './redux/actions'

api = bindActionCreators actions, store.dispatch

React.render (Root { store, api }),
  document.querySelector '#app'
