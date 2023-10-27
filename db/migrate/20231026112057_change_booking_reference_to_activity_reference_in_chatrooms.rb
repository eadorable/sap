class ChangeBookingReferenceToActivityReferenceInChatrooms < ActiveRecord::Migration[7.0]
  def change
    remove_reference :chatrooms, :booking, foreign_key: true
    add_reference :chatrooms, :activity, foreign_key: true
  end
end
