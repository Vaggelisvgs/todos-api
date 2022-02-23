class ItemsController < ApplicationController
    before_action :set_todo
    before_action :set_todo_item, only: [:show, :update, :destroy]
  
    # GET /todos/:todo_id/items
    # returns items of a todo list
    def index
      json_response(@todo.items)
    end
  
    # GET /todos/:todo_id/items/:id
    # returns sepcific item from a todo list
    def show
      json_response(@item)
    end
  
    # POST /todos/:todo_id/items
    # create item in a todo list
    def create
      @todo.items.create!(item_params)
      json_response(@todo, :created)
    end
  
    # PUT /todos/:todo_id/items/:id
    # update item in a todo list
    def update
      @item.update(item_params)
      head :no_content
    end
  
    # DELETE /todos/:todo_id/items/:id
    # delete specific item from a todo list
    def destroy
      @item.destroy
      head :no_content
    end
  
    private
    #required values
    def item_params
      params.permit(:name, :done)
    end

    #find todo by id
    def set_todo
      @todo = Todo.find(params[:todo_id])
    end

    # find item by id if todo was found
    def set_todo_item
      @item = @todo.items.find_by!(id: params[:id]) if @todo
    end
  end
