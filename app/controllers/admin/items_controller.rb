class Admin::ItemsController < ApplicationController

def index
 @items = Item.all
# @item = Item.find(@items)
 @items = @items.page(params[:page])
end

def new
 @item = Item.new
end

def show
 @item = Item.find(params[:id])
 @items = @items.page(params[:page])
end

def create
 @item = Item.new(item_params)
 @item.save
 redirect_to admin_items_path(@item)
end

def update
 @item = Item.find(params[:id])
end

private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
