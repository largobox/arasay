class User < ActiveRecord::Base
	
  has_many :shiny_comments
  has_many :likes
  has_many :views	  	
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :profile_pic, styles: { normal: "300x300>", small: "60x60>" }, default_url: "user_default.jpg"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
end
