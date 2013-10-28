require 'bcrypt'

class Post 

  include Mongoid::Document

belongs_to :user 

field :post_title, type: String
field :description, type: String
field :status, type: String
field :points, type: String



end
