class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :reload_rails_admin, :if => :rails_admin_path?
  before_action :authenticate_user!
  # before_filter :check_for_video_crunch
  private

  def reload_rails_admin
    models = %W(User UserProfile)
    models.each do |m|
      RailsAdmin::Config.reset_model(m)
    end
    RailsAdmin::Config::Actions.reset

    load("#{Rails.root}/config/initializers/rails_admin.rb")
  end

  def rails_admin_path?
    controller_path =~ /admin/ && Rails.env == "development"
  end

  # def check_for_video_crunch
  #   if Post.where(:video_processing => true).each do |s|
  #     flash[:video_messages] = Array.new
  #     flash[:video_messages] << "Video file is currently proccessing for #{s.title}."
  #   end.empty?
  #   end
  # end

end
