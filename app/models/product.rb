class Product < ApplicationRecord

  has_many :terms, dependent: :destroy
  belongs_to :company
  
  has_many :positions, through: :terms

  validates :title, presence: true, length: { minimum: 2 }
  # validates :body, presence: true, length: { minimum: 2 }
  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "products" }
  # after_update_commit -> { broadcast_replace_later_to "products" }
  # after_destroy_commit -> { broadcast_remove_to "products" }

  broadcasts_to -> (product) { 'products' }, inserts_by: :prepend

  def total_price
    positions.sum(&:total_price)
  end
end
