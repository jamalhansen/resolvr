require 'container'
require 'class_not_mapped_error'
require 'mapping_service'
require 'map'

module Resolvr
  def mapping= mapping
    #TODO make container accept mapping on initialize
    @container = Resolvr::Container.new
    @container.mapping = mapping
  end

  def resolve klass
    @container ||= Resolvr::Container.new
    @container.resolve klass
  end
end