class ProfPic
  include Mongoid::Document

	mount_uploader :image, type: Picture

  field :name, type: String
  field :description, type: String
  field :picture, type: File
end
