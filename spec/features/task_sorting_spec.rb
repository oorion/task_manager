require 'rails_helper'

RSpec.describe "Task Sorting", type: :feature do
  describe "task sorting" do
    xit "allows a user to sort all incomplete tasks by title" do
      list = List.create(title: 'list title')
      list.tasks << Task.create(
                                title: 'second task title',
                                description: 'second task description',
                                due_date: '05/10/2015'
                               )
      list.tasks << Task.create(
                                title: 'first task title',
                                description: 'first task description',
                                due_date: '05/10/2015'
                               )

      visit list_path(list.id)
      click_link_or_button("Sort by Title")

      within('.list-tasks') do
        expect(first('div')).to have_content('first task title')
      end
    end
  end
end
