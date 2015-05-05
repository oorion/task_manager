class TasksController < ApplicationController
  def new
  end

  def create
    list = List.find(params[:list_id])
    list.tasks << Task.create(task_params)
    redirect_to list_path(list.id)
  end

  def update
    task = Task.find(params[:id])
    if task.update(update_task_params)
      redirect_to list_path(params[:list_id])
    else
      flash[:error] = "An error occurred in updating the task"
      redirect_to list_path(params[:list_id])
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def update_task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end
end
