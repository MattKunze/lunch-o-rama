require('./material');

var Header = require('./header');
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
    // fire API actions to initialize the application - first fetch the list
    // of place information, then apply an empty search to initially display
    // all the available places
    var _this = this;
    this.props.api.fetchPlaces()
      .then(function() {
        _this.props.api.applySearch();
      });
  },
  render: function() {
    return (
      <div className="lunch-o-rama">
        <Header />
        <TagList />
        <PlacesList />
      </div>
    );
  }
});

module.exports = Root;
