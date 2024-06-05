class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true

end
