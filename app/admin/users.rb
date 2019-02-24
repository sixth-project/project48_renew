ActiveAdmin.register User do
  #permit_params :name, :profile

  #index do #Active_adminの管理画面で表示するカラムを限定する
  #selectable_column
  #column :id
  #column :name
  #column :email
  #column :profile
  #column :role
  #end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
