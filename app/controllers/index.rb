get '/'do
  @messages = Message.order(created_at: :desc)
  erb :"index.html"
end
