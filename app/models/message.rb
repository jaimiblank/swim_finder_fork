class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "chat_#{chat.id}_messages",
                        partial: "messages/message",
                        locals: { message:self }
  end
end
