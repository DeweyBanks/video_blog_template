class RemoveVideoFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :video_file_name, :string
    remove_column :posts, :video_content_type, :string
    remove_column :posts, :video_file_size, :integer
    remove_column :posts, :video_updated_at, :datetime
  end
end
