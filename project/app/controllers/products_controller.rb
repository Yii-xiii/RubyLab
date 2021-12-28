class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit do update destroy]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @current = -1
    @specs = @product.specs.all
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @seller = User.find(current_user.id)
    @product = Product.new(product_params)
    @product.seller = @seller

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def do
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity]
    if params[:commit] == "Buy Now" 
        @item = {quantity: @quantity, spec_id: params[:spec_id]}
        redirect_to new_order_path(items: [@item]) 
    elsif params[:commit] == "Add to Cart"
      @user = User.find(current_user.id)
      puts @user.carts.includes(:spec).where("spec_id=" + params[:spec_id]).length
      if @user.carts.includes(:spec).where("spec_id=" + params[:spec_id]).length != 0
        @cart = @user.carts.includes(:spec).where("spec_id=" + params[:spec_id])[0]
        @cart.quantity = @cart.quantity + params[:quantity].to_i
        @cart.amount = @cart.quantity * @cart.product.price
        @cart.save
      else 
        @cart = current_user.carts.create({user_id: current_user.id, product_id: @product.id, quantity: @quantity, amount: ((@product.price) * @quantity.to_i), spec_id: params[:spec_id]})
      end

      redirect_to product_path(@product), notice: "Added to cart successfully."
      # redirect_to carts_path(cart: {user_id: current_user.id, product_id: @product.id, quantity: @quantity, amount:((@product.price) * @quantity.to_i), spec: params[:spec]}), method: :post
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :sold, :image, :seller_id)
    end
end
