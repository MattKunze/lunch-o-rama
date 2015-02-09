UI = React.createFactory require './ui'
require './ui.less'

# app state
allPlaces = require './places.json'
filteredPlaces = allPlaces
isWorking = false;
selectedPlace = null;
filterTags = []

pickPlace = ->
  timeout = 1

  isWorking = true
  shuffle filteredPlaces

  iterate = ->
    filteredPlaces.push filteredPlaces.shift()
    if timeout < 1000
      timeout += timeout * 2;
      _.delay iterate, timeout
    else
      isWorking = false
      selectedPlace = filteredPlaces[0].name
    render()

  iterate()

shuffle = (array) ->
  currentIndex = array.length

  while currentIndex isnt 0
    randomIndex = Math.floor Math.random() * currentIndex
    currentIndex -= 1

    temporaryValue = array[currentIndex]
    array[currentIndex] = array[randomIndex]
    array[randomIndex] = temporaryValue

  array

addFilterTag = (tag) ->
  filterTags.push tag
  applyFilter()
  render()

removeFilterTag = (tag) ->
  filterTags = _.without filterTags, tag
  applyFilter()
  render()

applyFilter = ->
  filteredPlaces = if filterTags.length
    _.filter allPlaces, (test) ->
      (_.intersection filterTags, test.tags).length
  else
    allPlaces

render = ->
  allTags = (_ allPlaces)
    .pluck 'tags'
    .flatten()
    .uniq()
    .sort()
    .value()

  React.render (UI {
    placeList: filteredPlaces
    isWorking
    selectedPlace
    allTags
    filterTags
    pickPlace
    addFilterTag
    removeFilterTag
  }),
    document.querySelector '#app'

render()
