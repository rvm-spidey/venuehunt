class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        msgcontent: render_to_string(partial: "msgcontent", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def index
    @user = User.find(current_user.id)
    @chatrooms_user = @user.chatrooms.uniq

    @latest_messages = Message.where(user_id: 8)
                        .group(:chatroom_id)
                        .select('chatroom_id, MAX(id) AS latest_message_id')
                        .order('latest_message_id DESC')

                        @latest_messages.each do |message|
                          puts "Chatroom ID: #{message.chatroom_id}, Latest Message ID: #{message.latest_message_id}"
                        end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
