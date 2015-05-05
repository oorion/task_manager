require 'rails_helper'

RSpec.describe "Tasks", type: :feature do
  describe "tasks" do
    it "allows a user to create new tasks" do
      list = List.create(title: 'Test')
      visit root_path

      click_link_or_button('Test')
      click_link_or_button('Create New Task')
      fill_in('task[title]', with: 'test title')
      fill_in('task[description]', with: 'test description')
      fill_in('task[due_date]', with: '05/10/2015')
      click_link_or_button('Create Task')

      expect(current_path).to eq(list_path(list.id))
      expect(page).to have_content('test title')
      expect(page).to have_content('test description')
      expect(page).to have_content('2015-10-05')
    end

    it "allows a user can update the status of a task without reloading page" do
      list = List.create(title: 'Test')
      list.tasks << Task.create(
                                title: 'task title',
                                description: 'task description',
                                due_date: '05/10/2015'
                               )
      visit list_path(list.id)

      select 'complete', from: 'task[status]'
      click_link_or_button 'Update Task'

      expect(current_path).to eq(list_path(list.id))
      expect(list.tasks.first.status).to eq('complete')
      expect(page).to_not have_content('task title')
      expect(page).to_not have_content('task description')
      expect(page).to_not have_content('2015-10-05')
    end
  end
end
