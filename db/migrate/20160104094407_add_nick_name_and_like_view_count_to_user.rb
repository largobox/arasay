class AddNickNameAndLikeViewCountToUser < ActiveRecord::Migration
  def change
  	add_column :users, :nick_name,        :string,  default: 'Anonymous'
  	add_column :users, :likes_counter,    :integer, default: 0
  	add_column :users, :comments_counter, :integer, default: 0
  end
end
