class ItemsController < ApplicationController
  before_action :all_items, only: [:index, :create]
  respond_to :html, :js

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  
      else
        render :new
      end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item Removed"
    redirect_to items_path
  end

  protected

  def all_items
      @items = Item.all
    end

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
