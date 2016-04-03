class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string     :title
    	t.string     :topic
      t.string     :preview
      t.text       :body
			t.integer    :like_counter,     default: 0
			t.integer    :view_counter,    default: 0
			t.integer    :comment_counter, default: 0
      t.boolean    :ended,           default: false
      t.timestamps null: false
    end
  end
end
