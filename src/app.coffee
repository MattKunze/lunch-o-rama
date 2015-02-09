UI = React.createFactory require './ui'
placeList = require './places.json'


React.render (UI { placeList }),
  document.querySelector '#app'
