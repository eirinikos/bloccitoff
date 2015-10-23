class ItemsController < ApplicationController
  def create
    @user = current_user
    @items = @user.items

    @item = Item.new(items_param)
  end

  private

  def items_param
    params.require(:item).permit(:name)
  end
end
