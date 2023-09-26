class MessagesController < ApplicationController

  skip_before_action :initialize_chatroom!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save!
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        # msgcontent: render_to_string(partial: "msgcontent", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def index
    @chatrooms = []
    if current_user.admin?
     @chatrooms = Chatroom.where(admin_id: current_user.id)
    end

    @latest_messages = Message.where(user_id: current_user.id)
                        .group(:chatroom_id)
                        .select('chatroom_id, MAX(id) AS latest_message_id')
                        .order('latest_message_id DESC')
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
