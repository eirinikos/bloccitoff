class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(items_param)
    if @item.save
      redirect_to profile_path
      flash[:notice] = "\"#{@item.name}\" has been added to your to-do list!"
    else
      redirect_to profile_path
      flash[:error] = "Please enter something."
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" has been removed from your to-do list!"
    else
      flash[:error] = "\"#{@item.name}\" couldn't be removed."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def items_param
    params.require(:item).permit(:name)
  end
end
