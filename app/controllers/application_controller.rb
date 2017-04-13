class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def home
      render text: "This is the Homepage"
  end
end
