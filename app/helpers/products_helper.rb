include ActionView::RecordIdentifier

module ProductsHelper
  # def total_price
  #   total_price = 0
  #   @product.terms.each do |term|
  #     term.positions.each do |position|
  #       total_position = position.quantity * position.unit_price
  #       total_price += total_position
  #     end
  #   end
  #   total_price
  # end

  def render_turbo_stream_total_prace
    turbo_stream.update :total, partial: 'products/total'
  end
end