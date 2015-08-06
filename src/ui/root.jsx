require('./root.less');

var PlacesList = require('./placeslist');
var TagList = require('./taglist');

var Root = React.createClass({
  propTypes: {
    store: React.PropTypes.object.isRequired,
    api: React.PropTypes.object.isRequired
  },
  childContextTypes: {
    store: React.PropTypes.object.isRequired,
    api: React.PropTypes.object.isRequired
  },
  getChildContext: function() {
    return {
      store: this.props.store,
      api: this.props.api
    }
  },
  componentDidMount: function() {
    var _this = this;
    this.props.store.subscribe(function() {
      _this.forceUpdate();
    });

    this.props.api.fetchPlaces()
      .then(function() {
        _this.props.api.applySearch();
      });
  },
  render: function() {
    var state = this.props.store.getState();

    return (
      <div className="lunch-o-rama">
        <h1>Lunch-O-Rama!</h1>
        <PlacesList />
        <TagList />
        <button onClick={this.props.api.selectPlace}>Let's Eat</button>
      </div>
    );
  }
});

module.exports = Root;
