class MainController < ApplicationController
  def index
  end
  def viewAbout
    render :template => 'main/about' 
    user = Client.new
    user.name = "Tester"
    user.save
  end
  def viewContact
    render :template => 'main/contact' 
  end
end