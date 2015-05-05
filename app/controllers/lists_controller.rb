class ListsController < ApplicationController
  def index
    @lists = List.unarchived
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to root_path
    else
      @list = List.new
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(update_list_params)
    redirect_to list_path(list.id)
    #else
      #@list = List.find(params[:id])
      #render :edit
    #end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy if list
    redirect_to lists_path
  end

  def archived_lists
    @lists = List.archived
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def update_list_params
    ulp = params.require(:list).permit(:title, :archived)
    ulp[:archived] == 'archive' ? ulp[:archived] = true : ulp[:archived] = false
    ulp
  end
end
