module Resolvr
  class MappingService
    def initialize mapping
      @mapping = mapping
    end

    def generate
      map = Resolvr::Map.new
      add_mapping_to map
      map
    end

    def add_mapping_to map
      if @mapping
        lines = @mapping.split(/$/).map { |line| line.strip }

        lines.each do |line|
          matches = /(\w*) => (\w*)/.match line
          map[matches[1].to_sym] = matches[2].to_sym if matches
        end
      end
    end
  end
end
