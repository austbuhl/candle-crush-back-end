class ChangeTypeToUserType < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :type, :user_type
  end
end
