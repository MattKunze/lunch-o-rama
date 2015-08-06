{ connect } = require 'react-redux'

{ ul, li } = React.DOM

select = (state) ->
  filteredPlaces: state.search.filteredPlaces

PlacesList = (connect select) React.createClass
  displayName: 'PlacesList'

  render: ->
    ul className: 'places-list',
      for place in @props.filteredPlaces
        li key: place, place

module.exports = PlacesList
