require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fixtures/test_container'
require 'fixtures/mock_container'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'resolvr'

class Test::Unit::TestCase
end
