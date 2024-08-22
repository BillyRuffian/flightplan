# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def reminder_email
    ReminderMailer.reminder_email(Reminder.first)
  end
end
