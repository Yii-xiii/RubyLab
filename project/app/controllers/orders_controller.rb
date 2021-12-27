class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ create new show index update destroy edit]

  # GET /orders or /orders.json
  def index
    if current_user.seller?
      @orders = Order.all
    else 
      @orders = current_user.orders.all
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    

    respond_to do |format|
      if @order.save
        @items = params[:items]
        @items.each do |item|
          @item = JSON.parse(item)
          @spec = Spec.find(@item["spec_id"])
          @product = Product.find(@spec.product_id)

          if @item["cart_id"] 
            @cart = Cart.find(@item["cart_id"])
            @cart.destroy
          end

          @productOrder = @order.productOrders.new()
          @productOrder.order = @order
          @productOrder.spec_id = @spec.id
          @productOrder.product_id = @product.id
          @productOrder.quantity = @item["quantity"]
          @productOrder.amount = @item["quantity"].to_i * @product.price
          @productOrder.save!

          @product.sold += @item["quantity"].to_i
          @product.save
        end
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :name, :address, :phone_number, :postcode, :status, :datetime)
    end
end
