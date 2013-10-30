class ProfPic
  include Mongoid::Document



  field :name, type: String
  field :description, type: String
  field :picture, type: File
end
