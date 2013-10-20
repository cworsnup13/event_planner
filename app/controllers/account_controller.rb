class AccountController < ApplicationController


def index
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

def tempMakeAdmin
  if current_user.email == "admin@admin.com"
     current_user.is_admin = true
     flash[:notice] = "made an admin"
  end
  redirect_to action: 'index' if current_user.save
end

end
