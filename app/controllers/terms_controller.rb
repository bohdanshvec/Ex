class TermsController < ApplicationController
  before_action :set_product
  before_action :set_term, only: %i[edit update destroy]

  def new
    @term = @product.terms.build
  end

  def create
    @term = @product.terms.build(term_params)

    if @term.save
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: "Term was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Term was successfully created." }
      end
      # redirect_to product_path(@product), notice: "Date was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # byebug
  end

  def update
    if @term.update(term_params)
      respond_to do |format|
        format.html { redirect_to roduct_path(@product), notice: 'Date updated!' }
        format.turbo_stream { flash.now[:notice] = 'Date updated!'}
      end
      # redirect_to product_path(@product), notice: 'Date udated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @term.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@product), notice: 'Date deleted!' }
      format.turbo_stream { flash.now[:notice] = 'Date deleted!' }
    end
    # redirect_to product_path(@product), notice: 'Date destroy!'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_term
    @term = Term.find(params[:id])
  end

  def term_params
    params.require(:term).permit(:date)
  end
end