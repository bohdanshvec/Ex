class Term < ApplicationRecord
  belongs_to :product
  has_many :positions, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :product_id}

  scope :ordered, -> { order(date: :asc)}

  # broadcasts_to ->(term) { [term.product, :terms] }, inserts_by: :append
  # after_create_commit -> { broadcast_prepend_to :terms, partial: "terms/term", target: :terms }

  # def previous_date
  #   product.terms.ordered.where("date < ?", date).last
  # end

  def previous_date(product, term)
    product.terms.ordered.where('date < ?', term.date).last
  end

end
