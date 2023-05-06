class PapaSerializer < ActiveModel::Serializer
  attributes :id 
  # attributes :image if object.image.attached?
  # def image
  #   object.image
  # end
end
