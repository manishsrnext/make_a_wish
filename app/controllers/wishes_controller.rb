class WishesController < ApplicationController
  
  def index
    @wish = Wish.last
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def new
    @wish = Wish.new
  end

  def create
    create_wish
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])

    if @wish.update(wish_params)
      redirect_to @wish
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    redirect_to root_path, status: :see_other
  end

  def add_product
    if params[:wish_id].present?
      WishProduct.create(product_id: params[:wish][:product_id], wish_id: params[:wish][:wish_id])
      respond_to do |format|
        format.json { render json: { id: @wish.id } }
      end
    else
      create_wish
      WishProduct.create(product_id: params[:wish][:product_id], wish_id: @wish.id )
      respond_to do |format|
        format.json { render json: { id: @wish.id } }
      end
    end
  end

  def get_wish_products
    @wish.products
  end

  # def send_wish_to_user
  #   @wish.products
  # end

  private
  
    def create_wish
      @wish = Wish.new(sender_id: 1, receiver_id: 2)
      @wish.status = "pending"
      @wish.save
    end
end
