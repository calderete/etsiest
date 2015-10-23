require "etsiest/version"
require "sinatra/base"
require "etsy"
require "pry"



module Etsiest
	class Search < Sinatra::Base
		#include Etsy
		set :logging, true
    set :auth_key, "#{ENV["AUTH_KEY"]}"

      get "/search" do
      Etsy.api_key = "#{settings.auth_key}"
      list = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], 
      									   :keywords => 'whiskey')
      @image_list = []
      response = list.result
      response.each do |i|
        binding.pry
        item = { 
          line: i["Images"]}
          #binding.pry
          item[:line].each do |p|
            pic = p["url_fullxfull"]
        @image_list.push(pic)

        end
      end
      
      
      erb :index, locals: { items: @image_list }
  	  
  	  end

  	  run! if app_file == $0
  	 
  	end

end
