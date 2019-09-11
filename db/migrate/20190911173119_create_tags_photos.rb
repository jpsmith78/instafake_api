class CreateTagsPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_photos do |t|
      t.integer :tag_id
      t.integer :photo_id
    end
  end
end
