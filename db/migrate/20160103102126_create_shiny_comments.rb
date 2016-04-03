class CreateShinyComments < ActiveRecord::Migration
  def change
    create_table :shiny_comments do |t|
    	t.text       :body
    	t.integer    :likes,   default: 0
    	t.belongs_to :article, index: true
    	t.belongs_to :user,    index: true 
    	t.belongs_to :comment, index: true
      t.timestamps null: false
    end
  end
end
