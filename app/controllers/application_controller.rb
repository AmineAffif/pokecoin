class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location = stored_location_for(resource)
    stored_location || root_path
  end
end