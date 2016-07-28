class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  # has_attached_file :video, styles: {
  #   :medium => {
  #     :geometry => "640x480",
  #     :format => 'mp4'
  #   },
  #   :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
  # }, :processors => [:transcoder]
  # validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

  def previous_post
    self.class.where(["created_at < ?", created_at]).last
  end

  def next_post
    self.class.where(["created_at > ?", created_at]).first
  end

end
