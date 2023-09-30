class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    #@show_new_chatroom = Chatroom.find(params[:id])
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    @chatroom.save

    redirect_to chatroom_path(@chatroom)
  end

  def no_messages
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :admin_id)
  end
end
