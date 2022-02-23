class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
  
  # GET /todos
  def index
    # get logged user todos
    @todos = current_user.todos
    json_response(@todos)
  end

  # POST /todos
  def create
    # create a todo of logged user
    @todo = current_user.todos.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  # get a specific todo of logged user
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  # update a specific todo of logged user
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  # delete a specific todo of logged user
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  # required values
  def todo_params
  # whitelist params
    params.permit(:title)
  end
  
  # find todo by id
  def set_todo
    @todo = Todo.find(params[:id])
  end
end
