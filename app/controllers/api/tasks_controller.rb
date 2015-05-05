class Api::TasksController < ApplicationController
  respond_to :json

  def show
    @task = Task.find(params[:id])
    respond_with @task
  end

  def index
    respond_with Task.all
  end
end
