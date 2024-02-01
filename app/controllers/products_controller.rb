class ProductsController < ApplicationController

  def index
    byebug
    @products = Product.all
    @products = @products.where("product_name LIKE ?", "#{params[:search_params]}%") if params[:search_params].present?
  
    @products = @products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    
    @products = @products.where('price <= ?', params[:max_price]) if params[:max_price].present?
  
    @products = @products.where('price <= ?', '500') if params[:under_500] == '1'
  
    @products = @products.where('price >= ? AND price <= ?', '500', '1000') if params[:between_500_1000] == '1'
    @products = @products.where('price >= ? AND price <= ?', '1000', '5000') if params[:between_1000_5000] == '1'
  end
  
  
  def show
    @wish = Wish.last
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = product.find(params[:id])
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def product_params
      params.require(:product).permit(:price, :product_name, :description, :image)
    end
end
