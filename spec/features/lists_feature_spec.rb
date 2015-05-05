require 'rails_helper'

RSpec.describe "Lists", type: :feature do
  describe "lists" do
    it "allows a user to create new lists" do
      visit root_path

      click_link_or_button("Create New List")
      fill_in('list[title]', with: 'test')
      click_link_or_button('Create List')

      expect(current_path).to eq(root_path)
      expect(page).to have_content('test')
    end

    it "allows a user to see unarchived lists by default" do
      List.create(title: 'test1')
      List.create(title: 'test2', archived: true)

      visit root_path

      expect(page).to have_content('test1')
      expect(page).to_not have_content('test2')
    end

    it "allows a user to see a lists show page with details" do
      list = List.create(title: 'test1')

      visit root_path
      click_link_or_button('test1')

      expect(current_path).to eq(list_path(list.id))
      expect(page).to have_content('test1')
    end

    it "allows a list to be edited" do
      list = List.create(title: 'test1')

      visit root_path
      click_link_or_button('test1')
      click_link_or_button('Edit List')
      fill_in('list[title]', with: 'test2')
      select "archive", from: "list[archived]"
      click_link_or_button('Update List')

      expect(current_path).to eq(list_path(list.id))
      expect(List.find(list.id).title).to eq('test2')
      expect(List.find(list.id).archived).to eq(true)
      expect(page).to have_content('test2')
    end

    it 'allows a user to see archived lists' do
      unarchived_list = List.create(title: 'test1')
      archived_list = List.create(title: 'test2', archived: true)

      visit root_path
      click_link_or_button('Archived Lists')

      expect(current_path).to eq(archived_lists_path)
      expect(page).to have_content(archived_list.title)
      expect(page).to_not have_content(unarchived_list.title)
    end

    it 'allows a user to delete a list from the archive' do
      archived_list = List.create(title: 'test2', archived: true)

      visit root_path
      click_link_or_button('Archived Lists')
      click_link_or_button('test2')
      click_link_or_button('Delete List')

      expect(current_path).to eq(lists_path)
      click_link_or_button('Archived Lists')
      expect(page).to_not have_content(archived_list.title)
    end

    it "doesn't show delete button on unarchived list" do
      List.create(title: 'test1')

      visit root_path
      click_link_or_button('test1')

      expect(page).to_not have_content('Delete List')
    end
  end
end
