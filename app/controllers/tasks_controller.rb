class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def toggle
    @task = Task.find(params[:id])

    if @task.update_attributes(:status => params[:status])
      render :nothing => true
    else
      render :nothing => true
    end
  end

  private

  def task_params
    params.require(:task).permit(:to_do, :status)
  end

end