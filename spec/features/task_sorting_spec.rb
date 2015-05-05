require 'rails_helper'

RSpec.describe "Task Sorting", type: :feature do
  describe "task sorting" do
    it "allows a user to sort all incomplete tasks by title" do
      list = List.create(title: 'list title')
      list.tasks << Task.create(
                                title: 'first task title',
                                description: 'first task description',
                                due_date: '05/10/2015'
                               )
      list.tasks << Task.create(
                                title: 'second task title',
                                description: 'second task description',
                                due_date: '05/10/2015'
                               )
      
    end
  end
end
