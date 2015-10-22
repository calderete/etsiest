require "etsiest/version"
require "sinatra/base"
require "etsy"
require "pry"
require "etsiest/version"


module Etsiest
	class Search < Sinatra::Base
		include Etsy
		set :logging, true
      	set :auth_key, "#{ENV["AUTH_KEY"]}"

      get "/" do
      Etsy.api_key = "#{settings.auth_key}"
      list = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], 
      									   :keywords => 'whiskey')
      binding.pry
      erb :index, locals: { items: @data }
  	  
  	  end

  	  run! if app_file == $0
  	 
  	end

end
