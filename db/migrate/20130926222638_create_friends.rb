class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name, :null => false
      t.float :latitude, :null => false
      t.float :longitude, :null => false

      t.timestamps
    end
  end
end
