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
        <Header />
        <TagList />
        <PlacesList />
      </div>
    );
  }
});

module.exports = Root;
