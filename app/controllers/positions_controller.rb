class PositionsController < ApplicationController
  before_action :set_product
  before_action :set_term
  before_action :set_position, only: %i[edit update destroy]

  def new
    @position = @term.positions.build
  end

  def create
    @position = @term.positions.build(position_params)

    if @position.save
      redirect_to product_path(@product), notice: "Position was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @position.update(position_params)
      redirect_to product_path(@product), notice: 'Position updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @position.destroy
    redirect_to @product, notice: 'Position delete!'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_term
    @term = Term.find(params[:term_id])
  end

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name, :description, :quantity, :unit_price)
  end
end