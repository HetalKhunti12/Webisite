class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  layout "homepage"

  private

  def current_user
   	@current_user = Contact.find(current_contact.id) if current_contact
  end
  helper_method :current_user
end
