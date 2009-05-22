require 'test_helper'

class ContainerTest < Test::Unit::TestCase
  def setup
    @container = Resolvr::Container.new
  end

  context "When calling resolve, Container" do
    should "accept a class" do
      instance = @container.resolve String
      assert_equal String, instance.class
    end

    should "accept a string" do
      instance = @container.resolve 'String'
      assert_equal String, instance.class
    end

    should "accept a symbol" do
      instance = @container.resolve :String
      assert_equal String, instance.class
    end
  end

  context "When an NameError is thrown, Container" do
    should "throw Resolver::ClassNotMappedError" do
      container = Resolvr::Container.new

      begin
        instance = container.resolve :Foo
        flunk "should have thrown an error but returned #{instance.class} of value #{instance.to_s}"
      rescue Resolvr::ClassNotMappedError => error
        assert true # this is what we want
      end
    end
  end

  context "When accepting mapping, Container" do
    should "accept mapping" do
      container = Resolvr::Container.new
      container.mapping = "Foo => String"
      instance = container.resolve :Foo
      assert_equal String, instance.class
    end

    should "accept mapping on initialize" do
      container = Resolvr::Container.new "Foo => String"
      instance = container.resolve :Foo
      assert_equal String, instance.class
    end
    
    should "not overwrite existing mapping" do
      container = Resolvr::Container.new "Foo => String"
      container.mapping = "Bar => Hash"
      assert_equal String, container.resolve(:Foo).class
      assert_equal Hash, container.resolve(:Bar).class
    end
  end
end
