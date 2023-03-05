class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :destroy]

def index
  @items = Item.all.order("created_at DESC")
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  if @item.save
     redirect_to root_path
  else
    render :new
  end
end

def show
end

def edit
<<<<<<< HEAD
  if @item.user_id == current_user.id && @item.order.nil?
  else
     redirect_to root_path
  end
=======
>>>>>>> 808e169af8448d3a1abd14ce423bbba0b229b399
end

def update
  if @item.update(item_params)
     redirect_to item_path
  else
     render :edit
  end
end

def destroy
  @item.destroy 
  redirect_to root_path
end

private
def item_params
   params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_state_id, :delivery_burden_id, :delivery_area_id, :delivery_day_id, :item_price).merge(user_id: current_user.id)
end

def set_item
   @item = Item.find(params[:id])
end

def move_to_root
 if @item.user_id != current_user.id
    redirect_to root_path
 end
end

end
