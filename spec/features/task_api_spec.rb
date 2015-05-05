require 'rails_helper'

RSpec.describe "Tasks Api", type: :feature do
  describe "tasks api" do
    xit "allows a user to get a specific task using the api" do
      connection = Faraday.new(url: "https://task-manager-orion.herokuapp.com/api")
      response = connection.get("tasks/1")
      body = JSON.parse(response.body)

      expect(body['title']).to eq('first task title')
    end
  end
end
