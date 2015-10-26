class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(items_param)
    if @item.save
      redirect_to profile_path
      flash[:notice] = "Item has been saved!"
    else
      redirect_to profile_path
      flash[:error] = "Please enter an item."
    end
  end

  private

  def items_param
    params.require(:item).permit(:name)
  end
end
