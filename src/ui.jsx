require('./ui.less');

var PlaceList = require('./placelist');

var UI = React.createClass({
  propTypes: {
    placeList: React.PropTypes.array.isRequired
  },
  render: function() {
    var firstFive = _(this.props.placeList).pluck('name').take(5).value();

    return (
      <div className="lunch-o-rama">
        <h1>Lunch-O-Rama!</h1>
        <PlaceList placeNames={firstFive} />
        <button>Let's Eat!</button>
      </div>
    );
  }
});

module.exports = UI;
