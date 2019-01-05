class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!

	def create
  		@client = Client.new(email: params[:email], password: params[:password], created_by: current_user.email  )
  		
  		if @client.save
    		redirect_to @client
    	else 
       		render 'new'
    	end
 	end

end
