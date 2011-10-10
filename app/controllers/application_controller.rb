class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'instagram'

  #TODO - is this the right place for these?
  if Rails.env.development?
    CALLBACK_URL = "http://localhost:3000/login"
    CLIENT_ID = "b91ac9d30d814251b62dfa87df40b356"
    CLIENT_SECRET = "fd6595543bdc411a921002cf0f67bb66"
  elsif Rails.env.production?
    CALLBACK_URL = "http://www.hashfeed.com"
    CLIENT_ID = "b803b6ed097646c5a9830a98d3150e50"
    CLIENT_SECRET = "a1ae2461a34c4278a9027010db9f84a5"
  else
    #There is no test environment...
    CALLBACK_URL = ""
    CLIENT_ID = ""
    CLIENT_SECRET = ""
  end

  Instagram.configure do |config|
    config.client_id = CLIENT_ID
    config.client_secret = CLIENT_SECRET
  end

end
