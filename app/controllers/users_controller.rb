get '/users/new' do
  erb :'users/new.html'
end


#post registration form
get '/users/:id' do
  @user = User.find(params[:id])
  # if user is trying to view their own page, let 'em'
  if current_user == @user
    erb :"/users/show.html"
  end
end

post '/users' do

  @user = User.new(params[:user])

  if @user.save #if variable saved in conditional, that obj will be saved
    login(@user)
    redirect "/users/#{@user.id}"
else
  # TODO Show the user a descriptive error message
  redirect '/'
end
end

#user profile page
