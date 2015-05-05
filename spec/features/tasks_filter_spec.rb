require 'rails_helper'

RSpec.describe "Task Filtering", type: :feature do
  describe "task filtering" do
    xit "allows a user filter by task title" do
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
      save_and_open_page
      fill_in('search', with: 'first')

      expect(page).to have_content('first task title')
      expect(page).to_not have_content('second task title')
    end
  end
end
