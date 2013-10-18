class AccountController < ApplicationController

#before_filter :authenticate_user!

def index

  render :template => 'account/index'
end

end
