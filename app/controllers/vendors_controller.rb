class VendorsController < ApplicationController

def index
  show
end

def show
  if
    @vendortype = params[:vendortype]
    #render :template => "vendors/#{@vendortype}/content"
    render :template => "vendors/#{@vendortype}"# WIll become one stop
  else
    render :template => 'vendors/index'   
  end
end
end
