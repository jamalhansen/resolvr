$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
require 'resolvr'

class TestContainer
  include Resolvr
end
