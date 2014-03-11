class Resources::MemorySerializer < ActiveModel::Serializer
  self.root = false

  attributes :atom_used, :binary
end
