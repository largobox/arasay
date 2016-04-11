ActiveAdmin.register Article do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :topic, :preview, :body, :ended, :article_pic, hero_ids: []

  form do |f|
		inputs 'Details' do
		  input :title
		  input :topic, as: :select, collection: ['Самопознание', 'Дети']
		  input :preview
		  input :body
		  input :ended
		  input :article_pic, as: :file, :hint => f.template.image_tag(f.object.article_pic.url(:normal))
    end
    actions
	end

	index do 
	  column :title	
	  column :topic
	  column :view_counter
	  column :comment_counter
	  column :ended
	  column :updated_at
	  actions
	end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
