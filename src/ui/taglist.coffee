{ connect } = require 'react-redux'

cx = require 'classnames'
{ div, span, a } = React.DOM

select = (state) ->
  tags: state.places.tags
  searchTags: state.search.searchTags

TagList = (connect select) React.createClass
  displayName: 'TagList'

  contextTypes:
    api: React.PropTypes.object.isRequired

  render: ->
    div className: 'tag-list',
      for tag in @props.tags
        inSearch = _.contains @props.searchTags, tag
        a
          key: tag
          className: cx 'waves-effect waves-teal',
            'btn': inSearch
            'btn-flat': not inSearch
          onClick: if inSearch
            _.bind @context.api.removeSearchTag, null, tag
          else
            _.bind @context.api.addSearchTag, null, tag
        , tag

module.exports = TagList
