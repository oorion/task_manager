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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      if task_params[:title].start_with?("/cc")
        UserMailer.send_email(task_params[:title]).deliver_now
      end
      redirect_to list_path(task.list.id)
    else
      flash[:error] = "Invalid information"
      redirect_to edit_list_task_path(list_id: task.list.id, id: task.id)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
