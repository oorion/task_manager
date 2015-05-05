require 'rails_helper'

RSpec.describe Task, type: :model do
  it "belongs to a list" do
    list = List.create(title: 'list title')
    task = Task.create(list_id: list.id)

    expect(Task.count).to eq(1)
    expect(task.list).to eq(list)
  end

  it "has a default status of incomplete" do
    list = List.create(title: 'list title')
    task = Task.create(list_id: list.id)

    expect(task.status).to eq('incomplete')
  end
end
