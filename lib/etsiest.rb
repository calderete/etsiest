require "etsiest/version"
require "sinatra/base"
require "etsy"
require "pry"
require "etsiest/version"

Etsy.api_key = ENV['ETSY_KEY']
module Etsiest
	class Search < Sinatra::Base
		set :logging, true
      

      get "/search" do
      item = params["query"]
      listings = Etsy::Request.get('listings/active', :includes => ['Images', 'Shop'], 
      									   :keywords => "item")
      erb :index, locals: { query: params["query"]}
  	  
  	  end

  	  run! if app_file == $0
  	 
  	end

end
