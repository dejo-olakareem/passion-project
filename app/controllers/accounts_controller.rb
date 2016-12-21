get '/accounts/new' do
  erb :"accounts/new.html"
end

post '/accounts' do
  @account = Account.create(params[:account])
  @user = current_user
  @user.update(account_id: @account.id)
  redirect "/users/#{@user.id}"
end
