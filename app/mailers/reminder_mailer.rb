class ReminderMailer < ApplicationMailer
  def reminder_email(reminder)
    @reminder = reminder
    @user = reminder.project.user
    @project = reminder.project
    mail(to: @user.email, subject: "[Flightplan Reminder]: '#{@reminder.name}' is due for '#{@project.name}'")
  end
end
