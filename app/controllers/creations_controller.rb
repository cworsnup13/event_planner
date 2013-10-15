class CreationsController < ApplicationController

  def index
    show
  end
  
  def show
    @projectname = params[:projectid].nil? ? "project0" : "project#{params[:projectid]}" 
    render :template => 'creations/index'  
  end
end
