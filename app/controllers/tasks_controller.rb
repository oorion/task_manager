class TasksController < ApplicationController
  def new
  end

  def create
    list = List.find(params[:list_id])
    list.tasks << Task.create(task_params)
    if task_params[:title].start_with?("/cc")
      UserMailer.send_email(task_params[:title]).deliver_now
    end
    redirect_to list_path(list.id)
  end

  def update
    task = Task.find(params[:id])
    task.update(update_task_params)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def update_task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end
end
