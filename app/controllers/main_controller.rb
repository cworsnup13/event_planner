class MainController < ApplicationController
  def index
    render :template => 'main/index'
  end
  def viewAbout
    render :template => 'main/about' 
  end
  def viewContact
    render :template => 'main/contact' 
  end
 
  def acceptForm
    @contactname=params[:name]
    form = ContactForm.new
    form.name = @contactname
    form.email = params[:email]
    form.phone = params[:phone]
    render :template => 'main/contact' if form.save
  end
end
