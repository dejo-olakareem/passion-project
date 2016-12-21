get "/users/:user_id/messages/new" do
  @user = User.find(params[:user_id])
  erb :"messages/new.html"
end


post '/users/:user_id/messages' do
  @user = User.find(params[:user_id])
  @message = @user.messages.new(params[:message])
  if @message.save
    redirect "/"
  else
    erb :"messages/new.html" #show new messages view again(potentially displaying errors)
  end
end



# get '/users/:user_id/messages/:id' do
#   @user = User.find(params[:user_id])
#   @message = @user.messages.find(params[:id])
#   erb :"messages/show.html"
# end


get '/users/:user_id/messages/:id/edit' do

  @user = User.find(params[:user_id])

  @message = @user.messages.find(params[:id])

  erb :"messages/edit.html"

end


put '/messages/:id' do
  #get params from url
  @message = Message.find(params[:id]) #define variable to edit
  @message.assign_attributes(params[:message]) #assign new attributes
  if @message.save #saves new message or returns false if unsuccessful
    redirect '/messages' #redirect back to messages index page
  else
    erb :'messages/edit' #show edit message view again(potentially displaying errors)
  end
end



delete '/messages/:id' do
  #get params from url
  @message = Message.find(params[:id]) #define message to delete
  @message.destroy #delete message
  redirect '/messages' #redirect back to messages index page
end
