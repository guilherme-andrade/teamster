module ClassMappings
  include ActiveSupport::Concern

  included do
    @@class_mappings = {}

    def classes; end
  end
end
