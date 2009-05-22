require 'test_helper'

class ResolvrTest < Test::Unit::TestCase
  context "Resolver is a mixin that" do
    should "resolve instances of classes" do
      container = TestContainer.new

      instance = container.resolve String
      assert_equal String, instance.class
    end

    should "pass the request on to the container class" do
      container = MockContainer.new

      instance = container.resolve String
      assert_equal 1, container.times_resolve_called
      assert_equal String, container.resolve_called_for_class
    end
  end
end
