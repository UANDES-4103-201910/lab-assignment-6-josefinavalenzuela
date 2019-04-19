class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
	    @user = User.new(params.require(:registrations).permit(:name, :last_name, :email, :password, :phone))

	    if @user.save
	      flash[:notice] = "User created!"
	      redirect_to 'http://localhost:3000'
	    
	    else
	      flash[:danger] = "User could not be created."

	      render 'new'
	    end
	end
end
