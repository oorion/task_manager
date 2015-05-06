class Api::TasksController < ApplicationController
  respond_to :json

  def show
    @task = Task.find(params[:id])
    respond_with @task
  end

  def index
    respond_with Task.all
  end

  def update
    task = Task.find(params[:id])
    task.update_status
    respond_with task
  end
end
