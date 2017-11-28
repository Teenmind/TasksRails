class TasksController < ApplicationController

  def index
    @tasks = Task.all
    render 'tasks/index'
  end

  def create
    Task.create(task_create_params)
    redirect_to '/'
  end

  def edit
    @task = Task.find_by(id:params[:id])
    unless @task
      redirect_to '/'
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    if task && params[:task]
      task.update!(task_update_params)
    end
    redirect_to '/'
  end

  def delete
    task = Task.find_by(id: params[:id])
    if task
      task.destroy!
    end
    redirect_to '/'
  end

  def task_create_params
    params.require(:task).permit(:name, :description)
  end

  def task_update_params
    params.require(:task).permit(:name, :description)
  end
end


# создать репозиторий на гите и запушить на хероку
# пофиксить update
# воспользоваться гемом device и добавить авторизацию
# чтоб таски выдавались для конкретного пользователя индивидуально