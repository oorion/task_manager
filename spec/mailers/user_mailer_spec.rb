require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  it "allows a user to email a task to themselves" do
    list = List.create(title: 'Test')
    list.tasks << Task.create(title: '/cc orion.osborn@gmail.com', description: 'task description')

    mail = UserMailer.send_email(list.tasks.first.title)

    expect(mail.subject).to eq(list.tasks.first.title)
    expect(mail.to[0]).to eq('orion.osborn@gmail.com')
  end
end
