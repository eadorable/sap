class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    @message.save
    # redirect_to activity_path(@chatroom.activity)
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
    )
    head :ok # dont show anything on the page
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
