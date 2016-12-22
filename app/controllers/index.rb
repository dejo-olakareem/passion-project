get '/'do
@messages = Message.all
  # @messages = Message.order(created_at: :desc)
  erb :"index.html"
end
