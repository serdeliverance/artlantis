class PaintsController < ApplicationController
  	def index
      @user = User.find(params[:user_id]) 
  	end

  	def new
      @user = User.find(params[:user_id])
  		@paint = Paint.new
  	end

  	def create
      @user = User.find(params[:user_id])
      @paint = @user.paints.create(paint_params)

  		if @paint.save
  			flash[:notice] = "the painting has been uploaded successfully"
  			redirect_to user_path(@user)
		  else
	       flash[:notice] = "the painting hasn't been uploaded"
			   redirect_to edit_user_path(@user)
		  end
    end
  	
  	def show
      @user = User.find(params[:user_id])
      @paint = Paint.find(params[:id]) 
  	end

  	private
	  	def paint_params
	  		params.require(:paint).permit(:title, :description, :paint, :price, :pieces, :week)
	  	end
end
