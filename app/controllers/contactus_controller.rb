class ContactusController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def index
  end

  def create
	@contact = Contact.new(contact_params)

	if @contact.save
		flash[:success] = "Your message has been sent successfully!"
		redirect_to root_path
	else
		render 'new'
	end
  end

  private
  def contact_params
  	params.require(:contact).permit(:name, :profession, :email, :message)
  end 
end
