class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :likable, polymorphic: true, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :likes,[:user_id,:likable_id,:likable_type]
  end
end
