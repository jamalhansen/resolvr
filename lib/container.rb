module Resolvr
  class Container
    def initialize mapping=nil
      mapping_service = Resolvr::MappingService.new mapping
      @map = mapping_service.generate
    end

    def resolve class_name
      if class_name.class == Class
        return resolve_from_class class_name
      else
        return resolve_from class_name
      end
    end

    def resolve_from_class klass
      klass.new
    end

    def resolve_from class_name
      class_name = @map[class_name] if @map.has_key? class_name
      
      class_name = class_name.to_s

      if Object.const_defined? class_name.to_s
        klass = Object.const_get(class_name)
        return klass.new
      else
        raise Resolvr::ClassNotMappedError.new
      end
    end

    def mapping= mapping
      mapping_service = Resolvr::MappingService.new mapping
      @map.update(mapping_service.generate)
    end
  end
end
