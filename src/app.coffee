Root = React.createFactory require './ui/root'
{ bindActionCreators } = require 'redux'

# the store is the single source of truth for application state
store = require './redux/store'

# build an API that contains a collection of functions that represent the
# intent to mutate state within the application. this is the only way events
# in the user interface can trigger behavior
actions = require './redux/actions'
api = bindActionCreators actions, store.dispatch

# render the initial UI and give it access to the store and api. subsequent
# updates will be triggered by state changes in the store
React.render (Root { store, api }),
  document.querySelector '#app'
