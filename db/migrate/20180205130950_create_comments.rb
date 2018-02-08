class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id
      # t.integer :parent_id 

      t.timestamps
    end
  end
end
