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
  @accounts=Account.find(params[:account])
  if @accounts.colorScheme.nil?
    @colorArray = ['#f','#f','#f','#f','#f']
  else
    @colorArray = @accounts.colorScheme.split(",")
  end
  render :template => 'admin/accountView'
end

def tempMakeAdmin
  if current_user.email == "admin@admin.com"
     current_user.is_admin = true
     flash[:notice] = "made an admin"
  end
  redirect_to action: 'index' if current_user.save
end

end
