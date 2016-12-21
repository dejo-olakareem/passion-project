get '/'do
  @users = User.all
  @messages = Message.all
  erb :"index.html"
end
