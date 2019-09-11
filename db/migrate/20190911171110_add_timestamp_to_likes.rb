class AddTimestampToLikes < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :likes, null: false
  end
end
