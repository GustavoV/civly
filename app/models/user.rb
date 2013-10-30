require 'bcrypt'

class User 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Mongoid::Document

  attr_accessor :password, :password_confirmation

  #this is all authentication stuff
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :salt, type: String
  field :hashed_password, type: String
  field :user_points, type: Integer, default: 10

  #this is for posts
  has_many :posts, :order => "created_at DESC"

  #this is for user total points
  # has_many :points

  #Profile Photo Uploader
  # mount_uploader :prof_pics, ProfilePhotoUploader

  # This will tell us what regions to show on the map
  # has_and_belongs_to_many :ugroups, class_name:"Group", inverse_of: :gusers

  validates :email, presence: true
  validates_presence_of :first_name
  validates_uniqueness_of :first_name, :email, :case_sensitive => false

  before_save :hash_password  

 def authenticate(password)
  self.hashed_password ==
  BCrypt::Engine.hash_secret(password, self.salt)
 end

 private
 def hash_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.hashed_password = 
    BCrypt::Engine.hash_secret(password, self.salt)
    password = password_confirmation = nil
  end
 end

end
