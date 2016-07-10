class AddPhotoIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :photo, index: true, foreign_key: true
  end
end
