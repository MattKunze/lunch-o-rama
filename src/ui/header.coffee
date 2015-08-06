{ connect } = require 'react-redux'
{ Status } = require '../constants'

{ nav, div, ul, li, a, i } = React.DOM

select = (state) ->
  status: state.search.status

Header = (connect select) React.createClass
  displayName: 'PlacesList'

  contextTypes:
    api: React.PropTypes.object.isRequired

  render: ->
    nav null,
      div className: 'nav-wrapper',
        a className: 'brand-logo', 'Lunch-O-Rama'
        ul className: 'right',
          if @props.status is Status.SPINNING
            li style: { margin: '15px' },
              Spinner null
          else
            li null,
              a href: '#', onClick: @context.api.selectPlace,
                i className: 'material-icons', 'local_dining'

Spinner = React.createFactory React.createClass
  displayName: 'Spinner'

  render: ->
    div className: 'preloader-wrapper small active',
      div className: 'spinner-layer spinner-green-only',
        div className: 'circle-clipper left',
          div className: 'circle'
        div className: 'gap-patch',
          div className: 'circle'
        div className: 'circle-clipper right',
          div className: 'circle'

module.exports = Header
