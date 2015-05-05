require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a default archived value of false" do
    list = List.create(title: 'test')

    expect(list.archived).to eq(false)
  end

  it "can find unarchived lists" do
    List.create(title: 'test1')
    List.create(title: 'test2', archived: true)

    expect(List.unarchived.count).to eq(1)
  end

  it "can find archived lists" do
    List.create(title: 'test1')
    List.create(title: 'test2', archived: true)

    expect(List.archived.count).to eq(1)
  end

  it "can have many tasks" do
    list = List.create(title: 'test1')
    list.tasks << Task.create(title: 'test title', description: 'test description')

    expect(list.tasks.count).to eq(1)
    expect(list.tasks.first.title).to eq('test title')
    expect(list.tasks.first.description).to eq('test description')
  end

  it "can determine its incomplete and complete tasks" do
    list = List.create(title: 'test1')
    list.tasks << Task.create(title: 'test title1', description: 'test description1')
    list.tasks << Task.create(title: 'test title2', description: 'test description2', status: 'complete')

    expect(list.incomplete_tasks.count).to eq(1)
    expect(list.incomplete_tasks.first.title).to eq('test title1')
    expect(list.complete_tasks.count).to eq(1)
    expect(list.complete_tasks.first.title).to eq('test title2')
  end
end
