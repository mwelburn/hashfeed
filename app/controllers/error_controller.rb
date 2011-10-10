class ErrorController < ApplicationController

  #page doesn't exist
  def routing
   render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
