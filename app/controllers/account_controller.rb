class AccountController < ApplicationController


def index 
  query =  current_user.accounts.to_i 
  @accounts=Account.find(query) unless current_user.accounts.nil?
  if @accounts.colorScheme.nil?
    @colorArray = ['#f','#f','#f','#f','#f']
  else
    @colorArray = @accounts.colorScheme.split(",")
  end
  if current_user.is_admin?
    redirect_to action: 'admin_index' 
    return
  end
  render :template => 'account/index'
end

def admin_index
  if !current_user.is_admin?
    flash[:alert]= "Unauthorized Access"
    redirect_to action: 'index', :alert => "Unauthorized Access"
    return
  end
  @closed = false
  @closed = true if params[:status] == "true"
  unless params[:resolved].nil?
    @resolved = params[:resolved]
    form = ContactForm.find(@resolved.to_i)
    form.resolved = !@closed
    render :template => 'account/admin_home' if form.save
  else
    # log form save error
    render :template => 'account/admin_home'
  end
end

def delete_form
  if !current_user.is_admin?
  redirect_to action: 'index', :alert => "Unauthorized Access"
  else
  form = ContactForm.find(params[:form].to_i)
  form.archived = true
  redirect_to action: 'admin_index', :notice => "form deleted" if form.save
  end
end

def tempMakeAdmin
  if current_user.email == "admin@admin.com"
     current_user.is_admin = true
     flash[:notice] = "made an admin"
  end
  redirect_to action: 'index' if current_user.save
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
unless params[:vendor_1].nil?
  query =  current_user.accounts.to_i
  @accounts=Account.find(query)
  @accounts.vendors = "My VENDOR" 
 flash[:notice]="Vendors Updated" if @accounts.save
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
