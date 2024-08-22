class AddNotifiedToReminders < ActiveRecord::Migration[7.2]
  def change
    add_column :reminders, :notified, :boolean, default: false, null: false
  end
end
