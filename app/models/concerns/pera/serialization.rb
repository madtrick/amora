module PERA::Serialization
  extend ActiveSupport::Concern

  # Required by ActiveModel::Serializer
  def read_attribute_for_serialization(attribute)
    send attribute
  end
end
