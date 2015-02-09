{ ul, li } = React.DOM
{ classSet } = React.addons

TagList = React.createClass
  displayName: 'TagList'

  propTypes:
    allTags: React.PropTypes.array
    filterTags: React.PropTypes.array
    addFilterTag: React.PropTypes.func.isRequired
    removeFilterTag: React.PropTypes.func.isRequired

  render: ->
    ul className: 'tag-list',
      for tag in @props.allTags
        selected = (_.indexOf @props.filterTags, tag) >= 0
        li
          key: tag
          className: (classSet { selected} )
          onClick: if selected
            _.bind @props.removeFilterTag, @, tag
          else
            _.bind @props.addFilterTag, @, tag
        ,
          tag

module.exports = TagList
