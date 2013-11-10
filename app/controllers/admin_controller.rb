class AdminController < ApplicationController

def index
  if !current_user.is_admin?
    flash[:alert]= "Unauthorized Access"
    redirect_to :controller => 'account' ,:action => 'index', :alert => "Unauthorized Access"
    return 
  end 
  render :template => 'admin/admin_home'
end
 
def form_index
  @closed = false
  @closed = true if params[:status] == "true"
  unless params[:resolved].nil?
    @resolved = params[:resolved]
    form = ContactForm.find(@resolved.to_i)
    form.resolved = !@closed
    render :template => 'admin/contactFormTool' if form.save
  else
    # log form save error
    render :template => 'admin/contactFormTool'
  end
  
end

def customer
  @customers = User.all
  render :template => 'admin/customerTool'
end

def delete_form
  if !current_user.is_admin?
  redirect_to :controller => 'account ', :action => 'index', :alert => "Unauthorized Access"
  else
  form = ContactForm.find(params[:form].to_i)
  form.archived = true
  redirect_to action: 'form_index', :notice => "form deleted" if form.save
  end
end 

def viewAccount
  @accounts = Account.find(params[:account])
  @user = User.find(@accounts.userID)
  if @accounts.colorScheme.nil?
    @colorArray = ['#f','#f','#f','#f','#f']
  else
    @colorArray = @accounts.colorScheme.split(",")
  end
  render :template => 'admin/accountView'
end

def colorscheme
  @accounts=Account.find(params[:account])
  if params[:color0].nil?
    if @accounts.colorScheme.nil?
      @colorArray = ['#f','#f','#f','#f','#f']
    else
      @colorArray = @accounts.colorScheme.split(",")
    end
    render :template => 'admin/colorscheme' 
  else
    colorString = ""
    for i in 0..4 do
      colorString << params["color#{i}"]+","
    end
    colorString.chop
    @accounts.colorScheme = colorString
    @colorArray = @accounts.colorScheme.split(",")
    render :template => 'admin/colorscheme' if @accounts.save
  end
end

def vendorlist
  @accounts=Account.find(params[:account])
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
else
  @vendorList = []
end
render :template => 'admin/vendorlist'
end

def userIndex
  @accounts=Account.find(params[:account])
  @user = User.find(@accounts.userID)
  render :template => 'admin/accountDetails'
end

def userEdit
  @accounts=Account.find(params[:account])
  @user = User.find(@accounts.userID)
  @user.first_name = params[:firstName]
  @user.last_name = params[:lastName]
  @user.email = params[:email]
  redirect_to :action => 'viewAccount' if @user.save
end

def tempMakeAdmin
  if current_user.email == "admin@admin.com"
     current_user.is_admin = true
     flash[:notice] = "made an admin"
  end
  redirect_to action: 'index' if current_user.save
end

def eventIndex
  @accounts=Account.find(params[:account]) 
  render :template => 'admin/eventIndex'
end

end
