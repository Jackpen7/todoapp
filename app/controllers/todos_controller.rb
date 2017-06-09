class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Task was created successfully!"
      redirect_to todo_path(@todo)
    else 
      render 'new'
    end
  end
  
  def show

  end
  
  def edit

  end
  
  def update

    if @todo.update(todo_params)
      flash[:notice] = "Task was sucessfully updated!"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  def index
    @todos = Todo.all
  end
  
  def destroy

    @todo.destroy
    flash[:notice] = "Task was sucessfully deleted!"
    redirect_to todos_path
  end
  
  private 
    
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
end