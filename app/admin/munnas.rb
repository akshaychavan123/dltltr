ActiveAdmin.register Munna do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :age, :role , :image
  
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :age
        f.input :image, as: :file
      end
      
      f.actions
    end

    show do |munna|
      attributes_table do
        row :name
        row :age
        row :image do
          image_tag munna.image.url
        end
      end
    end

  index do 
    selectable_column
    column :name
    column :age
    column :image
    actions
  end
  
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :age, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
