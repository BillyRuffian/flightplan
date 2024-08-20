class RemoveTopicFromReminders < ActiveRecord::Migration[7.2]
  def change
    remove_column :reminders, :topic, :text
  end
end
