class ApplicationController < ActionController::Base
  Date.beginning_of_week = :sunday
 
  # protect_from_forgery prepend: true
end
