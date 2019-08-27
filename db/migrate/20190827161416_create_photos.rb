class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :picture
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
