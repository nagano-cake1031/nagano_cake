class Public::HomesController < ApplicationController

def top
  @items = Item.all
  @item = @items.page(params[:page])
end

end