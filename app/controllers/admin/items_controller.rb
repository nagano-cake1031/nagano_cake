class Admin::ItemsController < ApplicationController

def new
 @item = Item.new
 @item_image = Item.new
end

def create
 @item_image = @Item_image.new(params[:id])
 @item_image = Item.new(params)
 @item_image.save
 redirect_to admin_items_pat
end

def update
 @item = Item.find(params[:id])
end

private

  def item_params
    params.require(:item).permit(:name, :item_image, :introduction, :price)
  end

end
