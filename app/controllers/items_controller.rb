class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @user = current_user

    @item = @user.items.new(items_param)
    @item.user_id = current_user.id
    if @item.save
      redirect_to "/profile", notice: "Item has been saved."
    else
      redirect_to "/profile", notice: "Item failed to save."
    end
  end

  private

  def items_param
    params.require(:item).permit(:name)
  end
end
