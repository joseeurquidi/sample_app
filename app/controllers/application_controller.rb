class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def render_404
	  respond_to do |format|
	    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
	    format.xml  { head :not_found }
	    format.any  { head :not_found }
	  end
  end
end
