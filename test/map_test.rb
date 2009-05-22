require 'test_helper'

class MapTest < Test::Unit::TestCase
  should "behave like a hash" do
    map = Resolvr::Map.new
    map[:foo] = 'bar'
    map[:bar] = :baz

    assert_equal 'bar', map[:foo]
    assert_equal :baz, map[:bar]
  end
end
