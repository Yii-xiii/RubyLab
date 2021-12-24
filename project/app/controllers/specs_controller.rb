class SpecsController < ApplicationController
  before_action :set_spec, only: %i[ show edit update destroy ]
  before_action :set_product

  # GET /specs or /specs.json
  def index
    @specs = @product.specs.all
  end

  # GET /specs/1 or /specs/1.json
  def show
  end

  # GET /specs/new
  def new
    @spec = @product.specs.new
  end

  # GET /specs/1/edit
  def edit
  end

  # POST /specs or /specs.json
  def create
    @spec = @product.specs.new(spec_params)

    # respond_to do |format|
      if @spec.save
        redirect_to product_spec_path(@product,@spec), notice: "Spec was successfully created."
        # format.html { redirect_to @spec, notice: "Spec was successfully created." }
        # format.json { render :show, status: :created, location: @spec }
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /specs/1 or /specs/1.json
  def update
    # respond_to do |format|
      if @spec.update(spec_params)
        redirect_to product_spec_path(@product,@spec), notice: "Spec was successfully updated."
        # format.html { redirect_to @spec, notice: "Spec was successfully updated." }
        # format.json { render :show, status: :ok, location: @spec }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /specs/1 or /specs/1.json
  def destroy
    @spec.destroy
    redirect_to product_specs_path(@product), notice: "Spec was successfully destroyed."
    # respond_to do |format|
    #   format.html { redirect_to specs_url, notice: "Spec was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spec_params
      params.require(:spec).permit(:title, :product)
    end
end
