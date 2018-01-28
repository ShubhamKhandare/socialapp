class CreateHearts < ActiveRecord::Migration[5.1]
  def change
    create_table :hearts do |t|
    	t.belongs_to :micropost, index: true
    	t.belongs_to :user, index: true
      	t.timestamps
    end
    # add_index :hearts, [:micropost, :user], unique: true
  end
end
