class AccountController < ApplicationController


def index 
  if current_user.is_admin?
    redirect_to :controller => 'admin', :action => 'index' 
    return
  end
  query =  current_user.accounts.to_i 
  @accounts=Account.find(query) unless current_user.accounts.nil?
  if @accounts.colorScheme.nil?
    @colorArray = ['#f','#f','#f','#f','#f']
  else
    @colorArray = @accounts.colorScheme.split(",")
  end
  render :template => 'account/index'
end

def eventIndex
  query =  current_user.accounts.to_i
  @accounts=Account.find(query) unless current_user.accounts.nil?
  render :template => 'account/eventIndex'
end

def createEvent
  account=Account.new
  account.eventName = params[:name]
  account.eventDate = params[:date]
  account.attendeeCount = params[:attendeeCount]
  account.notes = params[:desc]
  account.userID = current_user.id
  account.save
  current_user.accounts =  "#{account.id}"
  redirect_to :action => 'index' if account.save && current_user.save
end

def colorscheme
  query =  current_user.accounts.to_i
  @accounts=Account.find(query)
  if params[:color0].nil?
    if @accounts.colorScheme.nil?
      @colorArray = ['#f','#f','#f','#f','#f']
    else
      @colorArray = @accounts.colorScheme.split(",")
    end
    render :template => 'account/colorscheme'
  else 
    colorString = ""
    for i in 0..4 do
      colorString << params["color#{i}"]+","
    end
    colorString.chop
    @accounts.colorScheme = colorString
    @colorArray = @accounts.colorScheme.split(",")
    render :template => 'account/colorscheme' if @accounts.save
  end
end

def vendorlist 
  query =  current_user.accounts.to_i
  @accounts=Account.find(query)
unless params[:vendor_1].nil?
i = 1
saveList = ""
while !params["vendor_#{i}"].nil?
  saveList << params["vendor_#{i}"]
  saveList << ","
  i+=1
end
@accounts.vendors = saveList
@accounts.save
flash[:notice]="Vendors Updated" if @accounts.save
end
unless @accounts.vendors.nil?
  @vendorList = @accounts.vendors.split(",")
end
render :template => 'account/vendorlist'
end

def userIndex
render :template => 'account/accountDetails'
end

def userEdit
  current_user.first_name = params[:firstName]
  current_user.last_name = params[:lastName]
  current_user.email = params[:email]
  redirect_to :action => 'index' if current_user.save
end

end
