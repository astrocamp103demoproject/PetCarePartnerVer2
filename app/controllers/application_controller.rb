class ApplicationController < ActionController::Base
  before_action :get_current_sitter
  Date.beginning_of_week = :sunday
 
  # protect_from_forgery prepend: true
  private
  def get_current_sitter
    if user_signed_in?
      @current_sitter = Sitter.find_by(name: current_user.name)
      # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    else
      @current_sitter = nil
    end
  end
end
