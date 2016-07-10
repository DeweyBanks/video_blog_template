class RemovePhotoIdFromPost < ActiveRecord::Migration
  def change
    remove_reference :posts, :photo, index: true, foreign_key: true
  end
end
