get '/users/new' do
  if request.xhr?
    p "YES"
    erb :'users/_new.html', layout: false
  else
    erb :'users/_new.html' ,layout:true
  end
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
  p "*" * 10
  p params
  @user = User.new(params[:user])
  if @user && params[:user][:password].length > 0
    if @user.save #if variable saved in conditional, that obj will be saved
      login(@user)
      if request.xhr?
        erb :"users/show.html", layout: false
      else
        redirect "/users/#{@user.id}"
      end
    else
      @errors = @user.errors.full_messages
    # TODO Show the user a descriptive error message
      erb :"/users/_new.html"
    end
  else
    @errors = "Password must be entered."
    erb :"/users/_new.html"
  end
end

#user profile page
