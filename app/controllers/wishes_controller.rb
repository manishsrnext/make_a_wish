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
    @wish = Wish.last
    if @wish.present?
      WishProduct.create(product_id: params[:id],  wish_id: @wish.id )
      respond_to do |format|
        format.js { render layout: false, content_type: 'text/javascript' }
      end
    else
      create_wish
      WishProduct.create(product_id: params[:wish][:product_id], wish_id: @wish.id )
      respond_to do |format|
        format.js { render js: "alert('not able to add product to wish');" }
      end
    end
  end


  def remove_product
    @product = Product.find_by_id(params[:id])
    @wish = Wish.last
  
    if @product.present?
      @wish.products.delete(@product)
      respond_to do |format|
        format.js { render layout: false, content_type: 'text/javascript' }
      end
    else
      respond_to do |format|
        format.js { render js: "alert('Product or wish not found');" }
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
      @wish = Wish.new(sender_id: 1)
      @wish.status = "pending"
      @wish.save
    end
end
