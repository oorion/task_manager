class UserMailer < ApplicationMailer
  default from: 'do-not-reply@example.com'

  def send_email(task_title)
    email = find_email(task_title)
    mail( to: email, subject: task_title )
  end

  private

  def find_email(title)
    title.chars[4..-1].join("")
  end
end
