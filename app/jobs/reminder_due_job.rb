class ReminderDueJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'Checking for reminders due today'
    Reminder.where(start_date: Date.today, notified: false).each do |reminder|
      ReminderMailer.reminder_email(reminder).deliver_later
      reminder.notified = true
      reminder.save
    end
  end
end
