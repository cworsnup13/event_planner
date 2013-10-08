class MainController < ApplicationController
  def index
  end
  def viewAbout
    render :template => 'main/about' 
  end
  def viewContact
    render :template => 'main/contact' 
  end
end
