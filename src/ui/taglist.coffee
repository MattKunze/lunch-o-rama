{ connect } = require 'react-redux'

{ ul, li } = React.DOM

select = (state) ->
  tags: state.places.tags
  searchTags: state.search.searchTags

TagList = (connect select) React.createClass
  displayName: 'TagList'

  contextTypes:
    api: React.PropTypes.object.isRequired

  render: ->
    ul className: 'tag-list',
      for tag in @props.tags
        inSearch = _.contains @props.searchTags, tag
        li
          key: tag
          onClick: if inSearch
            _.bind @context.api.removeSearchTag, null, tag
          else
            _.bind @context.api.addSearchTag, null, tag
        , "#{if inSearch then '+ ' else ''}#{tag}"

module.exports = TagList
