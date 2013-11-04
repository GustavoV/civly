require 'bcrypt'

class Post 

  include Mongoid::Document

belongs_to :user 

field :post_title, type: String
field :description, type: String
field :status, type: String
field :points, type: String
field :total_points, type: Integer

field :lat, type: Float
field :lon, type: Float

field :hero_lat, type: Float
field :hero_lon, type: Float

end
