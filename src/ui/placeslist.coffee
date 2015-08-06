{ connect } = require 'react-redux'
{ Status } = require '../constants'

cx = require 'classnames'
{ div, span, ul, li, a, i, p } = React.DOM

select = (state) ->
  filteredPlaces: state.search.filteredPlaces

  places = _.map state.search.filteredPlaces, (name) ->
    state.places.placesByName[name]

  searchStatus: state.search.status
  places: places

PlacesList = (connect select) React.createClass
  displayName: 'PlacesList'

  render: ->
    ul className: 'places-list collection',
      for place, index in @props.places
        selected = index is 0 and @props.searchStatus is Status.SELECTED
        li
          key: place.name
          className: cx 'collection-item avatar', active: selected
        ,
          i className: 'material-icons circle green', 'check' if selected
          span className: 'title', place.name
          p null, place.tags.join ' - '

module.exports = PlacesList
