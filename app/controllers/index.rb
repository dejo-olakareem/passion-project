get '/'do
  @users = User.all
  erb :"index.html"
end
