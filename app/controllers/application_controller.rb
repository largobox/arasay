class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def about
  	render template: 'footer/about'
  end

  def contacts
  	render template: 'footer/contacts'
  end
end