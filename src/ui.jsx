require('./ui.less');

var PlaceList = require('./placelist');
var TagList = require('./taglist');

var UI = React.createClass({
  propTypes: {
    placeList: React.PropTypes.array.isRequired,
    selectedPlace: React.PropTypes.string,
    isWorking: React.PropTypes.bool,
    allTags: React.PropTypes.array,
    filterTags: React.PropTypes.array,
    pickPlace: React.PropTypes.func.isRequired,
    addFilterTag: React.PropTypes.func.isRequired,
    removeFilterTag: React.PropTypes.func.isRequired
  },
  render: function() {
    var firstFive = _(this.props.placeList).pluck('name').take(5).value();

    return (
      <div className="lunch-o-rama">
        <h1>Lunch-O-Rama!</h1>
        <PlaceList
          placeNames={firstFive}
          selectedPlace={this.props.selectedPlace} />
        <TagList
          allTags={this.props.allTags}
          filterTags={this.props.filterTags}
          addFilterTag={this.props.addFilterTag}
          removeFilterTag={this.props.removeFilterTag} />
        <button onClick={this.props.pickPlace} disabled={this.props.isWorking}>
          Let's Eat!
        </button>
      </div>
    );
  }
});

module.exports = UI;
