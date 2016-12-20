get '/sessions/new' do

  erb :'sessions/new.html'

end

#post login form
post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user &&  User.authenticate( params[:email],params[:password]) #create new session
   # redirect '/sessions' #redirect back to sessions index page
   login(@user)
    redirect :"/users/#{@user.id}"
  else
    erb :'sessions/new.html' # show new sessions view again(potentially displaying errors)
  end

end

#logout
delete '/sessions' do

  logout
  redirect '/'

end
