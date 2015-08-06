chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'

chai.use chaiAsPromised
chai.use sinonChai
chai.should()

# register expect globally
global.chai = chai
global.sinon = sinon
global.expect = chai.expect
global.assert = chai.assert

# load the composite test suite
# See: http://webpack.github.io/docs/context.html#context-module-api
specRequire = require.context '.', true, /_spec.coffee$/
specRequire spec for spec in specRequire.keys()
