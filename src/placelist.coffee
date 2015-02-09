{ ul, li } = React.DOM
{ classSet } = React.addons

PlaceList = React.createClass
  displayName: 'PlaceList'

  propTypes:
    placeNames: React.PropTypes.array.isRequired
    selectedPlace: React.PropTypes.string

  render: ->
    ul className: 'place-list',
      for name, index in @props.placeNames
        li
          key: name
          className: (classSet active: name is @props.selectedPlace)
        ,
          name

module.exports = PlaceList
