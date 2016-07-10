class AddPostIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :post, index: true, foreign_key: true
  end
end
