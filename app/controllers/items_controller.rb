class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(items_param)
    if @item.save
      redirect_to profile_path, notice: "Item has been saved."
    else
      redirect_to profile_path, notice: "Item failed to save."
    end
  end

  private

  def items_param
    params.require(:item).permit(:name)
  end
end
