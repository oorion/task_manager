require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a default archived value of false" do
    list = List.create(title: 'test')

    expect(list.archived).to eq(false)
  end

  it "can find unarchived lists" do
    list = List.create(title: 'test1')
    list = List.create(title: 'test2', archived: true)

    expect(List.unarchived.count).to eq(1)
  end

  it "can find archived lists" do
    list = List.create(title: 'test1')
    list = List.create(title: 'test2', archived: true)

    expect(List.archived.count).to eq(1)
  end
end
