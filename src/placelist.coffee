{ ul, li } = React.DOM

PlaceList = React.createClass
  displayName: 'PlaceList'

  propTypes:
    placeNames: React.PropTypes.array.isRequired

  render: ->
    ul className: 'place-list',
      for name, index in @props.placeNames
        li key: name, name

module.exports = PlaceList
