require 'test_helper'

class MappingServiceTest < Test::Unit::TestCase
  should "generate a map" do
    service = Resolvr::MappingService.new ""
    map = service.generate
    assert_equal Resolvr::Map, map.class
  end

  context "When initialized with nil, MappingService" do
    should "return an empty map" do
      service = Resolvr::MappingService.new nil
      map = service.generate
      assert_equal Resolvr::Map, map.class
    end
  end

  context "When initialized with an empty string, MappingService" do
    should "return an empty map" do
      service = Resolvr::MappingService.new ""
      map = service.generate
      assert_equal Resolvr::Map, map.class
    end
  end

  context "When initialized with whitespace, MappingService" do
    should "return an empty map" do
      service = Resolvr::MappingService.new "    "
      map = service.generate
      assert_equal Resolvr::Map, map.class
    end
  end

  context "When initialized with string of mapping data, MappingService" do
    should "create a map containing symbols" do
      service = Resolvr::MappingService.new "Foo => Bar
                       String => Cheese"
      map = service.generate
      assert map.has_key? :Foo
      assert map.has_key? :String
      assert map.has_value? :Bar
      assert map.has_value? :Cheese
    end

    should "create a map containing the data" do
      service = Resolvr::MappingService.new "Foo => Bar
                       String => Cheese"
      map = service.generate
      assert_equal :Bar, map[:Foo]
      assert_equal :Cheese, map[:String]
    end
  end
end
