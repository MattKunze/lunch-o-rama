require('./ui.less');

var PlaceList = require('./placelist');

var UI = React.createClass({
  propTypes: {
    placeList: React.PropTypes.array.isRequired,
    selectedPlace: React.PropTypes.string,
    isWorking: React.PropTypes.bool,
    pickPlace: React.PropTypes.func.isRequired
  },
  render: function() {
    var firstFive = _(this.props.placeList).pluck('name').take(5).value();

    return (
      <div className="lunch-o-rama">
        <h1>Lunch-O-Rama!</h1>
        <PlaceList
          placeNames={firstFive}
          selectedPlace={this.props.selectedPlace} />
        <button onClick={this.props.pickPlace} disabled={this.props.isWorking}>
          Let's Eat!
        </button>
      </div>
    );
  }
});

module.exports = UI;
