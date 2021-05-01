class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address , :string
    add_column :users, :gender, :string
    add_column :users, :occupation, :string
  end
end
