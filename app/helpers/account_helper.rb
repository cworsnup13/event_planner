module AccountHelper

  def loadAccounts()
    query =  current_user.accounts.to_i
    @accounts=Account.find(query) unless current_user.accounts.nil?
  end

end

