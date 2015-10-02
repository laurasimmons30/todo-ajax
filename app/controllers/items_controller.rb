class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "Item added to List"
        redirect_to items_path
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

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
