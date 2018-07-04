class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  include DeviseBlacklist

  before_action :set_source 

  def set_source 
    return session[:source]= params[:q] if params[:q]
  end

end
