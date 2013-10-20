class AccountController < ApplicationController


def index
  @closed = false
  @closed = true if params[:status] == "true"
  unless params[:resolved].nil?
  @resolved = params[:resolved]
  form = ContactForm.find(@resolved.to_i)
  form.resolved = !@closed
  render :template => 'account/index' if form.save
  else
  render :template => 'account/index'
  end
end

end
