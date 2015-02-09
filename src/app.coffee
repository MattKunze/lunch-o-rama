UI = React.createFactory require './ui'


# app state
placeList = require './places.json'
isWorking = false;
selectedPlace = null;

pickPlace = ->
  timeout = 1

  isWorking = true
  shuffle placeList

  iterate = ->
    placeList.push placeList.shift()
    if timeout < 1000
      timeout += timeout * 2;
      _.delay iterate, timeout
    else
      isWorking = false
      selectedPlace = placeList[0].name
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

render = ->
  React.render (UI { placeList, isWorking, selectedPlace, pickPlace }),
    document.querySelector '#app'

render()
