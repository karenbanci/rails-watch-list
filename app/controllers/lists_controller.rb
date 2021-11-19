class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # list_path eh a url e @list eh o model
      redirect_to list_path(@list), notice: 'List was successfully created'
    else
      render :new
    end
  end

  private
  # o metodo abaixo pertence ao metodo show, ele vai mostrar pelo id
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
