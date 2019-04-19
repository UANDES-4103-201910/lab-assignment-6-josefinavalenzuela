class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		contador = 0
		for user in User.all
			if user[:email] == params[:session][:email].downcase
				contador = 1
			end
		end

		if contador == 0
		  flash[:danger] = 'Invalid email/password'
	      render 'new'
	    else


	    	user = User.find_by(email: params[:session][:email].downcase)

		    if user[:password] == params[:session][:password]
		      log_in user
		      redirect_to user
		    else
		      flash[:danger] = 'Invalid email/password'
		      render 'new'
		    end
		end
	end

	def destroy
		#complete this method
		log_out
    	redirect_to root_url
	end
end
