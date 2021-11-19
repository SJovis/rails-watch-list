class ListsController < ApplicationController
  before_action :find_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
