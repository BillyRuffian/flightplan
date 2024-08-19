class CreateReminders < ActiveRecord::Migration[7.2]
  def change
    create_table :reminders do |t|
      t.references :project, null: false, foreign_key: true
      t.date :start_date
      t.text :topic

      t.timestamps
    end
  end
end
