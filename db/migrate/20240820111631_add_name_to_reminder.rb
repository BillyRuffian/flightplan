class AddNameToReminder < ActiveRecord::Migration[7.2]
  def change
    add_column :reminders, :name, :string
  end
end
