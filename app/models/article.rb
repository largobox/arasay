class Article < ActiveRecord::Base

  has_many :shiny_comments
  has_and_belongs_to_many :heros

  has_attached_file :article_pic, styles: { normal: '640x396>' }, default_url: 'article_default.jpg'
  validates_attachment_content_type :article_pic, content_type: /\Aimage\/.*\Z/
  
end
