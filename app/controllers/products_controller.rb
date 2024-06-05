class ProductsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_product!, only: %i[edit update show destroy]

  def index
    @products = current_company.products.ordered
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_company.products.build(product_params)

    if @product.save
      respond_to do |format|
        format.html { redirect_to products_path, notice: "Product was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Product was successfully created." }
      end
      # redirect_to products_path(anchor: dom_id(@product))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @terms = @product.terms.ordered
  end

  def edit; end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to products_path, notice: "Product was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Product was successfully updated." }
      end
      # flash[:notice] = 'Product was successfully updated.'
      # redirect_to products_path(anchor: dom_id(@product))
      # byebug
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Product was successfully destroyed." }
    end
  end

  private

  def set_product!
    @product = current_company.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :body)
  end
end