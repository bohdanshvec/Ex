class Term < ApplicationRecord
  belongs_to :product
  has_many :positions, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :product_id}

  scope :ordered, -> { order(date: :asc)}

  # def previous_date
  #   product.terms.ordered.where("date < ?", date).last
  # end

  def previous_date(product, term)
    product.terms.ordered.where('date < ?', term.date).last
  end

end
