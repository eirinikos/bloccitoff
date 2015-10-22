class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @items = @user.items

    @item = Item.new(items_param)
  end

  private

  def items_param
    params.require(:item).permit(:name)
  end
end
