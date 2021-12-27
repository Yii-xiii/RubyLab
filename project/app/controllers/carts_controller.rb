class CartsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show edit update destroy create create_order]
  before_action :set_cart, only: %i[ show edit update destroy]

  # GET /carts or /carts.json
  def index
    @carts = current_user.carts.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = current_user.carts.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = current_user.carts.new(cart_params)


    # respond_to do |format|
      if @cart.save
        redirect_to product_path(cart_params[:product_id]), notice: "Added successfully."
      #   format.html { redirect_to @cart, notice: "Cart was successfully created." }
      #   format.json { render :show, status: :created, location: @cart }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    puts cart_params[:quantity]
    # respond_to do |format|
      if cart_params[:quantity].to_i > 0 && @cart.update(cart_params)
        redirect_to carts_path, notice: "Updated successfully."
      #   format.html { redirect_to @cart, notice: "Cart was successfully updated." }
      #   format.json { render :show, status: :ok, location: @cart }
      else
        redirect_to carts_path
      #   format.html { render :edit, status: :unprocessable_entity }
      #   format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    redirect_to carts_path, notice: "Deleted successfully."
    # respond_to do |format|
    #   format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  def create_order
    puts params
    @carts = current_user.carts.all
    @items = []
    @carts.each do |cart|
      if params[cart.id.to_s] == "on"
        @items += [{cart_id: cart.id, quantity: cart.quantity, spec_id: cart.spec_id}]
      end
    end
    if @items.length == 0
      redirect_to carts_path, notice: "No product is selected."
    else
      redirect_to new_order_path(items: @items)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_id, :quantity, :amount, :spec)
    end
end
