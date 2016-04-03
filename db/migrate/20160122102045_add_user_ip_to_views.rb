class AddUserIpToViews < ActiveRecord::Migration
  def change
  	add_column :views, :client_ip, :string
  end
end
